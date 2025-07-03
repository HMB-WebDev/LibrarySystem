using System;
using System.Collections.Generic;

namespace LibrarySystem.Models.DomainModels;

public partial class Book
{
    public int BookId { get; set; }

    public string Title { get; set; } = null!;

    public string? Isbn { get; set; }

    public int? PageCount { get; set; }

    public DateOnly? PublishDate { get; set; }

    public string Publisher { get; set; } = null!;

    public int Status { get; set; }

    public virtual ICollection<BorrowHistory> BorrowHistories { get; set; } = new List<BorrowHistory>();
}
