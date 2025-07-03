using System;
using System.Collections.Generic;

namespace LibrarySystem.Models.DomainModels;

public partial class Visitor
{
    public int VisitorId { get; set; }

    public string Name { get; set; } = null!;

    public DateOnly JoinDate { get; set; }

    public virtual ICollection<BorrowHistory> BorrowHistories { get; set; } = new List<BorrowHistory>();
}
