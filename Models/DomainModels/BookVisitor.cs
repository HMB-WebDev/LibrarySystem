using System;
using System.Collections.Generic;

namespace LibrarySystem.Models.DomainModels;

public partial class BookVisitor
{
    public int BookId { get; set; }

    public int VisitorId { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual Visitor Visitor { get; set; } = null!;
}
