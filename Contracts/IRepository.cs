using LibrarySystem.Models;
using LibrarySystem.Models.DomainModels;
using LibrarySystem.Models.DTOs;

namespace LibrarySystem.Contracts
{
    public interface IRepository
    {
        Task<SearchResults> SearchBooksSP(string searchTxt, int pgNum, int pgSize);
        Task<SearchResults> SearchBookEF(string searchTxt,int pgNum, int pgSize);
        Task<List<BookDto>> GetBooks();
        bool AddNewBook(AddBookDto book);
        List<CategoryDto> GetCategories();
        List<CategoryDto> GetSubCategories(int catId);
    }
}
