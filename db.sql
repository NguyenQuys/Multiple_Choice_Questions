USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE DATABASE [MCQ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MCQ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KTEAM\MSSQL\DATA\MCQ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MCQ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KTEAM\MSSQL\DATA\MCQ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MCQ] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MCQ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MCQ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MCQ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MCQ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MCQ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MCQ] SET ARITHABORT OFF 
GO
ALTER DATABASE [MCQ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MCQ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MCQ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MCQ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MCQ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MCQ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MCQ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MCQ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MCQ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MCQ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MCQ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MCQ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MCQ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MCQ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MCQ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MCQ] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MCQ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MCQ] SET RECOVERY FULL 
GO
ALTER DATABASE [MCQ] SET  MULTI_USER 
GO
ALTER DATABASE [MCQ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MCQ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MCQ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MCQ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MCQ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MCQ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MCQ', N'ON'
GO
ALTER DATABASE [MCQ] SET QUERY_STORE = ON
GO
ALTER DATABASE [MCQ] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MCQ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID_Admin] [varchar](10) NOT NULL,
	[ID_Role] [varchar](10) NOT NULL,
	[Admin_Name] [varchar](50) NOT NULL,
	[Phone_Number] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID_Admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[IDAnswer] [int] NOT NULL,
	[IDQuestion] [int] NOT NULL,
	[Answer_Title] [nvarchar](max) NOT NULL,
	[Key] [bit] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[IDAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[IDQuestion] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[IDSubject] [varchar](10) NOT NULL,
	[Level] [int] NOT NULL,
	[LinkImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[IDQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[IDResult] [varchar](10) NOT NULL,
	[ID_Student] [varchar](10) NULL,
	[IDSubject] [varchar](10) NULL,
	[CorrectedLevel1] [int] NULL,
	[CorrectedLevel2] [int] NULL,
	[CorrectedLevel3] [int] NULL,
	[Skipped] [int] NULL,
	[Score] [float] NULL,
	[ExamDate] [datetime2](7) NULL,
	[Status] [bit] NULL,
	[Feedback] [nvarchar](max) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[IDResult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [varchar](10) NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID_Student] [varchar](10) NOT NULL,
	[Student_Name] [varchar](50) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[ID_Role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[ID_Student_Answer] [varchar](10) NOT NULL,
	[ID_Student] [varchar](10) NULL,
	[IDSubject] [varchar](10) NULL,
	[IDQuestion] [int] NOT NULL,
	[IDAnswer] [int] NULL,
	[IsCorrect] [bit] NULL,
 CONSTRAINT [PK_Student_Answer] PRIMARY KEY CLUSTERED 
(
	[ID_Student_Answer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[IDSubject] [varchar](10) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
	[AmountQuestionLevel1] [int] NOT NULL,
	[MinCorrectAnswerLevel1] [int] NOT NULL,
	[AmountQuestionLevel2] [int] NOT NULL,
	[MinCorrectAnswerLevel2] [int] NOT NULL,
	[AmountQuestionLevel3] [int] NOT NULL,
	[MinCorrectAnswerLevel3] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[IDSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/3/2024 7:51:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID_Teacher] [varchar](10) NOT NULL,
	[Teacher_Name] [nvarchar](50) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[Phone_Number] [varchar](10) NOT NULL,
	[Specialization] [varchar](50) NOT NULL,
	[ID_Role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID_Teacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240428163012_init', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240430155633_addColumn', N'8.0.4')
GO
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (1, 1, N'a11', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (2, 1, N'a12', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (3, 1, N'a13', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (4, 1, N'a14', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (5, 2, N'a21', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (6, 2, N'a22', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (7, 2, N'a23', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (8, 2, N'a24', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (9, 3, N'b11', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (10, 3, N'b12', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (11, 3, N'b13', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (12, 3, N'b14', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (13, 4, N'b21', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (14, 4, N'b22', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (15, 4, N'b23', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (16, 4, N'b24', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (17, 5, N'c11', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (18, 5, N'c12', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (19, 5, N'c13', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (20, 5, N'c14', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (21, 6, N'c21', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (22, 6, N'c22', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (23, 6, N'c23', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (24, 6, N'c24', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (25, 7, N'heloworld1', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (26, 7, N'heloworld2', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (27, 7, N'heloworld34', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (28, 7, N'heloworld4', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (29, 8, N'heloworld5', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (30, 8, N'heloworld6', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (31, 8, N'heloworld7', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (32, 8, N'heloworld8', 1)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (33, 9, N'heloworld9', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (34, 9, N'heloworld10', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (35, 9, N'heloworld11', 0)
INSERT [dbo].[Answer] ([IDAnswer], [IDQuestion], [Answer_Title], [Key]) VALUES (36, 9, N'heloworld12', 1)
GO
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (1, N'a1', N'aa', 1, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (2, N'a2', N'aa', 1, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (3, N'b1', N'aa', 2, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (4, N'b2', N'aa', 2, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (5, N'c1', N'aa', 3, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (6, N'c2', N'aa', 3, NULL)
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (7, N'heloworldA', N'bb', 1, N'f173dde4-fe12-4c67-a9e4-b3bf520878cd.jpg')
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (8, N'heloworldB', N'bb', 2, N'43382375-aa18-4a77-8247-d5060abfba3c.jpg')
INSERT [dbo].[Question] ([IDQuestion], [Title], [IDSubject], [Level], [LinkImage]) VALUES (9, N'heloworldC', N'bb', 3, N'25b564cb-f946-47ee-bcf2-197aab19a0e8.jpg')
GO
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', NULL, N'aa', 5, 3, 3, 0, 22.5, CAST(N'2024-04-29T09:19:21.8833299' AS DateTime2), 1, N'gg')
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE10', NULL, N'aa', 14, 11, 10, 16, 84.5, CAST(N'2024-04-29T09:44:51.4777008' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE11', NULL, N'aa', 14, 11, 10, 22, 84.5, CAST(N'2024-04-29T09:46:31.3930462' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE12', NULL, N'aa', 14, 11, 10, 28, 84.5, CAST(N'2024-04-29T09:47:43.4129512' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE13', NULL, N'aa', 16, 13, 12, 30, 99.5, CAST(N'2024-04-29T14:34:14.4168835' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE14', NULL, N'aa', 18, 15, 14, 30, 114.5, CAST(N'2024-04-29T14:44:51.0056898' AS DateTime2), 1, N'aaxxxx')
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE15', NULL, N'aa', 20, 17, 16, 30, 129.5, CAST(N'2024-04-29T14:52:12.9497518' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE16', NULL, N'aa', 21, 18, 17, 30, 137, CAST(N'2024-04-29T15:01:28.6476662' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE17', NULL, N'aa', 22, 19, 18, 30, 144.5, CAST(N'2024-04-29T15:01:47.8248688' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE18', NULL, N'aa', 23, 20, 19, 30, 152, CAST(N'2024-04-29T15:02:03.7761419' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE19', NULL, N'aa', 24, 21, 20, 30, 159.5, CAST(N'2024-04-29T15:02:24.8006507' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE2', NULL, N'aa', 1, 1, 1, 0, 7.5, CAST(N'2024-04-29T09:20:06.7265710' AS DateTime2), 1, N'tam on')
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE20', NULL, N'aa', 26, 22, 23, 30, 174.5, CAST(N'2024-04-29T15:16:25.1007732' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE21', NULL, N'aa', 27, 23, 24, 30, 182, CAST(N'2024-04-29T15:16:59.3076987' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE22', NULL, N'aa', 29, 25, 26, 30, 197, CAST(N'2024-04-29T15:24:08.1549402' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE23', NULL, N'aa', 31, 27, 28, 30, 212, CAST(N'2024-04-29T15:25:09.1356111' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE24', NULL, N'aa', 33, 29, 30, 30, 227, CAST(N'2024-04-29T15:26:17.2039731' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE25', NULL, N'aa', 35, 31, 32, 30, 242, CAST(N'2024-04-29T15:28:08.1605016' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE26', NULL, N'aa', 37, 33, 34, 30, 257, CAST(N'2024-04-29T15:30:50.0073433' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE27', NULL, N'aa', 39, 35, 36, 30, 272, CAST(N'2024-04-29T15:31:14.9234859' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE28', NULL, N'aa', 39, 35, 36, 36, 272, CAST(N'2024-04-29T15:38:08.1462305' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE29', NULL, N'aa', 39, 35, 36, 43, 272, CAST(N'2024-04-29T15:38:34.6497064' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE3', NULL, N'aa', 3, 3, 1, 5, 17.5, CAST(N'2024-04-29T09:22:14.1130761' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE30', NULL, N'aa', 39, 35, 36, 49, 272, CAST(N'2024-04-29T15:39:47.6836405' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE31', NULL, N'bb', 0, 0, 0, 6, 0, CAST(N'2024-05-01T13:22:10.1827810' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE32', NULL, N'bb', 0, 0, 0, 9, 0, CAST(N'2024-05-01T13:54:15.9173710' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE33', NULL, N'aa', 0, 0, 0, 8, 0, CAST(N'2024-05-01T13:56:23.3680309' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE34', NULL, N'aa', 0, 0, 0, 12, 0, CAST(N'2024-05-01T14:34:34.9305811' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE35', NULL, N'aa', 0, 0, 0, 20, 0, CAST(N'2024-05-01T14:50:46.3960103' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE36', NULL, N'aa', 0, 0, 0, 52, 0, CAST(N'2024-05-01T15:33:21.2956833' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE37', NULL, N'aa', 0, 0, 0, 68, 0, CAST(N'2024-05-01T16:55:46.9163740' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE4', NULL, N'aa', 5, 3, 2, 5, 22, CAST(N'2024-04-29T09:40:52.7287778' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE5', NULL, N'aa', 7, 5, 4, 5, 37, CAST(N'2024-04-29T09:41:18.5232386' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE6', NULL, N'aa', 9, 7, 6, 5, 52, CAST(N'2024-04-29T09:41:46.1260357' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE7', NULL, N'aa', 11, 9, 8, 5, 67, CAST(N'2024-04-29T09:43:10.0048662' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE8', NULL, N'aa', 11, 9, 8, 11, 67, CAST(N'2024-04-29T09:43:27.8385918' AS DateTime2), 1, NULL)
INSERT [dbo].[Result] ([IDResult], [ID_Student], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE9', NULL, N'aa', 13, 11, 10, 11, 82, CAST(N'2024-04-29T09:44:28.9043609' AS DateTime2), 1, NULL)
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN1', NULL, N'aa', 7, 25, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN10', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN11', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN12', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN13', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN14', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN15', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN16', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN17', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN18', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN19', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN2', NULL, N'aa', 8, 30, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN20', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN21', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN22', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN23', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN24', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN25', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN26', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN27', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN28', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN29', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN3', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN30', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN31', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN32', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN33', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN34', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN35', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN36', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN37', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN38', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN39', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN4', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN40', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN41', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN42', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN43', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN44', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN45', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN46', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN47', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN48', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN49', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN5', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN50', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN51', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN52', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN53', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN54', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN55', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN56', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN57', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN58', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN59', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN6', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN60', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN61', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN62', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN63', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN64', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN65', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN66', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN67', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN68', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN69', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN7', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN70', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN71', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN72', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN73', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN74', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN75', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN76', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN77', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN78', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN79', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN8', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN80', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN81', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN82', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN83', NULL, N'aa', 4, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN84', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN85', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN86', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN87', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN88', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN89', NULL, N'aa', 1, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN9', NULL, N'aa', 5, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN90', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN91', NULL, N'aa', 3, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN92', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN93', NULL, N'aa', 6, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN94', NULL, N'aa', 2, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [ID_Student], [IDSubject], [IDQuestion], [IDAnswer], [IsCorrect]) VALUES (N'STAN95', NULL, N'bb', 7, 25, 0)
GO
INSERT [dbo].[Subject] ([IDSubject], [SubjectName], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3]) VALUES (N'aa', N'aa', 2, 1, 2, 1, 2, 1)
INSERT [dbo].[Subject] ([IDSubject], [SubjectName], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3]) VALUES (N'bb', N'bb', 1, 1, 1, 1, 1, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Admin_ID_Role]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Admin_ID_Role] ON [dbo].[Admin]
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Answer_IDQuestion]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Answer_IDQuestion] ON [dbo].[Answer]
(
	[IDQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Question_IDSubject]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Question_IDSubject] ON [dbo].[Question]
(
	[IDSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Result_ID_Student]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Result_ID_Student] ON [dbo].[Result]
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Result_IDSubject]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Result_IDSubject] ON [dbo].[Result]
(
	[IDSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_ID_Role]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_ID_Role] ON [dbo].[Student]
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Answer_ID_Student]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_ID_Student] ON [dbo].[Student_Answer]
(
	[ID_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Answer_IDAnswer]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDAnswer] ON [dbo].[Student_Answer]
(
	[IDAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Answer_IDQuestion]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDQuestion] ON [dbo].[Student_Answer]
(
	[IDQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Answer_IDSubject]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDSubject] ON [dbo].[Student_Answer]
(
	[IDSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Teacher_ID_Role]    Script Date: 5/3/2024 7:51:59 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teacher_ID_Role] ON [dbo].[Teacher]
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([IDQuestion])
REFERENCES [dbo].[Question] ([IDQuestion])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([IDSubject])
REFERENCES [dbo].[Subject] ([IDSubject])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Student] FOREIGN KEY([ID_Student])
REFERENCES [dbo].[Student] ([ID_Student])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Student]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Subject] FOREIGN KEY([IDSubject])
REFERENCES [dbo].[Subject] ([IDSubject])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Role]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Answer] FOREIGN KEY([IDAnswer])
REFERENCES [dbo].[Answer] ([IDAnswer])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Answer]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Question] FOREIGN KEY([IDQuestion])
REFERENCES [dbo].[Question] ([IDQuestion])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Question]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Student] FOREIGN KEY([ID_Student])
REFERENCES [dbo].[Student] ([ID_Student])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Student]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Subject] FOREIGN KEY([IDSubject])
REFERENCES [dbo].[Subject] ([IDSubject])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Subject]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Role]
GO
USE [master]
GO
ALTER DATABASE [MCQ] SET  READ_WRITE 
GO
