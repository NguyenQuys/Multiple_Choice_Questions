USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/23/2024 10:04:49 AM ******/
CREATE DATABASE [MCQ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MCQ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KTEAM\MSSQL\DATA\MCQ.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/23/2024 10:04:49 AM ******/
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
 CONSTRAINT [PK_Chapter] PRIMARY KEY CLUSTERED 
(
	[IdChapter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[CLOs]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 5/23/2024 10:04:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[IdCourse] [varchar](10) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[IdPLO] [int] NOT NULL,
	[AmountChapter] [int] NOT NULL,
	[AmountCLO] [int] NULL,
	[MinCorrectForCLO1] [int] NULL,
	[MinCorrectForCLO2] [int] NULL,
	[MinCorrectForCLO3] [int] NULL,
	[MinCorrectForCLO4] [int] NULL,
	[MinCorrectForCLO5] [int] NULL,
	[MinCorrectForCLO6] [int] NULL,
	[IdTeacherTake] [varchar](10) NOT NULL,
	[Time] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[IdCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/23/2024 10:04:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[IdExam] [int] IDENTITY(1,1) NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
	[IdChapter] [varchar](10) NOT NULL,
	[IdQuestion] [int] NOT NULL,
	[IdUser] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[IdExam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLOs]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 5/23/2024 10:04:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[IdResult] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
	[CorrectedCLO1] [int] NULL,
	[CorrectedCLO2] [int] NULL,
	[CorrectedCLO3] [int] NULL,
	[CorrectedCLO4] [int] NULL,
	[CorrectedCLO5] [int] NULL,
	[CorrectedCLO6] [int] NULL,
	[Skipped] [int] NOT NULL,
	[Score] [float] NOT NULL,
	[ExamDate] [datetime2](7) NOT NULL,
	[Status] [bit] NOT NULL,
	[Feedback] [nvarchar](max) NULL,
 CONSTRAINT [PK_Result] PRIMARY KEY CLUSTERED 
(
	[IdResult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Speciality]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/23/2024 10:04:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[IdStatistic] [int] IDENTITY(1,1) NOT NULL,
	[IdCourse] [varchar](10) NOT NULL,
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
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/23/2024 10:04:49 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/23/2024 10:04:49 AM ******/
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

INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (229, 78, N'a1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (230, 78, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (231, 78, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (232, 78, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (233, 79, N'a2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (234, 79, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (235, 79, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (236, 79, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (237, 80, N'a3true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (238, 80, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (239, 80, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (240, 80, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (241, 81, N'a4true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (242, 81, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (243, 81, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (244, 81, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (245, 82, N'a5true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (246, 82, N'a5', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (247, 82, N'a5', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (248, 82, N'a5', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (249, 83, N'a6true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (250, 83, N'a6', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (251, 83, N'a6', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (252, 83, N'a6', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1229, 1078, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1230, 1078, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1231, 1078, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1232, 1078, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1237, 1080, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1238, 1080, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1239, 1080, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1240, 1080, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1241, 1081, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1242, 1081, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1243, 1081, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1244, 1081, N'<strong>', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chapter1id', N'chaoter1name', 2, N'T', 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chapter2id', N'chapter2name', 2, N'T', 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'LTC', N'Lập trình C', 2, N'LT', 3)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'LTW', N'lập trình web', 2, N'LT', 3)
GO
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter1id', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter1id', 5)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter2id', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter2id', 6)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTC', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTC', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTW', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'LTW', 3)
GO
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (1, N'CLO1', N'nhớ dc cú pháp', N'remember', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (2, N'CLO2', N'viết dc hàm', N'understand', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (3, N'CLO3', N'Vaanj dungj duoc kien thuc', N'apply', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (4, N'CLO1dasua', N'nhớ dc cú pháp', N'remember', N'T')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (5, N'CLO2dasua', N'hiẻu dc html', N'understand', N'T')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (6, N'CLO3da', N'Vaanj dungj duoc kien thuc', N'apply', N'T')
GO
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdTeacherTake], [Time]) VALUES (N'LT', N'lập trình', 1, 2, 3, 1, 1, 1, NULL, NULL, NULL, N'TLT', 90)
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdTeacherTake], [Time]) VALUES (N'T', N'Triieets', 2, 2, 3, 3, 3, NULL, NULL, NULL, NULL, N'TTH', 90)
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1083, N'LT', N'LTC', 80, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1084, N'LT', N'LTC', 79, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1085, N'LT', N'LTW', 82, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1086, N'LT', N'LTW', 83, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1087, N'LT', N'LTC', 79, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1088, N'LT', N'LTC', 1080, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1089, N'LT', N'LTW', 81, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1090, N'LT', N'LTW', 1082, N'student2')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (1, N'PLO1', N'Công nghệ thông tin')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (2, N'PLO2', N'testplo')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (78, N'ch1CLO1', N'03bc5852-8bf3-40e2-9642-6b06ed1644c7.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (79, N'ch2clo1', N'b13be5c4-b1f7-403c-be43-99a8c2249190.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (80, N'ch3cl2', N'b4837fe1-64ad-4030-9f4e-71842e8a86aa.jpg', N'LTC', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (81, N'ch4clo1', N'236adc33-136f-4fe3-8520-038ba6a8fb5b.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (82, N'ch5clo3', N'590a4937-7292-44be-be32-ea704ad6bba8.jpg', N'LTW', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (83, N'ch6clo3', N'2802cc74-a261-45f2-aa15-1aead41b0884.jpg', N'LTW', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1078, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'6bfde7a2-6940-4f5a-91df-ddb1c477ea78.jpg', N'LTC', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1080, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'cfb66076-2cf0-4273-9611-7a8f5a66cb30.jpg', N'LTC', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1081, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'df4f8b52-e81b-4a9b-bcdd-36758da45098.jpg', N'LTW', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1082, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'8349ad25-0ea0-42da-9dca-4d691ec53d85.jpg', N'LTW', 3)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Result] ([IdResult], [IdUser], [IdCourse], [CorrectedCLO1], [CorrectedCLO2], [CorrectedCLO3], [CorrectedCLO4], [CorrectedCLO5], [CorrectedCLO6], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', N'student1', N'LT', 2, 1, 1, 0, 0, 0, 0, 10, CAST(N'2024-05-21T23:17:01.0506264' AS DateTime2), 1, NULL)
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TLT', N'Lập trình')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TTH', N'Triết học')
GO
SET IDENTITY_INSERT [dbo].[Statistic] ON 

INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (2, N'LT', 2, 1, 1, 6.25)
INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1018, N'T', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Statistic] OFF
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN1', N'student1', N'LT', 80, 237, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN2', N'student1', N'LT', 78, 229, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN3', N'student1', N'LT', 81, 241, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN4', N'student1', N'LT', 82, 245, 1)
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'admin', N'hoai', CAST(N'2024-05-11' AS Date), 1, N'admin@gmail.com', 3, N'0147963258', NULL, N'$2a$11$YzikqZvuApysKETy99Kgvu.76MM5qq0093m1opzs0DYqCisTJvQMK', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student1', N'student1name', CAST(N'2024-05-10' AS Date), 1, N'student1@gmail.com', 1, N'0321654987', NULL, N'$2a$11$LVzHgl0cDAR.vW0dGk7Tv.UetGsi4UsSqaHxp9SCQENuB09Ax9cnq', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student2', N'student2name', CAST(N'2024-05-02' AS Date), 1, N'student2@gmail.com', 1, N'0147852369', NULL, N'$2a$11$M0OMPCTx6oTWe4Bu39xcWu85yByrwODS0AWgiIG2APoOFx175FNU2', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'teacher1', N'teacher1name', CAST(N'2024-05-09' AS Date), 1, N'teacher1@gmail.com', 2, N'0123456789', N'TLT', N'$2a$11$0JGfnjYzWArTrAjrOzq4C.BSqPvrQHKJyiccYm3qXC.lKxNM6ISSC', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'teacher2', N'teacher2name', CAST(N'2024-05-03' AS Date), 1, N'teacher2@gmail.co', 2, N'0147963258', N'TTH', N'$2a$11$mdzEq2fzwh2XCY7qN/Vx2u7H.aGeD4wLcPltaMZ8GYVeB6PQkT2wy', 0, NULL, 0)
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
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
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_User]
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
