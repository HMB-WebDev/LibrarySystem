USE [LibrarySystem]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BooksCategoriesView'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BooksCategoriesView'
GO
/****** Object:  StoredProcedure [dbo].[BooksPagedSearch]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP PROCEDURE [dbo].[BooksPagedSearch]
GO
ALTER TABLE [dbo].[Categories] DROP CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[BorrowHistory] DROP CONSTRAINT [FK_BorrowHistory_Visitors]
GO
ALTER TABLE [dbo].[BorrowHistory] DROP CONSTRAINT [FK_BorrowHistory_Books]
GO
ALTER TABLE [dbo].[BookVisitors] DROP CONSTRAINT [FK_BookVisitors_Visitors]
GO
ALTER TABLE [dbo].[BookVisitors] DROP CONSTRAINT [FK_BookVisitors_Books]
GO
ALTER TABLE [dbo].[BookCategories] DROP CONSTRAINT [FK_BookCategories_Categories]
GO
ALTER TABLE [dbo].[BookCategories] DROP CONSTRAINT [FK_BookCategories_Books]
GO
ALTER TABLE [dbo].[BookAuthors] DROP CONSTRAINT [FK_BookAuthors_Books]
GO
ALTER TABLE [dbo].[BookAuthors] DROP CONSTRAINT [FK_BookAuthors_Authors]
GO
/****** Object:  Index [UniqueName]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [UniqueName] ON [dbo].[Categories]
GO
/****** Object:  Index [IX_BorrowHistory_VisitorId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BorrowHistory_VisitorId] ON [dbo].[BorrowHistory]
GO
/****** Object:  Index [IX_BorrowHistory_BookId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BorrowHistory_BookId] ON [dbo].[BorrowHistory]
GO
/****** Object:  Index [IX_BookVisitors_VisitorId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookVisitors_VisitorId] ON [dbo].[BookVisitors]
GO
/****** Object:  Index [IX_BookVisitors_BookId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookVisitors_BookId] ON [dbo].[BookVisitors]
GO
/****** Object:  Index [IX_BookCategories_CategoryId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookCategories_CategoryId] ON [dbo].[BookCategories]
GO
/****** Object:  Index [IX_BookCategories_BookId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookCategories_BookId] ON [dbo].[BookCategories]
GO
/****** Object:  Index [IX_BookAuthors_BookId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookAuthors_BookId] ON [dbo].[BookAuthors]
GO
/****** Object:  Index [IX_BookAuthors_AuthorId]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP INDEX [IX_BookAuthors_AuthorId] ON [dbo].[BookAuthors]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Visitors]') AND type in (N'U'))
DROP TABLE [dbo].[Visitors]
GO
/****** Object:  Table [dbo].[BorrowHistory]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BorrowHistory]') AND type in (N'U'))
DROP TABLE [dbo].[BorrowHistory]
GO
/****** Object:  Table [dbo].[BookVisitors]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookVisitors]') AND type in (N'U'))
DROP TABLE [dbo].[BookVisitors]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAuthors]') AND type in (N'U'))
DROP TABLE [dbo].[BookAuthors]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authors]') AND type in (N'U'))
DROP TABLE [dbo].[Authors]
GO
/****** Object:  View [dbo].[BooksCategoriesView]    Script Date: 7/5/2025 10:51:39 PM ******/
DROP VIEW [dbo].[BooksCategoriesView]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 7/5/2025 10:51:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
DROP TABLE [dbo].[Books]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/5/2025 10:51:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Categories]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 7/5/2025 10:51:41 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookCategories]') AND type in (N'U'))
DROP TABLE [dbo].[BookCategories]
GO
/****** Object:  User [dbuser]    Script Date: 7/5/2025 10:51:41 PM ******/
DROP USER [dbuser]
GO
USE [master]
GO
/****** Object:  Database [LibrarySystem]    Script Date: 7/5/2025 10:51:41 PM ******/
DROP DATABASE [LibrarySystem]
GO
/****** Object:  Database [LibrarySystem]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE DATABASE [LibrarySystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibrarySystem', FILENAME = N'C:\Users\lenovo\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\LibrarySystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibrarySystem_log', FILENAME = N'C:\Users\lenovo\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\LibrarySystem.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LibrarySystem] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibrarySystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibrarySystem] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_NULLS ON 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_PADDING ON 
GO
ALTER DATABASE [LibrarySystem] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [LibrarySystem] SET ARITHABORT ON 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibrarySystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibrarySystem] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [LibrarySystem] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [LibrarySystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibrarySystem] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [LibrarySystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibrarySystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibrarySystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibrarySystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibrarySystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibrarySystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibrarySystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibrarySystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibrarySystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibrarySystem] SET RECOVERY FULL 
GO
ALTER DATABASE [LibrarySystem] SET  MULTI_USER 
GO
ALTER DATABASE [LibrarySystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibrarySystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibrarySystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibrarySystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibrarySystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibrarySystem] SET QUERY_STORE = OFF
GO
USE [LibrarySystem]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [LibrarySystem]
GO
/****** Object:  User [dbuser]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE USER [dbuser] FOR LOGIN [dbuser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [dbuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [dbuser]
GO
/****** Object:  Table [dbo].[BookCategories]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCategories](
	[BookId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[MainCategory] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Isbn] [nvarchar](20) NULL,
	[PageCount] [int] NULL,
	[PublishDate] [date] NULL,
	[Publisher] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[BooksCategoriesView]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BooksCategoriesView]
AS
SELECT        TOP (100) PERCENT dbo.Books.BookId, dbo.Books.Title, dbo.Books.Description, dbo.Books.Isbn, dbo.Books.PageCount, dbo.Books.PublishDate, dbo.Books.Publisher, dbo.Books.Status, dbo.Books.Location, 
                         dbo.Categories.Name AS CategoryName
FROM            dbo.BookCategories INNER JOIN
                         dbo.Books ON dbo.BookCategories.BookId = dbo.Books.BookId INNER JOIN
                         dbo.Categories ON dbo.BookCategories.CategoryId = dbo.Categories.CategoryId
ORDER BY dbo.Books.BookId
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthors]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthors](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookVisitors]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookVisitors](
	[BookId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowHistory]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BorrowDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
	[VisitorId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
 CONSTRAINT [PK_BorrowHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitors](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[JoinDate] [date] NOT NULL,
 CONSTRAINT [PK_Visitors] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (1, 1)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (2, 2)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (3, 3)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (4, 4)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (5, 5)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (6, 6)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (7, 7)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (8, 8)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (9, 1)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (10, 9)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (11, 10)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (12, 11)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (13, 4)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (14, 12)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (15, 13)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (16, 14)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (17, 15)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (18, 16)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (19, 17)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (20, 18)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (21, 19)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (22, 20)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (23, 21)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (24, 2)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (25, 22)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (26, 6)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (27, 23)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (28, 24)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (29, 2)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (30, 3)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (1, 25)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (1, 27)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (2, 30)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (2, 31)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (3, 33)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (3, 35)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (4, 39)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (4, 40)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (4, 38)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (5, 43)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (6, 45)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (6, 46)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (6, 47)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (7, 50)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (7, 51)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (8, 54)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (8, 55)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (9, 59)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (10, 62)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (10, 63)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (11, 65)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (11, 66)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (12, 70)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (12, 72)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (13, 74)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (13, 75)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (14, 77)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (14, 78)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (15, 81)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (15, 83)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (16, 85)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (16, 86)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (17, 90)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (17, 91)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (18, 93)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (18, 95)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (19, 99)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (19, 100)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (20, 101)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (20, 102)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (21, 105)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (21, 106)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (22, 109)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (22, 111)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (23, 114)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (23, 115)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (24, 117)
INSERT [dbo].[BookCategories] ([BookId], [CategoryId]) VALUES (24, 119)
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (1, N'The Quantum Enigma', N'A journey into the mysteries of quantum physics.', N'978-1-23456-001-1', NULL, CAST(N'2015-03-12' AS Date), N'Nova Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (2, N'Gardens of the Mind', N'Exploring the psychology of creativity.', N'978-1-23456-002-8', NULL, CAST(N'2018-07-22' AS Date), N'Mindscape Publishing', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (3, N'Digital Fortress', N'A techno-thriller about code and secrecy.', N'978-1-23456-003-5', NULL, CAST(N'2010-11-05' AS Date), N'Cipher Books', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (4, N'Echoes of Eternity', N'A sci-fi epic across galaxies.', N'978-1-23456-004-2', NULL, CAST(N'2020-01-15' AS Date), N'Stellar House', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (5, N'The Art of Silence', N'Meditation and mindfulness in modern life.', N'978-1-23456-005-9', NULL, CAST(N'2017-06-30' AS Date), N'Zenith Books', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (6, N'Code & Chaos', N'The evolution of software engineering.', N'978-1-23456-006-6', NULL, CAST(N'2019-09-10' AS Date), N'TechVerse', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (7, N'Whispers in the Wind', N'A poetic collection of nature?s voice.', N'978-1-23456-007-3', NULL, CAST(N'2016-04-18' AS Date), N'Leaf & Ink', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (8, N'The Forgotten Algorithm', N'A mystery buried in lines of code.', N'978-1-23456-008-0', NULL, CAST(N'2021-02-27' AS Date), N'Binary Tales', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (9, N'Beneath the Surface', N'A deep dive into marine biology.', N'978-1-23456-009-7', NULL, CAST(N'2014-08-09' AS Date), N'Oceanic Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (10, N'The Last Librarian', N'A dystopian tale of knowledge and resistance.', N'978-1-23456-010-3', NULL, CAST(N'2022-05-01' AS Date), N'Inkspire', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (11, N'Neural Dreams', N'AI and the future of consciousness.', N'978-1-23456-011-0', NULL, CAST(N'2023-03-14' AS Date), N'Cortex Media', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (12, N'The Clockmaker?s Paradox', N'Time travel and philosophical puzzles.', N'978-1-23456-012-7', NULL, CAST(N'2011-12-21' AS Date), N'ChronoBooks', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (13, N'Harvest of Stars', N'Colonizing the cosmos.', N'978-1-23456-013-4', NULL, CAST(N'2013-10-03' AS Date), N'Galactic Ink', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (14, N'The Language of Trees', N'Botanical communication and ecology.', N'978-1-23456-014-1', NULL, CAST(N'2016-05-25' AS Date), N'GreenMind Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (15, N'Fragments of Tomorrow', N'Short stories of speculative futures.', N'978-1-23456-015-8', NULL, CAST(N'2019-08-17' AS Date), N'FutureLit', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (16, N'The Infinite Canvas', N'Digital art in the age of AI.', N'978-1-23456-016-5', NULL, CAST(N'2021-11-09' AS Date), N'Pixel & Pen', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (17, N'Echo Chamber', N'Social media and the illusion of truth.', N'978-1-23456-017-2', NULL, CAST(N'2018-02-13' AS Date), N'Signal Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (18, N'The Alchemist?s Code', N'A historical fantasy of secrets and science.', N'978-1-23456-018-9', NULL, CAST(N'2012-07-29' AS Date), N'Mythos House', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (19, N'Wired for Wonder', N'Neuroscience and the child?s brain.', N'978-1-23456-019-6', NULL, CAST(N'2015-10-11' AS Date), N'BrightMind Books', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (20, N'The Shadow Protocol', N'Espionage in the digital age.', N'978-1-23456-020-2', NULL, CAST(N'2020-06-06' AS Date), N'BlackNet Publishing', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (21, N'Voices from the Dust', N'Archaeological discoveries that changed history.', N'978-1-23456-021-9', NULL, CAST(N'2017-01-19' AS Date), N'Ancient Echoes', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (22, N'The Gravity of Light', N'Astrophysics for curious minds.', N'978-1-23456-022-6', NULL, CAST(N'2014-09-23' AS Date), N'Cosmic Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (23, N'Blueprints of Babel', N'The evolution of human language.', N'978-1-23456-023-3', NULL, CAST(N'2013-04-14' AS Date), N'Lingua House', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (24, N'The Memory Architect', N'How memory shapes identity.', N'978-1-23456-024-0', NULL, CAST(N'2016-12-02' AS Date), N'NeuroPress', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (25, N'Crimson Horizon', N'A naval saga of war and redemption.', N'978-1-23456-025-7', NULL, CAST(N'2011-03-08' AS Date), N'Mariner Books', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (26, N'The Crystal Algorithm', N'Quantum computing and the next revolution.', N'978-1-23456-026-4', NULL, CAST(N'2022-08-30' AS Date), N'Qubit Press', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (27, N'Dreams of Iron', N'Industrial age steampunk adventures.', N'978-1-23456-027-1', NULL, CAST(N'2010-05-12' AS Date), N'SteamLit', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (28, N'The Silent Accord', N'Diplomacy, secrets, and global stakes.', N'978-1-23456-028-8', NULL, CAST(N'2018-11-26' AS Date), N'Diplomatica', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (29, N'Canvas of the Mind', N'Psychology through visual metaphors.', N'978-1-23456-029-5', NULL, CAST(N'2019-07-04' AS Date), N'MindArt Books', N'available', NULL)
INSERT [dbo].[Books] ([BookId], [Title], [Description], [Isbn], [PageCount], [PublishDate], [Publisher], [Status], [Location]) VALUES (30, N'The Phoenix Manuscript', N'A thriller of rebirth and revenge.', N'978-1-23456-030-1', NULL, CAST(N'2023-01-01' AS Date), N'Ash & Ember', N'available', NULL)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (1, N'Science', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (2, N'Psychology', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (3, N'Thriller', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (4, N'Science Fiction', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (5, N'Self-Help', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (6, N'Technology', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (7, N'Poetry', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (8, N'Mystery', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (9, N'Dystopian', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (10, N'Artificial Intelligence', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (11, N'Philosophy', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (12, N'Nature', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (13, N'Speculative Fiction', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (14, N'Art & Technology', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (15, N'Sociology', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (16, N'Historical Fantasy', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (17, N'Neuroscience', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (18, N'Spy Thriller', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (19, N'History', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (20, N'Astrophysics', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (21, N'Linguistics', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (22, N'Historical Fiction', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (23, N'Steampunk', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (24, N'Political Thriller', NULL)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (25, N'Popular Science', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (26, N'Experimental Science', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (27, N'Natural Sciences', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (28, N'Scientific Biography', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (29, N'Cognitive Psychology', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (30, N'Behavioral Psychology', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (31, N'Developmental Psychology', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (32, N'Psychotherapy', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (33, N'Psychological Thriller', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (34, N'Legal Thriller', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (35, N'Techno-Thriller', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (36, N'Medical Thriller', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (37, N'Hard Sci-Fi', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (38, N'Space Opera', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (39, N'Cyberpunk', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (40, N'Time Travel', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (41, N'Personal Growth', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (42, N'Productivity', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (43, N'Mindfulness', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (44, N'Relationships', 5)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (45, N'Emerging Tech', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (46, N'Software Engineering', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (47, N'Cybersecurity', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (48, N'Tech History', 6)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (49, N'Nature Poetry', 7)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (50, N'Free Verse', 7)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (51, N'Narrative Poetry', 7)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (52, N'Haiku', 7)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (53, N'Cozy Mystery', 8)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (54, N'Detective Fiction', 8)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (55, N'Noir', 8)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (56, N'Historical Mystery', 8)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (57, N'Post-Apocalyptic', 9)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (58, N'Political Dystopia', 9)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (59, N'Environmental Dystopia', 9)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (60, N'Tech Dystopia', 9)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (61, N'Machine Learning', 10)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (62, N'AI Ethics', 10)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (63, N'Neural Networks', 10)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (64, N'AI in Society', 10)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (65, N'Metaphysics', 11)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (66, N'Ethics', 11)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (67, N'Logic', 11)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (68, N'Philosophy of Mind', 11)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (69, N'Environmental Writing', 12)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (70, N'Wildlife', 12)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (71, N'Ecology', 12)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (72, N'Nature Memoir', 12)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (73, N'Alternate History', 13)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (74, N'Utopian Fiction', 13)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (75, N'Weird Fiction', 13)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (76, N'Slipstream', 13)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (77, N'Digital Art', 14)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (78, N'Generative Art', 14)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (79, N'Interactive Media', 14)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (80, N'AI Art', 14)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (81, N'Social Theory', 15)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (82, N'Cultural Studies', 15)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (83, N'Urban Sociology', 15)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (84, N'Sociology of Technology', 15)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (85, N'Mythic Fantasy', 16)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (86, N'Gaslamp Fantasy', 16)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (87, N'Arthurian Fantasy', 16)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (88, N'Alternate History Fantasy', 16)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (89, N'Cognitive Neuroscience', 17)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (90, N'Neuroplasticity', 17)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (91, N'Brain Disorders', 17)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (92, N'Neurophilosophy', 17)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (93, N'Cold War Espionage', 18)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (94, N'Tech Espionage', 18)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (95, N'Political Intrigue', 18)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (96, N'Military Intelligence', 18)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (97, N'Ancient History', 19)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (98, N'Military History', 19)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (99, N'Social History', 19)
GO
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (100, N'Biographical History', 19)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (101, N'Cosmology', 20)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (102, N'Stellar Physics', 20)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (103, N'Black Holes', 20)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (104, N'Exoplanetary Science', 20)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (105, N'Phonology', 21)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (106, N'Syntax', 21)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (107, N'Sociolinguistics', 21)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (108, N'Historical Linguistics', 21)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (109, N'War Fiction', 22)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (110, N'Victorian Fiction', 22)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (111, N'Colonial Fiction', 22)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (112, N'Biographical Fiction', 22)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (114, N'Neo-Victorian', 23)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (115, N'Clockpunk', 23)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (116, N'Dieselpunk', 23)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (117, N'Government Conspiracy', 24)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (118, N'Geopolitical Intrigue', 24)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (119, N'Legal Intrigue', 24)
INSERT [dbo].[Categories] ([CategoryId], [Name], [MainCategory]) VALUES (120, N'Military Politics', 24)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
/****** Object:  Index [IX_BookAuthors_AuthorId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthors_AuthorId] ON [dbo].[BookAuthors]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookAuthors_BookId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthors_BookId] ON [dbo].[BookAuthors]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookCategories_BookId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_BookId] ON [dbo].[BookCategories]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookCategories_CategoryId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookCategories_CategoryId] ON [dbo].[BookCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookVisitors_BookId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookVisitors_BookId] ON [dbo].[BookVisitors]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookVisitors_VisitorId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookVisitors_VisitorId] ON [dbo].[BookVisitors]
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BorrowHistory_BookId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BorrowHistory_BookId] ON [dbo].[BorrowHistory]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BorrowHistory_VisitorId]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BorrowHistory_VisitorId] ON [dbo].[BorrowHistory]
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueName]    Script Date: 7/5/2025 10:51:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UniqueName] ON [dbo].[Categories]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([AuthorId])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Authors]
GO
ALTER TABLE [dbo].[BookAuthors]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthors_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookAuthors] CHECK CONSTRAINT [FK_BookAuthors_Books]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategories_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategories_Books]
GO
ALTER TABLE [dbo].[BookCategories]  WITH CHECK ADD  CONSTRAINT [FK_BookCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[BookCategories] CHECK CONSTRAINT [FK_BookCategories_Categories]
GO
ALTER TABLE [dbo].[BookVisitors]  WITH CHECK ADD  CONSTRAINT [FK_BookVisitors_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BookVisitors] CHECK CONSTRAINT [FK_BookVisitors_Books]
GO
ALTER TABLE [dbo].[BookVisitors]  WITH CHECK ADD  CONSTRAINT [FK_BookVisitors_Visitors] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[Visitors] ([VisitorId])
GO
ALTER TABLE [dbo].[BookVisitors] CHECK CONSTRAINT [FK_BookVisitors_Visitors]
GO
ALTER TABLE [dbo].[BorrowHistory]  WITH CHECK ADD  CONSTRAINT [FK_BorrowHistory_Books] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO
ALTER TABLE [dbo].[BorrowHistory] CHECK CONSTRAINT [FK_BorrowHistory_Books]
GO
ALTER TABLE [dbo].[BorrowHistory]  WITH CHECK ADD  CONSTRAINT [FK_BorrowHistory_Visitors] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[Visitors] ([VisitorId])
GO
ALTER TABLE [dbo].[BorrowHistory] CHECK CONSTRAINT [FK_BorrowHistory_Visitors]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([MainCategory])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
/****** Object:  StoredProcedure [dbo].[BooksPagedSearch]    Script Date: 7/5/2025 10:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Name
-- Create date: 07-05-2025
-- Description:	Retrive books from search keyword
-- =============================================

CREATE   PROCEDURE [dbo].[BooksPagedSearch]
	-- Add the parameters for the stored procedure here
	@SearchTxt NVARCHAR(120), 
	@PgNo int = 1,
	@PgSize int =20,
	@ResultsCount int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @offset int = (@PgNo-1)* @PgSize;
    -- return total results found
	SELECT @ResultsCount = COUNT(*)
	FROM BooksCategoriesView
	WHERE Title LIKE '%' + @SearchTxt +'%'
		OR Description LIKE '%' + @SearchTxt +'%'
		OR CategoryName LIKE '%' + @SearchTxt +'%'
		OR Isbn LIKE '%' + @SearchTxt +'%'
		OR Publisher LIKE '%' + @SearchTxt +'%'

	-- return pagination results
	SELECT * 
	FROM BooksCategoriesView
	WHERE Title LIKE '%' + @SearchTxt +'%'
		OR Description LIKE '%' + @SearchTxt +'%'
		OR CategoryName LIKE '%' + @SearchTxt +'%'
		OR Isbn LIKE '%' + @SearchTxt +'%'
		OR Publisher LIKE '%' + @SearchTxt +'%'
	ORDER BY Title
	OFFSET @offset ROWS
	FETCH NEXT @PgSize ROWS ONLY;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BookCategories"
            Begin Extent = 
               Top = 36
               Left = 326
               Bottom = 132
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Books"
            Begin Extent = 
               Top = 27
               Left = 58
               Bottom = 271
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categories"
            Begin Extent = 
               Top = 63
               Left = 655
               Bottom = 176
               Right = 825
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 1110
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BooksCategoriesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BooksCategoriesView'
GO
USE [master]
GO
ALTER DATABASE [LibrarySystem] SET  READ_WRITE 
GO
