using LibrarySystem.Contracts;
using LibrarySystem.Models;
using LibrarySystem.Models.DomainModels;
using LibrarySystem.Models.DTOs;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace LibrarySystem.Services
{
    public class Repository : IRepository
    {
        private readonly IConfiguration _configuration;
        private LibrarySystemContext _dbContext;
        public Repository() { }
        public Repository(IConfiguration configuration, LibrarySystemContext dbContext)
        {
            _configuration = configuration;
            _dbContext = dbContext;
        }

        public bool AddNewBook(AddBookDto book)
        {
            try
            {
                Book newBook = new Book
                {
                    Title = book.Title,
                    Description = book.Description,
                    Isbn = book.Isbn,
                    PageCount = book.PageCount,
                    PublishDate = book.PublishDate,
                    Publisher = book.Publisher,
                    Location = book.Location,
                };
                _dbContext.Books.Add(newBook);
                _dbContext.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<List<BookDto>> GetBooks()
        {
            List<BookDto> books = await _dbContext.Books.Select(bo=>new BookDto
            {
                Title= bo.Title,
                Description= bo.Description,
                Isbn=bo.Isbn,
                PublishDate=bo.PublishDate,
                Publisher=bo.Publisher,
                Status=bo.Status,
                Location=bo.Location
            }).ToListAsync();
            return books;
        }

        public List<CategoryDto> GetCategories()
        {
            List<CategoryDto> categories = _dbContext.Categories.Where(c=>c.MainCategory == null).Select(c=> new CategoryDto {Id= c.CategoryId,Name= c.Name}).ToList();
            return categories;
        }

        public List<CategoryDto> GetSubCategories(int catId)
        {
            List<CategoryDto> categories = _dbContext.Categories.Where(c => c.MainCategory == catId).Select(c => new CategoryDto { Id = c.CategoryId, Name = c.Name }).ToList();
            return categories;
        }

        public async Task<SearchResults> SearchBookEF(string searchTxt, int pgNum, int pgSize)
        {
            if (string.IsNullOrEmpty(searchTxt)) return new SearchResults();
            IQueryable<BookCategory> query = _dbContext.BookCategories
                .Include(bc => bc.Book)
                .Include(bc => bc.Category)
                .AsQueryable();
            query = query.Where(bc => bc.Book.Title.Contains(searchTxt) || 
                bc.Book.Description.Contains(searchTxt) || 
                bc.Book.Isbn.Contains(searchTxt) || 
                bc.Book.Publisher.Contains(searchTxt) || 
                bc.Category.Name.Contains(searchTxt));
            int reultsCount = await query.CountAsync();

            List<SearchBook> books = query
                .Select(b => new SearchBook
                {
                    BookId = b.BookId,
                    Title = b.Book.Title,
                    Description = b.Book.Description,
                    PublishDate = b.Book.PublishDate,
                    Publisher = b.Book.Publisher,
                    Isbn = b.Book.Isbn,
                    PageCount = b.Book.PageCount,
                    Status = b.Book.Status,
                    Location = b.Book.Location,
                    Category = b.Category.Name
                }).ToList();
            return new SearchResults
            {
                ResultsCount = reultsCount,
                Books = books
            };
        }

        public async Task<SearchResults> SearchBooksSP(string searchTxt, int pgNum, int pgSize)
        {
            SearchResults results = new SearchResults();
            using var connection = new SqlConnection(_configuration.GetConnectionString("SqlConnection"));
            using var command = new SqlCommand("BooksPagedSearch", connection)
            {
                CommandType = System.Data.CommandType.StoredProcedure,
            };
            command.Parameters.AddWithValue("@SearchTxt", searchTxt);
            command.Parameters.AddWithValue("@PgNo", pgNum);
            command.Parameters.AddWithValue("@PgSize", pgSize);

            var resultsCount = new SqlParameter("@ResultsCount", SqlDbType.Int)
            {
                Direction = ParameterDirection.Output
            };
            command.Parameters.Add(resultsCount);

            await connection.OpenAsync();
            using var reader = await command.ExecuteReaderAsync();

            while (await reader.ReadAsync())
            {
                results.Books.Add(new Models.SearchBook
                {
                    BookId = reader.GetInt32(0),
                    Title = reader.GetString(1),
                    Description= reader.GetString(2),
                    Isbn= reader.GetString(3),
                    PageCount= reader.GetInt32(4),
                    PublishDate=DateOnly.FromDateTime( reader.GetDateTime(5)),
                    Publisher= reader.GetString(6),
                    Status= reader.GetString(7),
                    Location= reader.GetString(8),
                    Category= reader.GetString(9),
                });
            }
            results.ResultsCount = (int)resultsCount.Value;
            return results;
        }
    }
}
