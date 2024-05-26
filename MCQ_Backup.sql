USE [MCQ]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Answer]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Chapter]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[ChapterDetails]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[CLOs]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/26/2024 11:52:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[IdContact] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[Courses]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Exam]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[PLOs]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Question]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Result]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Speciality]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Statistic]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 5/26/2024 11:52:04 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/26/2024 11:52:04 AM ******/
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

INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1607, 1191, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1608, 1191, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1609, 1191, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1610, 1191, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1611, 1192, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1612, 1192, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1613, 1192, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1614, 1192, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1615, 1193, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1616, 1193, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1617, 1193, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1618, 1193, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1619, 1194, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1620, 1194, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1621, 1194, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1622, 1194, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1623, 1195, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1624, 1195, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1625, 1195, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1626, 1195, N'<a src=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1631, 1198, N'<break>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1632, 1198, N'<br>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1633, 1198, N'<lb>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1634, 1198, N'<bl>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1635, 1199, N'<body bg = "yello">', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1636, 1199, N'<background>yellow</background>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1637, 1199, N'<body style=”background-color:yellow;”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1638, 1199, N'<body background-color=yellow>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1639, 1200, N'<important>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1640, 1200, N' <i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1641, 1200, N'<strong>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1642, 1200, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1643, 1201, N'<i>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1644, 1201, N'<b>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1645, 1201, N'<em>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1646, 1201, N'<strong>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1647, 1202, N'<a link=”http://www.example.com”>Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1648, 1202, N'<a url=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1649, 1202, N'<a href=”http://www.example.com”> Example</a>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1650, 1202, N'<a src=”http://www.example.com”> Example</a>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1651, 1203, N'< structure > ', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1652, 1203, N'< head >', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1653, 1203, N'<document>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1654, 1203, N'<meta>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1655, 1204, N'<a href=”url” target=”new”>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1656, 1204, N'<a href=”url” target:new>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1657, 1204, N'<a href="url” target=”_blank”>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1658, 1204, N'<a href=”url” target:blank>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1659, 1205, N'<table> <tr> <tt>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1660, 1205, N'<table> <tr> <td>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1661, 1205, N'<thead> <body> <tr>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1662, 1205, N'<table> <head> <tfoot>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1663, 1206, N'<list>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1664, 1206, N'<li>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1665, 1206, N'<ul>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1666, 1206, N'<ol>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1667, 1207, N'<ul>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1668, 1207, N'<ol>', 1)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1669, 1207, N'<list>', 0)
INSERT [dbo].[Answer] ([IdAnswer], [IdQuestion], [Answer_Title], [Key]) VALUES (1670, 1207, N'<dl>', 0)
SET IDENTITY_INSERT [dbo].[Answer] OFF
GO
INSERT [dbo].[Blog] ([IdBlog], [Title], [Content], [Order], [Hide], [Image]) VALUES (1, N'Vai trò của ngành công nghệ thông tin trong giáo dục', N'Sự ra đời của công nghệ thông tin là sự tích hợp đồng thời các tiến bộ về công nghệ và tổ chức thông tin, đem đến nhiều ảnh hưởng tích cực cho sự phát triển của giáo dục.

Công nghệ thông tin và đặc biệt là sự phát triển của internet mở ra một kho kiến thức vô cùng đa dạng và phong phú cho người học và người dạy, giúp cho việc tìm hiểu kiến thức đơn giản hơn rất nhiều, cải thiện chất lượng học và dạy.', 1, 0, N'grabd0fa3ve_dep_hue.jpg')
INSERT [dbo].[Blog] ([IdBlog], [Title], [Content], [Order], [Hide], [Image]) VALUES (2, N'Ngành công nghệ phần mềm', N'Công nghệ phần mềm là một trong những chuyên ngành của khối Công nghệ thông tin, tập trung vào việc nghiên cứu về phần mềm và các hệ thống kỹ thuật của máy tính. Chuyên ngành này đào tạo chuyên sâu vào việc khảo sát cơ sở dữ liệu, nền tảng phần mềm và sự phát triển của các ứng dụng, hệ thống. Ngoài ra, ngành Công nghệ phần mềm còn đóng vai trò quan trọng việc xây dựng các ứng dụng hỗ trợ tối ưu hoạt động kinh doanh và nâng cao chất lượng cuộc sống con người.', 2, 0, N'nganh-cong-nghe-phan-mem.jpg')
GO
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'CMP1016-1', N'Tổng quát về lập trình', 2, N'CMP1016', 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'CMP1016-2', N'Ngôn ngữ lập trình C', 2, N'CMP1016', 2)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'CMP175-1', N'Tổng quát về lập trình web', 2, N'CMP175', 3)
INSERT [dbo].[Chapter] ([IdChapter], [ChapterName], [AmountCLO], [IdCourse], [AmountQuestions]) VALUES (N'CMP175-2', N'Đánh giá một trang web', 2, N'CMP175', 3)
GO
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP1016-1', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP1016-1', 5)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP1016-2', 4)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP1016-2', 6)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP175-1', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP175-1', 2)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP175-2', 1)
INSERT [dbo].[ChapterDetails] ([IdChapter], [IdCLO]) VALUES (N'CMP175-2', 3)
GO
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (1, N'CLO1', N'Hiểu về lập trình web', N'Understand', N'CMP175')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (2, N'CLO2', N'Phân biệt các câu lệnh trong lập trình web', N'Analyze', N'CMP175')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (3, N'CLO3', N'Đánh giá được một trang web', N'Evaluate', N'CMP175')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (4, N'CLO1', N'Hiểu về lập trình', N'Understand', N'CMP1016')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (5, N'CLO2', N'Phân biệt các lệnh trong ngôn ngữ C', N'Analyze', N'CMP1016')
INSERT [dbo].[CLOs] ([IdCLO], [CLOName], [Title], [Bloom], [IdCourse]) VALUES (6, N'CLO3', N'Đánh giá được chương trình có tối ưu không', N'Evaluate', N'CMP1016')
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([IdContact], [FullName], [Email], [Title], [Content], [SendDate], [IdUser]) VALUES (1, N'Nguyễn Nhựt Minh', N'nm095955@gmail.com', N'Tài khoản ', N'Tôi quên mật khẩu ', CAST(N'2024-05-26T11:05:12.727' AS DateTime), N'2180608710')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter], [Image]) VALUES (N'CMP1016', N'Ngôn ngữ lập trình C', 2, 2, 3, 1, 1, 1, NULL, NULL, NULL, N'CNPM', N'Teacher1', 30, 0, 2, N'ngonlaptrinhc.jpg')
INSERT [dbo].[Courses] ([IdCourse], [CourseName], [IdPLO], [AmountChapter], [AmountCLO], [MinCorrectForCLO1], [MinCorrectForCLO2], [MinCorrectForCLO3], [MinCorrectForCLO4], [MinCorrectForCLO5], [MinCorrectForCLO6], [IdSpeciality], [IdTeacherTake], [Time], [IsSetUp], [QuestionSelectedPerChapter], [Image]) VALUES (N'CMP175', N'Lập trình web', 3, 2, 3, 1, 1, 1, NULL, NULL, NULL, N'CNPM', N'Teacher1', 30, 1, 2, N'laptrinhweb.png')
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1321, N'CMP175', N'CMP175-1', 1199, N'2180608710')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1322, N'CMP175', N'CMP175-1', 1193, N'2180608710')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1323, N'CMP175', N'CMP175-2', 1203, N'2180608710')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1324, N'CMP175', N'CMP175-2', 1204, N'2180608710')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1325, N'CMP175', N'CMP175-1', 1198, N'2180608711')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1326, N'CMP175', N'CMP175-1', 1201, N'2180608711')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1327, N'CMP175', N'CMP175-2', 1205, N'2180608711')
INSERT [dbo].[Exam] ([IdExam], [IdCourse], [IdChapter], [IdQuestion], [IdUser]) VALUES (1328, N'CMP175', N'CMP175-2', 1204, N'2180608711')
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (1, N'PLO1', N'Nhận thức, xác định được các kiến thức đương đại liên quan khoa học chính trị và pháp luật, khoa học xã hội phù hợp với chuyên môn được đào tạo')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (2, N'PLO2', N'Vận dụng kiến thức nền tảng về khoa học tự nhiên, kiến thức chuyên ngành để giải quyết các vấn đề trong lĩnh vực')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (3, N'PLO3', N'Thiết kế, đánh giá giải pháp, chiến lược, quy trình kỹ thuật, phát triển phần mềm, công nghệ mới, cơ sở hạ tầng và dịch vụ')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (4, N'PLO4', N'Lập kế hoạch, quản lý, điều hành và giám sát các quá trình triển khai trong các ứng dụng về CNTT ')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (5, N'PLO5', N'Sử dụng Tiếng Anh ở trình độ bậc 3/6 khung năng lực ngoại ngữ Việt Nam để phục vụ học tập và phát triển chuyên môn')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (6, N'PLO6', N'Thể hiện khả năng dẫn dắt khởi nghiệp, tạo việc làm cho mình và cho người khác')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (7, N'PLO7', N'Tổ chức làm việc nhóm, sữ dụng kỹ năng giao tiếp hiệu quả và phát triển ý thức học tập suốt đời')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (8, N'PLO8', N'Phân tích, giải quyết và phản biện các vấn đề kỹ thuật trong lĩnh vực CNTT')
INSERT [dbo].[PLOs] ([IdPLO], [PLOName], [Title]) VALUES (9, N'PLO9', N'Định hướng, đưa ra kết luận chuyên môn và có thể bảo vệ được quan điểm các nhân')
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1191, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'4731f908-5d4a-4c96-a633-705f953c838c.jpg', N'CMP175-1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1192, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'604e1765-d5db-4c0a-9eb8-3111aba4ba92.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1193, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'376313ad-5412-4c0f-b4c1-f80da17d43ff.jpg', N'CMP175-1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1194, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'57aa6aa1-2630-42f0-98a1-e6c0464ebc80.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1195, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'b03da5ac-d4ea-4ef6-a4bb-06ecc686a5c8.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1196, N'Phần tử HTML nào được sử dụng để xác định cấu trúc của tài liệu HTML, bao gồm tiêu đề và thông tin meta?', N'469cd62e-1460-44ed-9523-7df671709279.jpg', N'CMP175-2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1198, N'Phần tử HTML chính xác để chèn ngắt dòng là gì?', N'eb203212-0876-46e6-ba73-04dc56e0b1b1.jpg', N'CMP175-1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1199, N'Cú pháp HTML đúng để thêm màu nền là gì?', N'459c4765-5a24-424e-833a-5ebb1d11c1e2.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1200, N'Chọn phần tử HTML chính xác để xác định văn bản quan trọng', N'b18980b6-cf32-4bb9-bd30-3ed22ed3e1cc.jpg', N'CMP175-1', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1201, N'Chọn phần tử HTML chính xác để xác định văn bản được nhấn mạnh', N'b756738d-0f7a-47e1-8f5b-0e109267cb1a.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1202, N'Cái nào là cú pháp HTML đúng để tạo một hyperlink?', N'9641bc5b-187b-4523-b765-b46f6d55d1d9.jpg', N'CMP175-1', 2)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1203, N'Phần tử HTML nào được sử dụng để xác định cấu trúc của tài liệu HTML, bao gồm tiêu đề và thông tin meta?', N'3583677f-fce0-4750-b58f-fcd8840ddbaf.jpg', N'CMP175-2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1204, N'Mở một liên kết trong một tab mới hoặc cửa sổ trình duyệt mới như thế nào?', N'c0124641-76aa-4a33-9ba9-e7ff0cb8db9e.jpg', N'CMP175-2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1205, N'Các phần tử nào thuộc phần tử bảng?', N'85299615-d214-4fa1-92a7-98b78cbd5f2e.jpg', N'CMP175-2', 1)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1206, N'Tạo một danh sách đánh số thứ tự như thế nào?', N'4dff0d14-fa26-430a-b14c-dce73b0fc4ec.jpg', N'CMP175-2', 3)
INSERT [dbo].[Question] ([IdQuestion], [Title], [LinkImage], [IdChapter], [IdCLO]) VALUES (1207, N'Tạo một danh sách đánh ký hiệu hình “viên đạn” như thế nào?', N'38c20ba6-7343-4b32-83ff-5314fec6d105.jpg', N'CMP175-2', 3)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Result] ([IdResult], [IdUser], [IdCourse], [CorrectedCLO1], [CorrectedCLO2], [CorrectedCLO3], [CorrectedCLO4], [CorrectedCLO5], [CorrectedCLO6], [Skipped], [Score], [ExamDate], [Status], [Feedback]) VALUES (N'RE1', N'2180608711', N'CMP175', 2, 0, 1, 0, 0, 0, 1, 7.5, CAST(N'2024-05-26T11:46:07.3046137' AS DateTime2), 0, NULL)
GO
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (1, N'Student')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Role] ([Id_Role], [Role_Name]) VALUES (3, N'Admin')
GO
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'ATTT', N'An toàn thông tin')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'CNPM', N'Công nghệ phần mềm')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'HTTT', N'Hệ thống thông tin')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'MMT', N'Mạng máy tính')
INSERT [dbo].[Speciality] ([IdSpeciality], [SpecialityName]) VALUES (N'TTNT', N'Trí tuệ nhân tạo')
GO
SET IDENTITY_INSERT [dbo].[Statistic] ON 

INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1031, N'CMP175', 0, NULL, NULL, NULL)
INSERT [dbo].[Statistic] ([IdStatistic], [IdCourse], [TotalStudent], [AmountPassed], [AmountFailed], [AverageScore]) VALUES (1032, N'CMP1016', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Statistic] OFF
GO
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN1', N'2180608711', N'CMP175', 1198, 1632, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN2', N'2180608711', N'CMP175', 1201, NULL, NULL)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN3', N'2180608711', N'CMP175', 1205, 1660, 1)
INSERT [dbo].[Student_Answer] ([ID_Student_Answer], [IdUser], [IdCourse], [IdQuestion], [IdAnswer], [IsCorrect]) VALUES (N'STAN4', N'2180608711', N'CMP175', 1204, 1657, 1)
GO
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'2180608710', N'Nguyễn Nhựt Minh', CAST(N'2003-02-07' AS Date), 1, N'nm095955@gmail.com', 1, N'0933890541', NULL, N'$2a$11$vqMPjg62O8txdgOQ4IBPbeQXLh0ZzT9/KuhMlgZVimj3itIREQuG.', 0, CAST(N'2024-05-26T11:28:51.703' AS DateTime), 7)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'2180608711', N'Nguyễn Minh Nhựt', CAST(N'2003-09-11' AS Date), 1, N'nhutminhnguyen293@gmail.com', 1, N'0933890542', NULL, N'$2a$11$B/7ThbuPPs80xuDW.U7EX.SlcM7iSx0ogtdSK84kFRJUCFp/Yz3k6', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'Admin', N'Nguyễn Văn An', CAST(N'1998-11-20' AS Date), 1, N'an.nv@gmail.com', 3, N'0123456789', NULL, N'$2a$11$PsZQ3ZQ/0wpj0XcatX/9EuYMXlX3YYEEQQQEXDmBVhzJJygz1EtI.', 0, NULL, 0)
INSERT [dbo].[User] ([IdUser], [Name], [Date_Of_Birth], [Gender], [Email], [Id_Role], [Phone_Number], [IdSpecility], [Password], [Hide], [LockTime], [FailedLoginAttempts]) VALUES (N'Teacher1', N'Nguyễn Văn B', CAST(N'1996-07-12' AS Date), 1, N'b.nv@gmail.com', 2, N'0987654321', N'CNPM', N'$2a$11$NwvdYEajBx0Im0u08T49nuvcEMjv04QWEC7ZjIn8X3A3/ffdsoFG.', 0, NULL, 0)
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
