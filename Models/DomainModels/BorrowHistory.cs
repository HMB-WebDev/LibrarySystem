using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

[Table("BorrowHistory")]
[Index("BookId", Name = "IX_BorrowHistory_BookId")]
[Index("VisitorId", Name = "IX_BorrowHistory_VisitorId")]
public partial class BorrowHistory
{
    [Key]
    public int Id { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? BorrowDate { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? ReturnDate { get; set; }

    public int VisitorId { get; set; }

    public int BookId { get; set; }

    [ForeignKey("BookId")]
    [InverseProperty("BorrowHistories")]
    public virtual Book Book { get; set; } = null!;

    [ForeignKey("VisitorId")]
    [InverseProperty("BorrowHistories")]
    public virtual Visitor Visitor { get; set; } = null!;
}
