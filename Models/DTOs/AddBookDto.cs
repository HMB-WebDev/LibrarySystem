using System.ComponentModel.DataAnnotations;

namespace LibrarySystem.Models.DTOs
{
    public class AddBookDto
    {
        [StringLength(100)]
        [Required]
        public string Title { get; set; } = null!;
        [StringLength(1000)]
        public string? Description { get; set; }

        [StringLength(17)]
        public string? Isbn { get; set; }

        public int? PageCount { get; set; }

        public DateOnly? PublishDate { get; set; }

        [StringLength(100)]
        public string Publisher { get; set; } = null!;

        [StringLength(50)]
        public string? Location { get; set; }
    }
}
