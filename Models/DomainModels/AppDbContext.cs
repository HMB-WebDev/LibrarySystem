using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace LibrarySystem.Models.DomainModels;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
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
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=LibrarySystem;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Author>(entity =>
        {
            entity.Property(e => e.AuthorId).ValueGeneratedNever();
            entity.Property(e => e.FirstName).HasMaxLength(50);
            entity.Property(e => e.LastName).HasMaxLength(50);
        });

        modelBuilder.Entity<Book>(entity =>
        {
            entity.Property(e => e.BookId).ValueGeneratedNever();
            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .IsFixedLength();
            entity.Property(e => e.Publisher).HasMaxLength(100);
            entity.Property(e => e.Title).HasMaxLength(100);
        });

        modelBuilder.Entity<BookAuthor>(entity =>
        {
            entity.HasNoKey();

            entity.HasOne(d => d.Author).WithMany()
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookAuthors_Authors");

            entity.HasOne(d => d.Book).WithMany()
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookAuthors_Books");
        });

        modelBuilder.Entity<BookCategory>(entity =>
        {
            entity.HasNoKey();

            entity.HasOne(d => d.Book).WithMany()
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookCategories_Books");

            entity.HasOne(d => d.Category).WithMany()
                .HasForeignKey(d => d.CategoryId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookCategories_Categories");
        });

        modelBuilder.Entity<BookVisitor>(entity =>
        {
            entity.HasNoKey();

            entity.HasOne(d => d.Book).WithMany()
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookVisitors_Books");

            entity.HasOne(d => d.Visitor).WithMany()
                .HasForeignKey(d => d.VisitorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BookVisitors_Visitors");
        });

        modelBuilder.Entity<BorrowHistory>(entity =>
        {
            entity.ToTable("BorrowHistory");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.BorrowDate).HasColumnType("datetime");
            entity.Property(e => e.ReturnDate).HasColumnType("datetime");

            entity.HasOne(d => d.Book).WithMany(p => p.BorrowHistories)
                .HasForeignKey(d => d.BookId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BorrowHistory_Books");

            entity.HasOne(d => d.Visitor).WithMany(p => p.BorrowHistories)
                .HasForeignKey(d => d.VisitorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_BorrowHistory_Visitors");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.Property(e => e.CategoryId).ValueGeneratedNever();
            entity.Property(e => e.Name).HasMaxLength(70);
        });

        modelBuilder.Entity<Visitor>(entity =>
        {
            entity.Property(e => e.VisitorId).ValueGeneratedNever();
            entity.Property(e => e.Name).HasMaxLength(100);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
