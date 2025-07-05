using System.ComponentModel.DataAnnotations;

namespace LibrarySystem.Models
{
    public class SearchBook
    {
        public int BookId { get; set; }

        public string Title { get; set; } = null!;

        public string? Description { get; set; }

        public string? Isbn { get; set; }

        public int? PageCount { get; set; }

        public DateOnly? PublishDate { get; set; }

        public string Publisher { get; set; } = null!;

        public string Status { get; set; } = null!;

        public string? Location { get; set; }

        public string Category { get; set; } = null!;
    }
}
