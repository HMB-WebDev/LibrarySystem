using LibrarySystem.Contracts;
using LibrarySystem.Models;
using LibrarySystem.Models.DomainModels;
using LibrarySystem.Models.DTOs;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LibrarySystem.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DevelopersController : ControllerBase
    {
        private IRepository _repository;
        public DevelopersController(IRepository repository) 
        {
           _repository = repository;
        }
        // GET: api/<DevelopersController>
        [HttpGet("getallbooks")]
        public async Task<ActionResult<IEnumerable<BookDto>>> GetBooks()
        {
            List<BookDto> books = await _repository.GetBooks();
            return Ok(books);
        }

        // GET api/<DevelopersController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<DevelopersController>
        [HttpPost("addbook")]
        public ActionResult AddBook([FromBody] AddBookDto book)
        {
            if (book == null) return BadRequest("No data provided");
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            bool result = _repository.AddNewBook(book);
            if (!result) return StatusCode((int) HttpStatusCode.InternalServerError);
            return Ok();
        }

    }
}
