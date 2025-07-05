using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

[Keyless]
[Index("BookId", Name = "IX_BookVisitors_BookId")]
[Index("VisitorId", Name = "IX_BookVisitors_VisitorId")]
public partial class BookVisitor
{
    public int BookId { get; set; }

    public int VisitorId { get; set; }

    [ForeignKey("BookId")]
    public virtual Book Book { get; set; } = null!;

    [ForeignKey("VisitorId")]
    public virtual Visitor Visitor { get; set; } = null!;
}
