using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

public partial class Category
{
    [Key]
    public int CategoryId { get; set; }

    [StringLength(70)]
    public string Name { get; set; } = null!;

    public int? MainCategory { get; set; }

    [InverseProperty("MainCategoryNavigation")]
    public virtual ICollection<Category> InverseMainCategoryNavigation { get; set; } = new List<Category>();

    [ForeignKey("MainCategory")]
    [InverseProperty("InverseMainCategoryNavigation")]
    public virtual Category? MainCategoryNavigation { get; set; }
}
