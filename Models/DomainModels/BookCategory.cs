using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

[Keyless]
[Index("BookId", Name = "IX_BookCategories_BookId")]
[Index("CategoryId", Name = "IX_BookCategories_CategoryId")]
public partial class BookCategory
{
    public int BookId { get; set; }

    public int CategoryId { get; set; }

    [ForeignKey("BookId")]
    public virtual Book Book { get; set; } = null!;

    [ForeignKey("CategoryId")]
    public virtual Category Category { get; set; } = null!;
}
