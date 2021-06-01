USE [IMSTUDENTDB]
GO
/****** Object:  Table [dbo].[COURSE]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE](
	[CourseId] [int] IDENTITY(100001,1) NOT NULL,
	[CourseName] [varchar](100) NULL,
	[CourseIntroduction] [varchar](max) NULL,
	[CourseCredits] [int] NULL,
	[TeacherAccount] [varchar](100) NULL,
	[School] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COURSE_SELECTION]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COURSE_SELECTION](
	[Student] [varchar](100) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Grade] [int] NULL,
	[PassOrNot] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HW_POST]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HW_POST](
	[HomeWorkId] [int] IDENTITY(300001,1) NOT NULL,
	[HomeWorkName] [varchar](100) NULL,
	[HomeWorkDetail] [varchar](max) NULL,
	[Deadline] [datetime] NULL,
	[CourseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HW_UPLOAD]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HW_UPLOAD](
	[HomeWorkId] [int] NOT NULL,
	[Student] [varchar](100) NOT NULL,
	[UploadFileName] [varchar](max) NULL,
	[UploadFilePath] [varchar](max) NULL,
	[UploadTime] [datetime] NULL,
	[Grade] [int] NULL,
	[TeacherComment] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeWorkId] ASC,
	[Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[MaterialId] [int] IDENTITY(200001,1) NOT NULL,
	[MaterialName] [varchar](100) NULL,
	[MaterialFileName] [varchar](max) NULL,
	[MaterialFilePath] [varchar](max) NULL,
	[CourseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MEMBER]    Script Date: 2021/6/1 下午 10:16:57 ******/
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
/****** Object:  Table [dbo].[SCHOOL]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCHOOL](
	[SchoolName] [varchar](100) NOT NULL,
	[SchoolIntroduction] [varchar](max) NULL,
	[RequiredCredits] [int] NULL,
	[SchoolStatus] [varchar](100) NULL,
	[License] [varchar](100) NULL,
	[Principal] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SchoolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STUDENTRESUME]    Script Date: 2021/6/1 下午 10:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STUDENTRESUME](
	[StudentAccount] [varchar](100) NOT NULL,
	[SchoolName] [varchar](100) NOT NULL,
	[SelfIntroduction] [varchar](max) NULL,
	[ResumeFileName] [varchar](max) NULL,
	[ResumeFilePath] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentAccount] ASC,
	[SchoolName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
