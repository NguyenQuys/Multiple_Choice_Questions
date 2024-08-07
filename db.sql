USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/27/2024 3:08:29 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 5/27/2024 3:08:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[IdBlog] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
	[Hide] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[IdBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[CLOs]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 5/27/2024 3:08:30 PM ******/
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
	[IdSpeciality] [varchar](10) NOT NULL,
	[IdTeacherTake] [varchar](10) NULL,
	[Time] [int] NOT NULL,
	[IsSetUp] [bit] NOT NULL,
	[QuestionSelectedPerChapter] [int] NOT NULL,
	[Image] [varchar](max) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[IdCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[PLOs]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Speciality]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/27/2024 3:08:30 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/27/2024 3:08:30 PM ******/
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

INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1773, 1319, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1774, 1319, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1775, 1319, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1776, 1319, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1777, 1320, N'Chap1CLo1.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1778, 1320, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1779, 1320, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1780, 1320, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1781, 1321, N'chap1clo2.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1782, 1321, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1783, 1321, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1784, 1321, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1785, 1322, N'chap1clo2.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1786, 1322, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1787, 1322, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1788, 1322, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1789, 1323, N'chap1clo3.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1790, 1323, N'chap1clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1791, 1323, N'chap1clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1792, 1323, N'chap1clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1793, 1324, N'chap1clo3.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1794, 1324, N'chap1clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1795, 1324, N'chap1clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1796, 1324, N'chap1clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1797, 1325, N'chap2clo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1798, 1325, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1799, 1325, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1800, 1325, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1801, 1326, N'chap2clo1.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1802, 1326, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1803, 1326, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1804, 1326, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1805, 1327, N'chap2clo2.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1806, 1327, N'chap2clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1807, 1327, N'chap2clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1808, 1327, N'chap2clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1809, 1328, N'chap2clo2.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1810, 1328, N'chap2clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1811, 1328, N'chap2clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1812, 1328, N'chap2clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1813, 1329, N'chap2clo3.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1814, 1329, N'chap2clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1815, 1329, N'chap2clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1816, 1329, N'chap2clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1817, 1330, N'chap2clo3.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1818, 1330, N'chap2clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1819, 1330, N'chap2clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1820, 1330, N'chap2clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1821, 1331, N'chap3clo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1822, 1331, N'chap3clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1823, 1331, N'chap3clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1824, 1331, N'chap3clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1825, 1332, N'chap3clo1.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1826, 1332, N'chap3clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1827, 1332, N'chap3clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1828, 1332, N'chap3clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1829, 1333, N'chap3clo2.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1830, 1333, N'chap3clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1831, 1333, N'chap3clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1832, 1333, N'chap3clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1833, 1334, N'chap3clo2.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1834, 1334, N'chap3clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1835, 1334, N'chap3clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1836, 1334, N'chap3clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1837, 1335, N'chap3clo3.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1838, 1335, N'chap3clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1839, 1335, N'chap3clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1840, 1335, N'chap3clo3.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1841, 1336, N'chap3clo3.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1842, 1336, N'chap3clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1843, 1336, N'chap3clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1844, 1336, N'chap3clo3.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1845, 1337, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1846, 1337, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1847, 1337, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1848, 1337, N'Chap1CLo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1849, 1338, N'Chap1CLo1.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1850, 1338, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1851, 1338, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1852, 1338, N'Chap1CLo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1853, 1339, N'chap1clo2.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1854, 1339, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1855, 1339, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1856, 1339, N'chap1clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1857, 1340, N'chap1clo2.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1858, 1340, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1859, 1340, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1860, 1340, N'chap1clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1861, 1341, N'chap2clo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1862, 1341, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1863, 1341, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1864, 1341, N'chap2clo1.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1865, 1342, N'chap2clo1.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1866, 1342, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1867, 1342, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1868, 1342, N'chap2clo1.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1869, 1343, N'chap2clo2.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1870, 1343, N'chap2clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1871, 1343, N'chap2clo2.1f', 0)
GO
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1872, 1343, N'chap2clo2.1f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1873, 1344, N'chap2clo2.2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1874, 1344, N'chap2clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1875, 1344, N'chap2clo2.2f', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1876, 1344, N'chap2clo2.2f', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Blog] ([IdBlog], [Title], [Content], [Order], [Hide], [Image]) VALUES (1, N'Vai trò của ngành công nghệ thông tin trong giáo dục', N'Sự ra đời của công nghệ thông tin là sự tích hợp đồng thời các tiến bộ về công nghệ và tổ chức thông tin, đem đến nhiều ảnh hưởng tích cực cho sự phát triển của giáo dục.

