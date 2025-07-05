using LibrarySystem.Models.DomainModels;
using LibrarySystem.Models.DTOs;
using System.Reflection.Metadata.Ecma335;

namespace LibrarySystem.Models.ViewModels
{
    public class HomeViewModel
    {
        public int SelectedCatId { get; set; }
        public int SelectedSubCatId { get; set; }
        public List<CategoryDto> Categories{ get; set; } = [];
        public List<CategoryDto> SubCategories { get; set; } = [];

    }
}
