using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

public partial class Book
{
    [Key]
    public int BookId { get; set; }

    [StringLength(100)]
    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    [StringLength(13)]
    public string? Isbn { get; set; }

    public int? PageCount { get; set; }

    public DateOnly? PublishDate { get; set; }

    [StringLength(100)]
    public string Publisher { get; set; } = null!;

    [StringLength(10)]
    public string Status { get; set; } = null!;

    [StringLength(50)]
    public string? Location { get; set; }

    [InverseProperty("Book")]
    public virtual ICollection<BorrowHistory> BorrowHistories { get; set; } = new List<BorrowHistory>();
}
