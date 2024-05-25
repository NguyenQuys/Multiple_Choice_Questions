USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/25/2024 12:36:50 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[CLOs]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 5/25/2024 12:36:51 PM ******/
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
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[IdCourse] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[PLOs]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Speciality]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/25/2024 12:36:51 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/25/2024 12:36:51 PM ******/
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

INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1519, 1169, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1520, 1169, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1521, 1169, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1522, 1169, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1523, 1170, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1524, 1170, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1525, 1170, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1526, 1170, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1527, 1171, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1528, 1171, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1529, 1171, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1530, 1171, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1531, 1172, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1532, 1172, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1533, 1172, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1534, 1172, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1535, 1173, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1536, 1173, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1537, 1173, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1538, 1173, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1539, 1174, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1540, 1174, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1541, 1174, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1542, 1174, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1543, 1175, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1544, 1175, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1545, 1175, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1546, 1175, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1547, 1176, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1548, 1176, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1549, 1176, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1550, 1176, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1551, 1177, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1552, 1177, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1553, 1177, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1554, 1177, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1555, 1178, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1556, 1178, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1557, 1178, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1558, 1178, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1559, 1179, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1560, 1179, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1561, 1179, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1562, 1179, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1563, 1180, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1564, 1180, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1565, 1180, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1566, 1180, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1567, 1181, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1568, 1181, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1569, 1181, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1570, 1181, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1571, 1182, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1572, 1182, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1573, 1182, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1574, 1182, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1575, 1183, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1576, 1183, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1577, 1183, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1578, 1183, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1579, 1184, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1580, 1184, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1581, 1184, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1582, 1184, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1583, 1185, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1584, 1185, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1585, 1185, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1586, 1185, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1587, 1186, N'Chap1CLo1.1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1588, 1186, N'Chap1CLo1.2F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1589, 1186, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1590, 1186, N'Chap1CLo1.1F', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1591, 1187, N'a1true', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1592, 1187, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1593, 1187, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1594, 1187, N'a1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1595, 1188, N'a2true', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1596, 1188, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1597, 1188, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1598, 1188, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1599, 1189, N'a3tr', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1600, 1189, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1601, 1189, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1602, 1189, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1603, 1190, N'a4', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1604, 1190, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1605, 1190, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1606, 1190, N'a4', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
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
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter]) VALUES (N'LT', N'lập trình ', 1, 3, 3, 2, 2, 2, NULL, NULL, NULL, N'TLT', N'teacher1', 90, 1, 3)
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter]) VALUES (N'T', N'Triieets', 2, 2, 2, 1, 1, NULL, NULL, NULL, NULL, N'TTH', N'teacher2', 23, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1299, N'LT', N'chap1', 1169, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1300, N'LT', N'chap1', 1172, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1301, N'LT', N'chap1', 1173, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1302, N'LT', N'chap2', 1175, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1303, N'LT', N'chap2', 1180, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1304, N'LT', N'chap2', 1177, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1305, N'LT', N'chap3', 1183, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1306, N'LT', N'chap3', 1185, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1307, N'LT', N'chap3', 1182, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1308, N'LT', N'chap1', 1172, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1309, N'LT', N'chap1', 1173, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1310, N'LT', N'chap1', 1169, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1311, N'LT', N'chap2', 1175, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1312, N'LT', N'chap2', 1180, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1313, N'LT', N'chap2', 1177, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1314, N'LT', N'chap3', 1184, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1315, N'LT', N'chap3', 1185, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1316, N'LT', N'chap3', 1181, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1317, N'T', N'chapter1id', 1188, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1318, N'T', N'chapter2id', 1190, N'student1')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1319, N'T', N'chapter1id', 1187, N'student2')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1320, N'T', N'chapter2id', 1189, N'student2')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (1, N'PLO1', N'Công nghệ thông tin')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (2, N'PLO2', N'testplo')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1169, N'Chap1CLo1.1', N'0a57de11-6d66-48aa-b3bd-1cd9efc9f105.jpg', N'chap1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1170, N'Chap1CLo1.2', N'46efecb9-4bd3-4770-a2dd-e1d4f9dd3c91.jpg', N'chap1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1171, N'chap1clo2.1', N'e7f34506-c146-48ec-9238-c2d8e1a24aa1.jpg', N'chap1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1172, N'chap1clo2.2', N'ba88970f-44a0-4464-8ee4-e25307bd9a5d.jpg', N'chap1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1173, N'chap1clo3.1', N'4ef4a784-f2c7-4597-8b72-56a31c3d3423.jpg', N'chap1', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1174, N'chap1clo3.2', N'e61d2e44-2fd2-433a-8507-5c1bb55d7d8f.jpg', N'chap1', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1175, N'chap2clo1.1', N'25c9d87e-fcd3-49de-8ac1-769734303194.jpg', N'chap2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1176, N'chap2clo1.2', N'859d349b-1c64-405a-8255-ef683c90976f.jpg', N'chap2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1177, N'chap2clo2.1', N'3abbf9da-7223-44ed-8f4f-e7f0b5d707f8.jpg', N'chap2', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1178, N'chap2clo2.2', N'84071e01-1aaf-442b-95b4-99f2ff98ee63.jpg', N'chap2', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1179, N'chap2clo3.1', N'02040e68-f4a0-4cbe-82e1-387db5471ed2.jpg', N'chap2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1180, N'chap2clo3.2', N'12d9b8b6-e597-4edd-864c-20b4ab375f8c.jpg', N'chap2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1181, N'chap3clo1.1', N'c06a56d5-c594-427d-8443-7e091c2ec14b.jpg', N'chap3', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1182, N'chap3clo1.2', N'20d150b0-b7a8-421e-97cf-bc449b88209c.jpg', N'chap3', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1183, N'chap3clo2.1', N'553d40ac-3ae8-4d72-aa08-b132b07c9a9c.jpg', N'chap3', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1184, N'chap3clo2.2', N'd3160324-69d4-488c-8387-2d0a4e7c5bcc.jpg', N'chap3', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1185, N'chap3clo3.1', N'f915b848-4814-47ea-b7a5-4d9b16f1dcb8.jpg', N'chap3', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1186, N'chap3clo3.2', N'b26deaac-227f-45dd-86b9-b0b0597d0afb.jpg', N'chap3', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1187, N'a1dasua', N'7f10c091-9e8a-41f0-958a-17e3c2b21686.jpg', N'chapter1id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1188, N'a2dasua', N'032664aa-6718-4fa6-baa9-9b25dafc3452.jpg', N'chapter1id', 5)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1189, N'a3test', N'70f26a54-781b-452b-8f2c-4d3140aef385.jpg', N'chapter2id', 4)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1190, N'a4test', N'34dcf774-2b18-45cb-8d93-923d334cde1b.jpg', N'chapter2id', 5)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Result] ([IdResult], [IdUser], [IdCourse], [CorrectedCLO1], [CorrectedCLO2], [CorrectedCLO3], [CorrectedCLO4], [CorrectedCLO5], [CorrectedCLO6], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', N'student1', N'LT', 2, 2, 3, 0, 0, 0, 0, 7.33, CAST(N'2024-05-24T22:04:25.4303903' AS DateTime2), 1, NULL)
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TLT', N'Lập trình')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TTH', N'Triết học')
GO
SET IDENTITY_INSERT [dbo].[Statistic] ON 

INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1025, N'LT', 2, 1, 1, 8.665)
INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1030, N'T', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Statistic] OFF
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN1', N'student1', N'LT', 1169, 1519, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN2', N'student1', N'LT', 1172, 1531, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN3', N'student1', N'LT', 1173, 1535, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN4', N'student1', N'LT', 1175, 1544, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN5', N'student1', N'LT', 1180, 1563, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN6', N'student1', N'LT', 1177, 1551, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN7', N'student1', N'LT', 1183, 1577, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN8', N'student1', N'LT', 1185, 1583, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN9', N'student1', N'LT', 1182, 1571, 1)
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'admin', N'hoai', CAST(N'2024-05-11' AS Date), 1, N'admin@gmail.com', 3, N'0147963258', NULL, N'$2a$11$YzikqZvuApysKETy99Kgvu.76MM5qq0093m1opzs0DYqCisTJvQMK', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student1', N'student1name', CAST(N'2024-05-10' AS Date), 1, N'nguyenhuuquy110203@gmail.com', 1, N'0321654987', NULL, N'$2a$11$YzikqZvuApysKETy99Kgvu.76MM5qq0093m1opzs0DYqCisTJvQMK', 0, NULL, 1)
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
