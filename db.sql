USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/20/2024 1:23:38 AM ******/
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
ALTER DATABASE [MCQ] SET READ_COMMITTED_SNAPSHOT OFF 
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/20/2024 1:23:39 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[IdAnswer] [int] IDENTITY(1,1) NOT NULL,
	[IdQuestion] [int] NOT NULL,
	[Answer_Title] [nvarchar](max) NOT NULL,
	[Key] [bit] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[IdAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapter](
	[IdChapter] [varchar](10) NOT NULL,
	[ChapterName] [nvarchar](max) NOT NULL,
	[AmountCLO] [int] NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
	[AmountQuestions] [int] NOT NULL,
	[MinCorrectQuestion] [int] NOT NULL,
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[IdChapter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChapterDetails](
	[IdChapter] [varchar](10) NOT NULL,
	[IdCLO] [int] NOT NULL,
 CONSTRAINT [PK_ChapterDetails] PRIMARY KEY CLUSTERED 
(
	[IdChapter] ASC,
	[IdCLO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLOs]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLOs](
	[IdCLO] [int] NOT NULL,
	[CLOName] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Bloom] [varchar](max) NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
 CONSTRAINT [PK_CLOs] PRIMARY KEY CLUSTERED 
(
	[IdCLO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[IdContact] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[SendDate] [datetime] NOT NULL,
	[IdUser] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[IdContact] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[IdCourse] [varchar](10) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[IdPLO] [int] NOT NULL,
	[AmountChapter] [int] NOT NULL,
	[AmountCLO] [int] NOT NULL,
	[IdTeacherTake] [varchar](10) NOT NULL,
	[Time] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[IdCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[IdExam] [int] IDENTITY(1,1) NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
	[IdClo] [int] NOT NULL,
	[IdChapter] [varchar](10) NOT NULL,
	[IdQuestion] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[IdExam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLOs]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLOs](
	[IdPLO] [int] NOT NULL,
	[PLOName] [varchar](5) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PLOs] PRIMARY KEY CLUSTERED 
(
	[IdPLO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[IdQuestion] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[LinkImage] [nvarchar](max) NOT NULL,
	[IdChapter] [varchar](10) NULL,
	[IdCLO] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[IdQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[IdResult] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[IdCourse] [varchar](10) NULL,
	[CorrectedCLO1] [int] NULL,
	[CorrectedCLO2] [int] NULL,
	[CorrectedCLO3] [int] NULL,
	[Skipped] [int] NULL,
	[Score] [float] NULL,
	[ExamDate] [datetime2](7) NULL,
	[Status] [bit] NULL,
	[Feedback] [nvarchar](max) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[IdResult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id_Role] [int] NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[IdSpeciality] [varchar](10) NOT NULL,
	[SpecialityName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[IdSpeciality] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[IdStatistic] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[IdCourse] [varchar](10) NULL,
	[TotalStudent] [int] NULL,
	[AmountPassed] [int] NULL,
	[AmountFailed] [int] NULL,
	[AverageScore] [float] NULL,
 CONSTRAINT [PK_Statistic] PRIMARY KEY CLUSTERED 
(
	[IdStatistic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[ID_Student_Answer] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[IdCourse] [varchar](10) NULL,
	[IdQuestion] [int] NOT NULL,
	[IdAnswer] [int] NULL,
	[IsCorrect] [bit] NULL,
 CONSTRAINT [PK_Student_Answer] PRIMARY KEY CLUSTERED 
(
	[ID_Student_Answer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/20/2024 1:23:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [varchar](10) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Id_Role] [int] NOT NULL,
	[Phone_Number] [varchar](10) NULL,
	[IdSpecility] [varchar](10) NULL,
	[Password] [varchar](max) NULL,
	[Hide] [bit] NOT NULL,
	[LockTime] [datetime] NULL,
	[FailedLoginAttempts] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Answer] ON 

INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (100, 42, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (101, 42, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (102, 42, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (103, 42, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (104, 43, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (105, 43, N'a2', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (106, 43, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (107, 43, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (108, 44, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (109, 44, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (110, 44, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (111, 44, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (112, 45, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (113, 45, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (114, 45, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (115, 45, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (116, 46, N'tra loi 1.1 dung', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (117, 47, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (118, 47, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (119, 47, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (120, 47, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (121, 48, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (122, 48, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (123, 48, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (124, 48, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (125, 49, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (126, 49, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (127, 49, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (128, 49, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (129, 50, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (130, 50, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (131, 50, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (132, 50, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (133, 51, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (134, 51, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (135, 51, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (136, 51, N'<a src=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (137, 52, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (138, 52, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (139, 52, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (140, 52, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (141, 53, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (142, 53, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (143, 53, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (144, 53, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (145, 54, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (146, 54, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (147, 54, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (148, 54, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (149, 55, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (150, 55, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (151, 55, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (152, 55, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (153, 56, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (154, 56, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (155, 56, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (156, 56, N'<a src=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (157, 57, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (158, 57, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (159, 57, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (160, 57, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (161, 58, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (162, 58, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (163, 58, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (164, 58, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (165, 59, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (166, 59, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (167, 59, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (168, 59, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (169, 60, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (170, 60, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (171, 60, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (172, 60, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (173, 61, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (174, 61, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (175, 61, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (176, 61, N'<a src=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (177, 62, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (178, 62, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (179, 62, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (180, 62, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (181, 63, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (182, 63, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (183, 63, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (184, 63, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (185, 64, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (186, 64, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (187, 64, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (188, 64, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (189, 65, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (190, 65, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (191, 65, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (192, 65, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (193, 66, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (194, 66, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (195, 66, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (196, 66, N'<a src=”http://www.example.com”> Example</a>', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions], [MinCorrectQuestion]) VALUES (N'LTC', N'Lập trình C', 2, N'LTC', 15, 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions], [MinCorrectQuestion]) VALUES (N'LTW', N'lập trình web', 2, N'LTC', 10, 3)
GO
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTC', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTC', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTW', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTW', 3)
GO
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (1, N'CLO', N'nhớ dc cú pháp', N'remember', N'LTC')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (2, N'CLO2', N'hiẻu dc html', N'understand', N'LTC')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (3, N'CLO3', N'Vaanj dungj duoc kien thuc', N'apply', N'LTC')
GO
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [IdTeacherTake], [Time]) VALUES (N'LTC', N'lập trình c', 1, 2, 3, N'LT', 90)
GO
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (1, N'PLO', N'công nghệ thông tin')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (42, N'a1', N'262dab44-5184-40ef-8a8e-120199ff5ed5.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (43, N'a2', N'ab8c4367-d10f-49e5-aab7-4eb7166d4b2a.jpg', N'LTC', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (44, N'a3', N'e7c73019-18a4-47cd-882b-88b90b458152.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (45, N'a4', N'e99fe0a9-637c-4d0e-9323-611ad368dd4d.jpg', N'LTW', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (46, N'cau hoi 2 da sua', N'c45b8bc0-85a9-4091-8a2f-539fa85dc40c.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (47, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'46111495-8228-46a0-b79a-59e1b1c47185.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (48, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'2684528a-55bb-49b5-ac4c-7d3019073e51.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (49, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'96e764bc-5b2b-49b9-b797-030f91c0b8ed.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (50, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'9474865c-03e9-4297-adcd-fcb27423163d.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (51, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'8b555e13-b267-4f2b-a60d-fbfa43e38710.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (52, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'ecee5571-0c55-4c17-a710-351bc4c4ce3e.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (53, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'9f739708-83be-4f62-96a0-bcfd46c0ec69.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (54, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'0430c25d-2dda-4562-ae23-90408a9a2804.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (55, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'e617cded-0f83-4afa-bd68-f8515842d17f.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (56, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'5c4efce6-60b7-45c0-8d38-cb962a59ea57.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (57, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'59cf45f2-52a2-4a45-870e-cf2aee6aff60.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (58, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'51661504-95cc-4b28-aa82-2f4290cd5d5a.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (59, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'57ad9c52-52c4-4290-b19f-98c675c68d6f.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (60, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'f7f82dd2-8fc3-4c87-ac02-0c4e1d5d759f.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (61, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'6dceddb4-9a96-4ad9-93f2-fd40e8b7667a.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (62, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'5d73ae6a-7308-4db8-bb62-415e4864e378.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (63, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'82ffc8c7-9f57-4b0f-b8ac-57502e1dc844.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (64, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'5b062864-eaa0-4820-bf42-29e323d20ab9.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (65, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'ddec4bd3-e894-4419-b6a8-971204ea7380.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (66, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'c21d7789-5283-4acd-a7cb-5527e2b39674.jpg', N'LTW', 1)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'admin')
GO
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'LT', N'Lập trình')
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'teacher1', N'quy', CAST(N'2024-05-09' AS Date), 1, N'teacher1@gmail.com', 1, N'0123456789', N'LT', N'$2a$11$0JGfnjYzWArTrAjrOzq4C.BSqPvrQHKJyiccYm3qXC.lKxNM6ISSC', 0, NULL, 0)
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_CLOs] FOREIGN KEY([AmountCLO])
REFERENCES [dbo].[CLOs] ([IdCLO])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_CLOs]
GO
ALTER TABLE [dbo].[Chapter]  WITH CHECK ADD  CONSTRAINT [FK_Chapter_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Chapter] CHECK CONSTRAINT [FK_Chapter_Courses]
GO
ALTER TABLE [dbo].[ChapterDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChapterDetails_Chapter] FOREIGN KEY([IdChapter])
REFERENCES [dbo].[Chapter] ([IdChapter])
GO
ALTER TABLE [dbo].[ChapterDetails] CHECK CONSTRAINT [FK_ChapterDetails_Chapter]
GO
ALTER TABLE [dbo].[ChapterDetails]  WITH CHECK ADD  CONSTRAINT [FK_ChapterDetails_CLOs] FOREIGN KEY([IdCLO])
REFERENCES [dbo].[CLOs] ([IdCLO])
GO
ALTER TABLE [dbo].[ChapterDetails] CHECK CONSTRAINT [FK_ChapterDetails_CLOs]
GO
ALTER TABLE [dbo].[CLOs]  WITH CHECK ADD  CONSTRAINT [FK_CLOs_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[CLOs] CHECK CONSTRAINT [FK_CLOs_Courses]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_User]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_PLOs] FOREIGN KEY([IdPLO])
REFERENCES [dbo].[PLOs] ([IdPLO])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_PLOs]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Chapter] FOREIGN KEY([IdChapter])
REFERENCES [dbo].[Chapter] ([IdChapter])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Chapter]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_CLOs] FOREIGN KEY([IdClo])
REFERENCES [dbo].[CLOs] ([IdCLO])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_CLOs]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Courses]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Question]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_ChapterDetails] FOREIGN KEY([IdChapter], [IdCLO])
REFERENCES [dbo].[ChapterDetails] ([IdChapter], [IdCLO])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_ChapterDetails]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Courses]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_User]
GO
ALTER TABLE [dbo].[Statistic]  WITH CHECK ADD  CONSTRAINT [FK_Statistic_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Statistic] CHECK CONSTRAINT [FK_Statistic_Courses]
GO
ALTER TABLE [dbo].[Statistic]  WITH CHECK ADD  CONSTRAINT [FK_Statistic_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Statistic] CHECK CONSTRAINT [FK_Statistic_User]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Answer] FOREIGN KEY([IdAnswer])
REFERENCES [dbo].[Answer] ([IdAnswer])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Answer]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Courses] FOREIGN KEY([IdCourse])
REFERENCES [dbo].[Courses] ([IdCourse])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Courses]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Question]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Role] ([Id_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Speciality] FOREIGN KEY([IdSpecility])
REFERENCES [dbo].[Speciality] ([IdSpeciality])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Speciality]
GO
USE [master]
GO
ALTER DATABASE [MCQ] SET  READ_WRITE 
GO
