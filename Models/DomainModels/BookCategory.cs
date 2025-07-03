using System;
using System.Collections.Generic;

namespace LibrarySystem.Models.DomainModels;

public partial class BookCategory
{
    public int BookId { get; set; }

    public int CategoryId { get; set; }

    public virtual Book Book { get; set; } = null!;

    public virtual Category Category { get; set; } = null!;
}
