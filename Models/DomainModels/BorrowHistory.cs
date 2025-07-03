using System;
using System.Collections.Generic;

namespace LibrarySystem.Models.DomainModels;

public partial class BorrowHistory
{
    public int Id { get; set; }

    public DateTime? BorrowDate { get; set; }

    public DateTime? ReturnDate { get; set; }

    public int VisitorId { get; set; }

    public int BookId { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual Visitor Visitor { get; set; } = null!;
}
