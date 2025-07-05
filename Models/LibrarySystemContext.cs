using System;
using System.Collections.Generic;
using LibrarySystem.Models.DomainModels;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models;

public partial class LibrarySystemContext : DbContext
{
    public LibrarySystemContext()
    {
    }

    public LibrarySystemContext(DbContextOptions<LibrarySystemContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Author> Authors { get; set; }

    public virtual DbSet<Book> Books { get; set; }

    public virtual DbSet<BookAuthor> BookAuthors { get; set; }

    public virtual DbSet<BookCategory> BookCategories { get; set; }

    public virtual DbSet<BookVisitor> BookVisitors { get; set; }

    public virtual DbSet<BorrowHistory> BorrowHistories { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Visitor> Visitors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=LibrarySystem;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Author>(entity =>
        {
            entity.Property(e => e.AuthorId).ValueGeneratedNever();
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.Property(e => e.BookId).ValueGeneratedNever();
            entity.Property(e => e.Isbn).IsFixedLength();
            entity.Property(e => e.Status).IsFixedLength();
        });

        modelBuilder.Entity<BookAuthor>(entity =>
        {
            entity.HasOne(d => d.Author).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookAuthors_Authors");

            entity.HasOne(d => d.Book).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookAuthors_Books");
        });

        modelBuilder.Entity<BookCategory>(entity =>
        {
            entity.HasOne(d => d.Book).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookCategories_Books");

            entity.HasOne(d => d.Category).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookCategories_Categories");
        });

        modelBuilder.Entity<BookVisitor>(entity =>
        {
            entity.HasOne(d => d.Book).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookVisitors_Books");

            entity.HasOne(d => d.Visitor).WithMany()
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookVisitors_Visitors");
        });

        modelBuilder.Entity<BorrowHistory>(entity =>
        {
            entity.Property(e => e.Id).ValueGeneratedNever();

            entity.HasOne(d => d.Book).WithMany(p => p.BorrowHistories)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BorrowHistory_Books");

            entity.HasOne(d => d.Visitor).WithMany(p => p.BorrowHistories)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BorrowHistory_Visitors");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.Property(e => e.CategoryId).ValueGeneratedNever();

            entity.HasOne(d => d.MainCategoryNavigation).WithMany(p => p.InverseMainCategoryNavigation).HasConstraintName("FK_Categories_Categories");
        });

        modelBuilder.Entity<Visitor>(entity =>
        {
            entity.Property(e => e.VisitorId).ValueGeneratedNever();
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
