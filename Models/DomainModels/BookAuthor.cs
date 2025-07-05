using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

[Keyless]
[Index("AuthorId", Name = "IX_BookAuthors_AuthorId")]
[Index("BookId", Name = "IX_BookAuthors_BookId")]
public partial class BookAuthor
{
    public int BookId { get; set; }

    public int AuthorId { get; set; }

    [ForeignKey("AuthorId")]
    public virtual Author Author { get; set; } = null!;

    [ForeignKey("BookId")]
    public virtual Book Book { get; set; } = null!;
}
