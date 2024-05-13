USE [master]
GO
/****** Object:  Database [MCQ]    Script Date: 5/13/2024 5:52:32 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/13/2024 5:52:32 PM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[IdAnswer] [int] NOT NULL,
	[IdQuestion] [int] NOT NULL,
	[Answer_Title] [nvarchar](max) NOT NULL,
	[Key] [bit] NOT NULL,
 CONSTRAINT [PK_Answer] PRIMARY KEY CLUSTERED 
(
	[IdAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/13/2024 5:52:32 PM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[IdQuestion] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[IdSubject] [varchar](10) NOT NULL,
	[Level] [int] NOT NULL,
	[LinkImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[IdQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[IdResult] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
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
	[IdResult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/13/2024 5:52:32 PM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statistic](
	[IdStatistic] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[IdSubject] [varchar](10) NULL,
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
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[ID_Student_Answer] [varchar](10) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[IdSubject] [varchar](10) NULL,
	[IdQuestion] [int] NOT NULL,
	[IdAnswer] [int] NULL,
	[IsCorrect] [bit] NULL,
 CONSTRAINT [PK_Student_Answer] PRIMARY KEY CLUSTERED 
(
	[ID_Student_Answer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[IdSubject] [varchar](10) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
	[IdUser] [varchar](10) NULL,
	[Time] [int] NOT NULL,
	[AmountQuestionLevel1] [int] NOT NULL,
	[MinCorrectAnswerLevel1] [int] NOT NULL,
	[AmountQuestionLevel2] [int] NOT NULL,
	[MinCorrectAnswerLevel2] [int] NOT NULL,
	[AmountQuestionLevel3] [int] NOT NULL,
	[MinCorrectAnswerLevel3] [int] NOT NULL,
	[NumberForEachLevel] [text] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[IdSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/13/2024 5:52:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [varchar](10) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Date_Of_Birth] [date] NOT NULL,
	[Gender] [bit] NULL,
	[Email] [varchar](50) NULL,
	[Id_Role] [int] NOT NULL,
	[Phone_Number] [varchar](10) NOT NULL,
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240428163012_init', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240430155633_addColumn', N'8.0.4')
GO
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1, 1, N'A. Khoa học của mọi khoa học.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (2, 1, N'B. Hệ thống tri thức lý luận chung nhất về thế giới, về vị trí, vai trò của con người trong thế giới.', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (3, 1, N'C. Khoa học nghiên cứu những quy luật chung nhất của tự nhiên.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (4, 1, N'D. Khoa học nghiên cứu về con người và sự nghiệp giải phóng con người ra khỏi mọi sự áp bức bất công.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (5, 2, N'A. Phương thức sản xuất tư bản chủ nghĩa đã trở thành phương thức sản xuất thống trị.', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (6, 2, N'B. Phương thức sản xuất tư bản chủ nghĩa mới xuất hiện.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (7, 2, N'C. Chủ nghĩa tư bản đã trở thành chủ nghĩa đế quốc.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (8, 2, N'D. Các phương án trả lời còn lại đều đúng.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (9, 3, N'A. CNDV biện chứng.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (10, 3, N'B. CNDV siêu hình thế kỷ 17-18.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (11, 3, N'C. CNDV trước Mác.', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (12, 3, N'D. CNDV tự phát thời cổ đại.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (13, 4, N'a. Là tư tưởng của một cá nhân', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (14, 4, N'b. Là tư tưởng của một lãnh tụ', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (15, 4, N'c. Là tư tưởng của một giai cấp, một dân tộc ', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (16, 4, N'd. Là tất cả những vấn đề trên', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (17, 5, N'a. Cách mạng Việt Nam, chủ nghĩa Mác Lênin', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (18, 5, N'b. Cách mạng vô sản, chủ nghĩa Mác _ Lênin.', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (19, 5, N'c. Cách mạng hội chủ nghĩa, chủ nghĩa Mác – Lênin ', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (20, 5, N'd. Chủ Nghĩa Mác _ Lênin, cách mạng Việt Nam', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (21, 6, N'a. Năm 1930 ', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (22, 6, N'b. Năm 1945', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (23, 6, N'c. Năm 1969 ', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (24, 6, N'd.Năm 1991', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (25, 7, N'a11', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (26, 7, N'a12', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (27, 7, N'a13', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (28, 7, N'a14', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (29, 8, N'21', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (30, 8, N'22', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (31, 8, N'23', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (32, 8, N'24', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (33, 9, N'31', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (34, 9, N'32', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (35, 9, N'33', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (36, 9, N'34', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (37, 10, N'41', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (38, 10, N'42', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (39, 10, N'43', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (40, 10, N'44', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (41, 11, N'a51', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (42, 11, N'a52', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (43, 11, N'a53', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (44, 11, N'a54', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (45, 12, N'a61', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (46, 12, N'a62', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (47, 12, N'a63', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (48, 12, N'a64', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (49, 13, N'd11', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (50, 13, N'd', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (51, 13, N'd', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (52, 13, N'd', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (53, 14, N'd21', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (54, 14, N'd22', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (55, 14, N'd23', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (56, 14, N'd24', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (57, 15, N'd', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (58, 15, N'd', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (59, 15, N'd33', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (60, 15, N'd34', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (61, 16, N'a1true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (62, 16, N'a1.1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (63, 16, N'a1.2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (64, 16, N'a1.3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (65, 17, N'a2true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (66, 17, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (67, 17, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (68, 17, N'a2', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (69, 18, N'a3 tru3', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (70, 18, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (71, 18, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (72, 18, N'a3', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (73, 19, N'a4 true', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (74, 19, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (75, 19, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (76, 19, N'a4', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (77, 20, N'e1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (78, 20, N'e1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (79, 20, N'e1', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (80, 20, N'e1', 0)
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([IdContact], [Title], [Content], [SendDate], [IdUser]) VALUES (1, N'aa', N'bb', CAST(N'2024-05-10T22:43:15.057' AS DateTime), N'student1')
INSERT [dbo].[Contacts] ([IdContact], [Title], [Content], [SendDate], [IdUser]) VALUES (2, N'we', N'hgf', CAST(N'2024-05-10T22:57:30.257' AS DateTime), N'student1')
INSERT [dbo].[Contacts] ([IdContact], [Title], [Content], [SendDate], [IdUser]) VALUES (3, N'asd', N'asd', CAST(N'2024-05-12T14:45:12.447' AS DateTime), N'student1')
INSERT [dbo].[Contacts] ([IdContact], [Title], [Content], [SendDate], [IdUser]) VALUES (4, N'knj', N'jhb', CAST(N'2024-05-12T16:14:00.387' AS DateTime), N'student1')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (1, N'1. Triết học Mác - Lênin là gì?', N'THML', 1, N'250d5bee-d410-408b-87b2-fc4ba2f2aada.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (2, N'2. Triết học Mác - Lênin ra đời trong điều kiện kinh tế - xã hội nào?', N'THML', 2, N'45a26b58-01ea-45a2-8cc3-fdf6ab0341a8.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (3, N'3. Chủ nghĩa duy vật (CNDV) nào đồng nhất vật chất nói chung với một dạng hay một thuộc tính cụ thể của nó?', N'THML', 3, N'f7e70fb2-537b-45d1-8fc8-e134081f14ee.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (4, N'1. Thuật ngữ “Tư tưởng Hồ Chí Minh” được dủng theo nghĩa nào?', N'TTHCM', 1, N'721bd378-14a0-4098-b61a-2e0594837abc.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (5, N'2. Điền vào chỗ trống để hoàn thiện đinh nghĩa Tư tưởng Hồ Chí Minh: “Tư tưởng Hồ Chí Minh là một hệ thống quan điểm toàn diện và sâu sắc về những vấn đề cơ bản của […..] , là kết quả của sự vận dụng và phát triển sáng tạo[…..] vào điều kiện cụ thể của nước ta, đồng thời là kết tinh tinh hoa dân tộc và trí tuệ thời đại, giải phóng dân tộc, giải phóng giai cấp, giải phóng con người”.', N'TTHCM', 2, N'035479bf-36a7-427b-ac6c-1762ebb8d7d9.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (6, N'3. Khái niệm tư tưởng Hồ Chí Minh được Đảng ta chính thức sử dụng vào thời gian nào?', N'TTHCM', 3, N'2cadca6d-70bf-4a12-a656-3e0eb12e2a16.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (7, N'a1dasua', N'cc', 1, N'7e02763d-e3d3-4579-8826-6637ad898b6a.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (8, N'a2dasua', N'cc', 1, N'0629b9c3-8090-459c-9cf2-3f43847cd9c2.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (9, N'a3', N'cc', 2, N'e77317bf-1fd3-4392-b2a1-db5eccfaaf24.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (10, N'a4', N'cc', 2, N'a531f611-5352-4ba7-ac14-c9e153ff7a70.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (11, N'a5', N'cc', 3, N'c38d9d5e-f13f-4c40-bd1d-197b8410bb9e.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (12, N'a6', N'cc', 3, N'5d5cf2ad-3287-41c5-83ad-ac1221b918e6.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (13, N'd1', N'dd', 1, N'55529770-4fcb-4ea7-bbbe-279e1b0ba94e.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (14, N'd2', N'dd', 2, N'a8de4b05-f908-452f-a2ea-ccb1d0315f03.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (15, N'd3', N'dd', 3, N'e2491f77-fd1d-4aae-bc05-573aa4ccea83.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (16, N'a1', N'345', 1, N'99f0e98a-dd3c-46e4-85ad-14422ac8efda.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (17, N'a2', N'345', 1, N'5194898c-e991-4d7b-aefc-bacb7b899d34.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (18, N'a3', N'345', 2, N'5823c5bc-e123-42c9-b4c0-a2e46b14c1ea.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (19, N'a4', N'345', 2, N'641d1c40-271d-4287-be48-e0e795f9a128.jpg')
INSERT [dbo].[Question] ([IdQuestion], [Title], [IdSubject], [Level], [LinkImage]) VALUES (20, N'e1', N'ee', 1, N'c9dcc9e9-b7d2-4dc8-9d64-7382bdae6e48.jpg')
GO
INSERT [dbo].[Result] ([IdResult], [IdUser], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', N'student1', N'TTHCM', 0, 0, 0, 0, 0, CAST(N'2024-05-12T14:30:58.5153092' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IdResult], [IdUser], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE2', N'student1', N'THML', 0, 0, 0, 0, 0, CAST(N'2024-05-12T14:31:54.9230013' AS DateTime2), 0, NULL)
INSERT [dbo].[Result] ([IdResult], [IdUser], [IDSubject], [CorrectedLevel1], [CorrectedLevel2], [CorrectedLevel3], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE3', N'student1', N'dd', 0, 0, 0, 3, 0, CAST(N'2024-05-12T14:47:17.9973687' AS DateTime2), 0, N'aa')
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'1', N'teacher2', N'TTHCM', NULL, NULL, NULL, NULL)
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'2', N'teacher1', N'THML', 1, 0, 1, 0)
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'3', N'teacher1', N'cc', 0, 0, 0, NULL)
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'4', N'teacher1', N'dd', 1, 0, 1, 0)
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'5', N'teacher1', N'ee', 0, 0, 0, NULL)
INSERT [dbo].[Statistic] ([IdStatistic], [IdUser], [IdSubject], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (N'6', N'teacher1', N'345', 0, 0, 0, NULL)
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN1', N'student1', N'TTHCM', 4, 13, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN2', N'student1', N'TTHCM', 5, 19, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN3', N'student1', N'TTHCM', 6, 22, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN4', N'student1', N'THML', 1, 1, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN5', N'student1', N'THML', 2, 7, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN6', N'student1', N'THML', 3, 12, 0)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN7', N'student1', N'dd', 13, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN8', N'student1', N'dd', 14, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdSubject], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN9', N'student1', N'dd', 15, NULL, NULL)
GO
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'345', N'xac xuat thong ke', N'teacher1', 30, 2, 1, 2, 1, 0, 0, N'1')
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'cc', N'cc', N'teacher1', 120, 2, 2, 2, 2, 2, 2, N'2')
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'dd', N'dd', N'teacher1', 1, 2, 1, 1, 1, 1, 1, N'1')
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'ee', N'ee', N'teacher1', 12, 1, 1, 0, 0, 0, 0, N'1')
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'THML', N'TRIẾT HỌC MÁC LÊNIN', N'teacher1', 120, 1, 1, 1, 1, 1, 1, N'1')
INSERT [dbo].[Subject] ([IdSubject], [SubjectName], [IdUser], [Time], [AmountQuestionLevel1], [MinCorrectAnswerLevel1], [AmountQuestionLevel2], [MinCorrectAnswerLevel2], [AmountQuestionLevel3], [MinCorrectAnswerLevel3], [NumberForEachLevel]) VALUES (N'TTHCM', N'TƯ TƯỞNG HỒ CHÍ MINH', N'teacher2', 90, 1, 1, 1, 1, 1, 1, N'1')
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'admin', N'Hoai', CAST(N'2023-09-04' AS Date), NULL, N'nguyenhuuquy110203@gmail.com', 3, N'0321654987', N'$2a$11$Fu6KEFHuVQnn97eq481Kve4Fc1X3qAi45MHkiZQYBEac.bWVUEjBO', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student1', N'quy', CAST(N'2024-05-03' AS Date), 1, N'QUY3@gmail.com', 1, N'0352477783', N'$2a$11$NbzTe2WKCcrVT/s/yes9UeeNh16OSaCgoEUfczVjbCWKF4KnMFvz6', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'student2', N'viet', CAST(N'2024-05-09' AS Date), 0, N'q@gmail.com', 1, N'0258741369', N'$2a$11$Fu6KEFHuVQnn97eq481Kve4Fc1X3qAi45MHkiZQYBEac.bWVUEjBO', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'teacher1', N'Nam', CAST(N'2023-09-08' AS Date), 1, N'teacher1@gmail.com', 2, N'0147852369', N'$2a$11$Fu6KEFHuVQnn97eq481Kve4Fc1X3qAi45MHkiZQYBEac.bWVUEjBO', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'teacher2', N'quy', CAST(N'2023-09-05' AS Date), 1, N'teacher2@gmail.com', 2, N'0123456789', N'$2a$11$Fu6KEFHuVQnn97eq481Kve4Fc1X3qAi45MHkiZQYBEac.bWVUEjBO', 0, NULL, 0)
GO
/****** Object:  Index [IX_Answer_IDQuestion]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Answer_IDQuestion] ON [dbo].[Answer]
(
	[IdQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Question_IDSubject]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Question_IDSubject] ON [dbo].[Question]
(
	[IdSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Result_ID_Student]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Result_ID_Student] ON [dbo].[Result]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Result_IDSubject]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Result_IDSubject] ON [dbo].[Result]
(
	[IDSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Answer_ID_Student]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_ID_Student] ON [dbo].[Student_Answer]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Answer_IDAnswer]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDAnswer] ON [dbo].[Student_Answer]
(
	[IdAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Student_Answer_IDQuestion]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDQuestion] ON [dbo].[Student_Answer]
(
	[IdQuestion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_Answer_IDSubject]    Script Date: 5/13/2024 5:52:32 PM ******/
CREATE NONCLUSTERED INDEX [IX_Student_Answer_IDSubject] ON [dbo].[Student_Answer]
(
	[IdSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_Question]
GO
ALTER TABLE [dbo].[Contacts]  WITH CHECK ADD  CONSTRAINT [FK_Contacts_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Contacts] CHECK CONSTRAINT [FK_Contacts_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_Subject] FOREIGN KEY([IDSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_Subject]
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [FK_Result_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [FK_Result_User]
GO
ALTER TABLE [dbo].[Statistic]  WITH CHECK ADD  CONSTRAINT [FK_Statistic_Subject] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[Statistic] CHECK CONSTRAINT [FK_Statistic_Subject]
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
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Question] FOREIGN KEY([IdQuestion])
REFERENCES [dbo].[Question] ([IdQuestion])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Question]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_Subject] FOREIGN KEY([IdSubject])
REFERENCES [dbo].[Subject] ([IdSubject])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_Subject]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Student_Answer_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Student_Answer_User]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Role] ([Id_Role])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [MCQ] SET  READ_WRITE 
GO
