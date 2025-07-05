using LibrarySystem.Models.DomainModels;

namespace LibrarySystem.Models
{
    public class SearchResults
    {
        public int ResultsCount { get; set; }
        public List<SearchBook> Books { get; set; } = [];
    }
}