Công nghệ thông tin và đặc biệt là sự phát triển của internet mở ra một kho kiến thức vô cùng đa dạng và phong phú cho người học và người dạy, giúp cho việc tìm hiểu kiến thức đơn giản hơn rất nhiều, cải thiện chất lượng học và dạy.', 1, 0, N'grabd0fa3ve_dep_hue.jpg')
INSERT [dbo].[Blog] ([IdBlog], [Title], [Content], [Order], [Hide], [Image]) VALUES (2, N'Ngành công nghệ phần mềm', N'Công nghệ phần mềm là một trong những chuyên ngành của khối Công nghệ thông tin, tập trung vào việc nghiên cứu về phần mềm và các hệ thống kỹ thuật của máy tính. Chuyên ngành này đào tạo chuyên sâu vào việc khảo sát cơ sở dữ liệu, nền tảng phần mềm và sự phát triển của các ứng dụng, hệ thống. Ngoài ra, ngành Công nghệ phần mềm còn đóng vai trò quan trọng việc xây dựng các ứng dụng hỗ trợ tối ưu hoạt động kinh doanh và nâng cao chất lượng cuộc sống con người.', 2, 0, N'nganh-cong-nghe-phan-mem.jpg')
GO
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chap1', N'c1', 3, N'LT', 3)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chap2', N'c2', 3, N'LT', 3)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chap3', N'c3', 3, N'LT', 3)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chapter1id', N'chaoter1name', 2, N'T', 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'chapter2id', N'chapter2name', 2, N'T', 2)
GO
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap1', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap1', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap1', 3)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap2', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap2', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap2', 3)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap3', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap3', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chap3', 3)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter1id', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter1id', 5)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter2id', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'chapter2id', 5)
GO
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (1, N'CLO1', N'nhớ dc cú pháp', N'remember', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (2, N'CLO2', N'hiẻu dc html', N'understand', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (3, N'CLO3', N'Vaanj dungj duoc kien thuc', N'apply', N'LT')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (4, N'CLO1dasua', N'nhớ dc cú pháp', N'remember', N'T')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (5, N'CLO2dasua', N'hiẻu dc html', N'understand', N'T')
GO
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter], [Image]) VALUES (N'LT', N'lập trình ', 1, 3, 3, 2, 2, 2, NULL, NULL, NULL, N'TLT', N'teacher1', 90, 1, 3, N'ngonlaptrinhc.jpg')
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter], [Image]) VALUES (N'T', N'Triết', 2, 2, 2, 1, 1, NULL, NULL, NULL, NULL, N'TTH', N'teacher2', 23, 1, 1, N'triet-hoc.jpg')
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1321, N'LT', N'chap1', 1319, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1322, N'LT', N'chap1', 1324, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1323, N'LT', N'chap1', 1321, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1324, N'LT', N'chap2', 1327, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1325, N'LT', N'chap2', 1325, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1326, N'LT', N'chap2', 1330, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1327, N'LT', N'chap3', 1331, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1328, N'LT', N'chap3', 1333, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1329, N'LT', N'chap3', 1335, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1330, N'LT', N'chap1', 1319, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1331, N'LT', N'chap1', 1321, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1332, N'LT', N'chap1', 1324, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1333, N'LT', N'chap2', 1327, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1334, N'LT', N'chap2', 1326, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1335, N'LT', N'chap2', 1329, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1336, N'LT', N'chap3', 1331, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1337, N'LT', N'chap3', 1335, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1338, N'LT', N'chap3', 1333, N'student2')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (1, N'PLO1', N'Công nghệ thông tin')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (2, N'PLO2', N'testplo')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1319, N'Chap1CLo1.1', N'ab595e02-f471-46dd-b380-547b4438715e.jpg', N'chap1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1320, N'Chap1CLo1.2', N'24be7acf-94f9-41a7-bbf6-5c1ab3eb6176.jpg', N'chap1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1321, N'chap1clo2.1', N'f82e026a-6fdf-4566-88f0-294174207732.jpg', N'chap1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1322, N'chap1clo2.2', N'e6e79af2-79d6-4f6d-8bfd-c587ba12d8c7.jpg', N'chap1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1323, N'chap1clo3.1', N'07194fac-a156-4336-9fb1-cbb63dcd1b1d.jpg', N'chap1', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1324, N'chap1clo3.2', N'3c11098e-e091-4a5f-be82-7e9a8db8e513.jpg', N'chap1', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1325, N'chap2clo1.1', N'aca350f3-1765-4bb7-afe9-436a71c51849.jpg', N'chap2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1326, N'chap2clo1.2', N'd036f985-6cb1-4687-bafc-54c9c9f7e02b.jpg', N'chap2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1327, N'chap2clo2.1', N'5dd47cdb-36a7-40c0-9faa-347aea1ee849.jpg', N'chap2', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1328, N'chap2clo2.2', N'09b8b000-688e-400a-8416-86f4748d8a7d.jpg', N'chap2', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1329, N'chap2clo3.1', N'd1a3778b-35f0-435f-817c-4201fdcb1746.jpg', N'chap2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1330, N'chap2clo3.2', N'a43b427b-5df2-4e75-9518-864b8de7aab8.jpg', N'chap2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1331, N'chap3clo1.1', N'753d7980-41b3-4daa-b048-e1cc6a16ba61.jpg', N'chap3', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1332, N'chap3clo1.2', N'125039d2-392f-4779-bdea-0987c409e63d.jpg', N'chap3', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1333, N'chap3clo2.1', N'9b2a15b7-e510-46e7-8122-bf6de1161bdb.jpg', N'chap3', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1334, N'chap3clo2.2', N'0c0b0f29-32bd-421c-b68e-8115726f38d4.jpg', N'chap3', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1335, N'chap3clo3.1', N'6985ca51-aba8-4e3f-a51a-0ea3205b9a60.jpg', N'chap3', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1336, N'chap3clo3.2', N'65be4858-2750-4df6-acda-197e940ebb3c.jpg', N'chap3', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1337, N'TrietChap1CLo1.1', N'939ad0ea-4a09-4a6c-b48f-4c99254f6d29.jpg', N'chapter1id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1338, N'TrietChap1CLo1.2', N'f0702620-22a3-401c-8be3-b14840a803c2.jpg', N'chapter1id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1339, N'Trietchap1clo2.1', N'1cce13fd-4569-4c4f-9198-01c9a782f504.jpg', N'chapter1id', 5)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1340, N'Trietchap1clo2.2', N'ba66dcc3-69c1-46b4-bf41-8aafb9de0728.jpg', N'chapter1id', 5)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1341, N'Trietchap2clo1.1', N'2704d346-5cb6-4d2e-ac7f-033e1e25f445.jpg', N'chapter2id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1342, N'Trietchap2clo1.2', N'e68e5950-6df0-44fe-88c4-14188e72ced9.jpg', N'chapter2id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1343, N'Trietchap2clo2.1', N'5432fd16-94d2-424f-b52b-e9019f5232c7.jpg', N'chapter2id', 5)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1344, N'Trietchap2clo2.2', N'dba148bb-11cb-4c24-9c2d-cb54b07e2d80.jpg', N'chapter2id', 5)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Result] ([IdResult], [IdUser], [IdCourse], [CorrectedCLO1], [CorrectedCLO2], [CorrectedCLO3], [CorrectedCLO4], [CorrectedCLO5], [CorrectedCLO6], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', N'student1', N'LT', 3, 3, 3, 0, 0, 0, 0, 10, CAST(N'2024-05-27T14:23:21.5850353' AS DateTime2), 1, NULL)
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TLT', N'Lập trình')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TTH', N'Triết học')
GO
SET IDENTITY_INSERT [dbo].[Statistic] ON 

INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1025, N'LT', 1, 1, 0, 7.33)
INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1030, N'T', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Statistic] OFF
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN1', N'student1', N'LT', 1319, 1773, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN2', N'student1', N'LT', 1324, 1793, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN3', N'student1', N'LT', 1321, 1781, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN4', N'student1', N'LT', 1327, 1805, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN5', N'student1', N'LT', 1325, 1797, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN6', N'student1', N'LT', 1330, 1817, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN7', N'student1', N'LT', 1331, 1821, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN8', N'student1', N'LT', 1333, 1829, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN9', N'student1', N'LT', 1335, 1837, 1)
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'admin', N'hoai', CAST(N'2024-05-11' AS Date), 1, N'admin@gmail.com', 3, N'0147963258', NULL, N'$2a$11$YzikqZvuApysKETy99Kgvu.76MM5qq0093m1opzs0DYqCisTJvQMK', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student1', N'student1name', CAST(N'2024-05-10' AS Date), 1, N'nguyenhuuquy110203@gmail.com', 1, N'0321654987', NULL, N'$2a$11$guFsPuZMtoJzzmI0ov9ZvuJZesZ9Pct9SVLCv53SxGmiDfTAMn6k2', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student2', N'student2name', CAST(N'2024-05-02' AS Date), 1, N'student2@gmail.com', 1, N'0147852369', NULL, N'$2a$11$fBa7XxWQ5.poOUv5J9txUuhhTlWEigq3.pKsTQcF.ChaZcYkOkcl2', 0, NULL, 0)
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
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_User] FOREIGN KEY([IdTeacherTake])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_User]
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
