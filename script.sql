USE [IMSTUDENTDB]
GO
/****** Object:  Table [dbo].[APPLY]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APPLY](
	[Applicant] [varchar](100) NOT NULL,
	[Receiver] [varchar](100) NOT NULL,
	[ApplyType] [varchar](100) NULL,
	[ApplyIntro] [varchar](max) NULL,
	[ResumeFileName] [varchar](max) NULL,
	[ResumeFilePath] [varchar](max) NULL,
	[ApplyResult] [varchar](100) NULL,
	[PaymentStatus] [varchar](100) NULL,
	[ObtainLicense] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Applicant] ASC,
	[Receiver] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHAPTER]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHAPTER](
	[ChapterNum] [int] IDENTITY(200001,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[ChapterName] [varchar](max) NULL,
	[VideolFileName] [varchar](max) NULL,
	[VideoFilePath] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ChapterNum] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE](
	[CourseId] [int] IDENTITY(100001,1) NOT NULL,
	[CourseName] [varchar](100) NULL,
	[CourseIntro] [varchar](max) NULL,
	[CourseCredit] [int] NULL,
	[Teacher] [varchar](100) NULL,
	[School] [varchar](100) NULL,
	[HWName] [varchar](100) NULL,
	[HWDetail] [varchar](max) NULL,
	[HWDeadlineDays] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COURSE_SELECTION]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE_SELECTION](
	[Student] [varchar](100) NOT NULL,
	[CourseId] [int] NOT NULL,
	[PassOrNot] [varchar](100) NULL,
	[HWFileName] [varchar](max) NULL,
	[HWFilePath] [varchar](max) NULL,
	[HWUploadTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Student] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[MaterialId] [int] IDENTITY(300001,1) NOT NULL,
	[MaterialName] [varchar](100) NULL,
	[MaterialIntro] [varchar](max) NULL,
	[MaterialFileName] [varchar](max) NULL,
	[MaterialFilePath] [varchar](max) NULL,
	[CourseId] [int] NULL,
	[ChapterNum] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MEMBER]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MEMBER](
	[Account] [varchar](100) NOT NULL,
	[Name] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Role] [varchar](100) NULL,
	[Wallet] [int] NULL,
	[School] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCHOOL]    Script Date: 2021/6/3 下午 06:12:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCHOOL](
	[SchoolName] [varchar](100) NOT NULL,
	[SchoolIntro] [varchar](max) NULL,
	[RequiredCredits] [int] NULL,
	[SemesterDays] [int] NULL,
	[SchoolFee] [int] NULL,
	[License] [varchar](100) NULL,
	[OpenSelectCourseDate] [datetime] NULL,
	[OpenSemesterDate] [datetime] NULL,
	[SchoolStatus] [varchar](100) NULL,
	[Principal] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[APPLY] ([Applicant], [Receiver], [ApplyType], [ApplyIntro], [ResumeFileName], [ResumeFilePath], [ApplyResult], [PaymentStatus], [ObtainLicense]) VALUES (N'28cyc', N'元智資管學校', N'學生申請學校', N'wwwwwtttttddddd', N'ERD2.0.pdf', N'resume/元智資管學校_28cyc_ERD2.0.pdf', N'等待審核中', NULL, NULL)
INSERT [dbo].[APPLY] ([Applicant], [Receiver], [ApplyType], [ApplyIntro], [ResumeFileName], [ResumeFilePath], [ApplyResult], [PaymentStatus], [ObtainLicense]) VALUES (N'testtt', N'元智資管學校', N'學生申請學校', N'幹幹幹幹幹幹幹幹測試測', N'abc.pdf', N'123/abc.pdf', N'通過', N'尚未繳費', N'')
SET IDENTITY_INSERT [dbo].[COURSE] ON 

INSERT [dbo].[COURSE] ([CourseId], [CourseName], [CourseIntro], [CourseCredit], [Teacher], [School], [HWName], [HWDetail], [HWDeadlineDays]) VALUES (100001, N'管理資訊系統', N'Problem-based and business case study teaching and learning.', 3, N'celesteng', N'元智資管學校', NULL, NULL, NULL)
INSERT [dbo].[COURSE] ([CourseId], [CourseName], [CourseIntro], [CourseCredit], [Teacher], [School], [HWName], [HWDetail], [HWDeadlineDays]) VALUES (100002, N'人工智慧應用', N'學習人工智慧的基本理論,並補充實務應用', 3, N'linlin', N'元智資管學校', NULL, NULL, NULL)
INSERT [dbo].[COURSE] ([CourseId], [CourseName], [CourseIntro], [CourseCredit], [Teacher], [School], [HWName], [HWDetail], [HWDeadlineDays]) VALUES (100003, N'資料庫管理', N'為學生提供資料庫操作和SQL編寫的基本知識', 3, N'hsieh', N'元智資管學校', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[COURSE] OFF
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'28cyc', N'陳宜湞', N'8888', N'0912345678', N'學生', 50000, N'')
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'28cyccyc', N'陳小姐', N'12341234', N'0912312312', N'老師', 50000, NULL)
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'5sheep', N'吳志揚', N'5sheepp', N'0955555555', N'校長', 50000, N'元智資管學校')
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'celesteng', N'吳思佩', N'0000', N'0900000000', N'老師', 50000, N'元智資管學校')
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'hsieh', N'謝瑞建', N'0000', N'0900000000', N'老師', 50000, N'元智資管學校')
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'linlin', N'林志麟', N'0000', N'0900000000', N'老師', 50000, N'元智資管學校')
INSERT [dbo].[MEMBER] ([Account], [Name], [Password], [PhoneNumber], [Role], [Wallet], [School]) VALUES (N'testtt', N'王曉明', N'testtt', N'0900000000', N'學生', 50000, NULL)
INSERT [dbo].[SCHOOL] ([SchoolName], [SchoolIntro], [RequiredCredits], [SemesterDays], [SchoolFee], [License], [OpenSelectCourseDate], [OpenSemesterDate], [SchoolStatus], [Principal]) VALUES (N'元智資管學校', N'資管很棒棒棒棒棒棒棒幹你娘', 50, 150, 20000, N'IMWHOIM', CAST(N'1900-01-01 00:00:00.000' AS DateTime), CAST(N'1900-01-01 00:00:00.000' AS DateTime), N'FIX', N'5sheep')
