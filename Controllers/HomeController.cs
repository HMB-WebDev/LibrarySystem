using System.Diagnostics;
using System.Text.Json;
using System.Text.Json.Nodes;
using System.Threading.Tasks;
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
        private readonly IServices _services;

        public HomeController(ILogger<HomeController> logger,IRepository repository, IServices services)
        {
            _logger = logger;
            _repository = repository;
            _services = services;
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

        public async Task<IActionResult> GetSoQuestions()
        {
            string data = await _services.GetSOFQuestions();
            ViewBag.Questions = data;
            return View("StackOverflowQuestions","");
        }

        public async Task<IActionResult> GetSoAnswers([FromQuery] int qid, [FromQuery] string title)
        {
            string data = await _services.GetSOFAnswerss(qid);
            JsonNode dydata= JsonSerializer.Deserialize<JsonNode>(data,new JsonSerializerOptions{
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            });
            ViewBag.Answers = data;
            ViewBag.QTitle = title;
            return View("StackOverflowAnswers", dydata);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
