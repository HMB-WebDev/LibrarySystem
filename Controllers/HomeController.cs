using System.Diagnostics;
using LibrarySystem.Contracts;
using LibrarySystem.Models;
using LibrarySystem.Models.DTOs;
using LibrarySystem.Models.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace LibrarySystem.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IRepository _repository;

        public HomeController(ILogger<HomeController> logger,IRepository repository)
        {
            _logger = logger;
            _repository = repository;
        }

        public IActionResult Index()
        {
            HomeViewModel model = new HomeViewModel();
            List<CategoryDto> categories = _repository.GetCategories();
            model.Categories = categories;
            return View(model);
        }
        
        public JsonResult GetSubCategory([FromRoute]int id) 
        {
            List<CategoryDto> categories = _repository.GetSubCategories(id);
            return Json(categories);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
