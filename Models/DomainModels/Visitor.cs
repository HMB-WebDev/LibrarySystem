using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

public partial class Visitor
{
    [Key]
    public int VisitorId { get; set; }

    [StringLength(100)]
    public string Name { get; set; } = null!;

    public DateOnly JoinDate { get; set; }

    [InverseProperty("Visitor")]
    public virtual ICollection<BorrowHistory> BorrowHistories { get; set; } = new List<BorrowHistory>();
}
