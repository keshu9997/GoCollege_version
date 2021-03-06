USE [master]
GO
/****** Object:  Database [MyCampuz]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE DATABASE [MyCampuz] ON  PRIMARY 
( NAME = N'MyCampuz', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\MyCampuz.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyCampuz_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\MyCampuz_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyCampuz] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyCampuz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyCampuz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyCampuz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyCampuz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyCampuz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyCampuz] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyCampuz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyCampuz] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MyCampuz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyCampuz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyCampuz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyCampuz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyCampuz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyCampuz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyCampuz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyCampuz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyCampuz] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyCampuz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyCampuz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyCampuz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyCampuz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyCampuz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyCampuz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyCampuz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyCampuz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyCampuz] SET  MULTI_USER 
GO
ALTER DATABASE [MyCampuz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyCampuz] SET DB_CHAINING OFF 
GO
USE [MyCampuz]
GO
/****** Object:  Table [dbo].[tblAdmin]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAdmin](
	[AdminID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdminUserName] [varchar](100) NOT NULL,
	[AdminPassword] [varchar](250) NOT NULL,
	[CollegeID] [bigint] NOT NULL,
	[AdminName] [varchar](150) NULL,
	[AdminEmail] [varchar](250) NULL,
	[AdminMobile] [bigint] NULL,
	[AdminStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityID] [bigint] IDENTITY(1,1) NOT NULL,
	[StateID] [bigint] NOT NULL,
	[CityName] [varchar](250) NOT NULL,
	[CityStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCollege]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCollege](
	[CollegeID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollegeCode] [varchar](20) NOT NULL,
	[CollegeName] [varchar](250) NULL,
	[CollegeEmail] [varchar](250) NULL,
	[CollegePhone] [bigint] NULL,
	[CollegeMobile] [bigint] NULL,
	[StateID] [bigint] NOT NULL,
	[CityID] [bigint] NOT NULL,
	[CollegeAddress] [varchar](250) NULL,
	[CollegeStatus] [nchar](1) NOT NULL,
 CONSTRAINT [PK_tblCollege] PRIMARY KEY CLUSTERED 
(
	[CollegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCountry](
	[CountryID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](250) NOT NULL,
	[CountryStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblCountry_1] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCourse](
	[CourseID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollegeID] [bigint] NOT NULL,
	[CourseName] [varchar](250) NOT NULL,
	[CourseShortName] [varchar](50) NOT NULL,
	[CourseTotalSems] [int] NOT NULL,
	[CourseStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblCourse] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblFaculty]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblFaculty](
	[FacultyID] [bigint] IDENTITY(1,1) NOT NULL,
	[FacultyCode] [varchar](50) NULL,
	[FacultyName] [varchar](150) NULL,
	[FacultyMobile] [nchar](10) NULL,
	[FacultyEmail] [varchar](250) NULL,
	[CollegeID] [bigint] NOT NULL,
	[FacultyAddress] [varchar](250) NULL,
	[FacultyPassword] [varchar](250) NOT NULL,
	[FacultyStatus] [char](1) NULL,
 CONSTRAINT [PK_tblFaculty] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSemester]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSemester](
	[SemID] [bigint] IDENTITY(1,1) NOT NULL,
	[SemNumber] [int] NOT NULL,
	[CourseID] [bigint] NOT NULL,
	[SemTotalSubjects] [bigint] NOT NULL,
 CONSTRAINT [PK_tblSemester] PRIMARY KEY CLUSTERED 
(
	[SemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblState]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblState](
	[StateID] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryID] [bigint] NOT NULL,
	[StateName] [varchar](150) NOT NULL,
	[StateStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudent](
	[StudentID] [bigint] IDENTITY(1,1) NOT NULL,
	[StudentUSN] [varchar](50) NOT NULL,
	[StudentName] [varchar](150) NULL,
	[CollegeID] [bigint] NULL,
	[StudentMobile] [bigint] NULL,
	[StudentEmail] [varchar](250) NULL,
	[StudentAddress] [varchar](250) NULL,
	[CourseID] [bigint] NOT NULL,
	[SemID] [bigint] NULL,
	[StudentPassword] [varchar](250) NOT NULL,
	[StudentStatus] [char](1) NOT NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 29/09/2016 05:52:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSubject](
	[SubjectID] [bigint] IDENTITY(1,1) NOT NULL,
	[SubjectCode] [varchar](50) NOT NULL,
	[SemID] [bigint] NOT NULL,
	[SubjectName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tblAdmin] ON 

INSERT [dbo].[tblAdmin] ([AdminID], [AdminUserName], [AdminPassword], [CollegeID], [AdminName], [AdminEmail], [AdminMobile], [AdminStatus]) VALUES (3, N'RNSITAdmin', N'EURf1ZAlCai4wNQYcf9L6A==', 1, N'Raj', N'Raj@gmail.com', 9900865864, N'A')
INSERT [dbo].[tblAdmin] ([AdminID], [AdminUserName], [AdminPassword], [CollegeID], [AdminName], [AdminEmail], [AdminMobile], [AdminStatus]) VALUES (6, N'BMSAdmin', N'EURf1ZAlCai4wNQYcf9L6A==', 2, N'Basava', N'Basava@gmail.com', 9865321470, N'A')
SET IDENTITY_INSERT [dbo].[tblAdmin] OFF
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([CityID], [StateID], [CityName], [CityStatus]) VALUES (1, 1, N'Bengaluru', N'A')
INSERT [dbo].[tblCity] ([CityID], [StateID], [CityName], [CityStatus]) VALUES (2, 1, N'Mysuru', N'A')
INSERT [dbo].[tblCity] ([CityID], [StateID], [CityName], [CityStatus]) VALUES (3, 2, N'Mumbai', N'A')
SET IDENTITY_INSERT [dbo].[tblCity] OFF
SET IDENTITY_INSERT [dbo].[tblCollege] ON 

INSERT [dbo].[tblCollege] ([CollegeID], [CollegeCode], [CollegeName], [CollegeEmail], [CollegePhone], [CollegeMobile], [StateID], [CityID], [CollegeAddress], [CollegeStatus]) VALUES (1, N'1RN', N'RNSIT', N'rns@gmail.com', 1245639988, 8569741230, 1, 1, N'Bengaluru', N'A')
INSERT [dbo].[tblCollege] ([CollegeID], [CollegeCode], [CollegeName], [CollegeEmail], [CollegePhone], [CollegeMobile], [StateID], [CityID], [CollegeAddress], [CollegeStatus]) VALUES (2, N'1BMS', N'BMSCE', NULL, NULL, NULL, 1, 1, NULL, N'R')
SET IDENTITY_INSERT [dbo].[tblCollege] OFF
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [CountryStatus]) VALUES (1, N'India', N'A')
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([CourseID], [CollegeID], [CourseName], [CourseShortName], [CourseTotalSems], [CourseStatus]) VALUES (4, 1, N'Master of Computer Applications', N'MCA', 6, N'A')
INSERT [dbo].[tblCourse] ([CourseID], [CollegeID], [CourseName], [CourseShortName], [CourseTotalSems], [CourseStatus]) VALUES (5, 1, N'Master of Business Management', N'MBA', 4, N'A')
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
SET IDENTITY_INSERT [dbo].[tblSemester] ON 

INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (1, 1, 4, 6)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (2, 2, 4, 7)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (3, 3, 4, 8)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (4, 1, 5, 6)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (5, 2, 5, 7)
SET IDENTITY_INSERT [dbo].[tblSemester] OFF
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([StateID], [CountryID], [StateName], [StateStatus]) VALUES (1, 1, N'Karnataka', N'A')
INSERT [dbo].[tblState] ([StateID], [CountryID], [StateName], [StateStatus]) VALUES (2, 1, N'Maharashtra', N'A')
SET IDENTITY_INSERT [dbo].[tblState] OFF
SET IDENTITY_INSERT [dbo].[tblStudent] ON 

INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (1, N'1rn12mca49', NULL, 1, NULL, NULL, NULL, 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (2, N'1rn12mca48', NULL, 1, NULL, NULL, NULL, 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
SET IDENTITY_INSERT [dbo].[tblStudent] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [EUK_tblAdmin]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [EUK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MUK_tblAdmin]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [MUK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_UK_tblAdmin]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [UN_UK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblCollege]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [IX_tblCollege] ON [dbo].[tblCollege]
(
	[CollegeEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MUK_Table_2]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [MUK_Table_2] ON [dbo].[tblCollege]
(
	[CollegeMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PUK_Table_2_1]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [PUK_Table_2_1] ON [dbo].[tblCollege]
(
	[CollegePhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Table_2]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Table_2] ON [dbo].[tblCollege]
(
	[CollegeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_tblCountry_Name_UK]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [_tblCountry_Name_UK] ON [dbo].[tblCountry]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_tblState]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [UK_tblState] ON [dbo].[tblState]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_USN_Table_1]    Script Date: 29/09/2016 05:52:28 PM ******/
ALTER TABLE [dbo].[tblStudent] ADD  CONSTRAINT [UK_USN_Table_1] UNIQUE NONCLUSTERED 
(
	[StudentUSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Email_Table_1]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [UK_Email_Table_1] ON [dbo].[tblStudent]
(
	[StudentEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Mobile_Table_1]    Script Date: 29/09/2016 05:52:28 PM ******/
CREATE NONCLUSTERED INDEX [UK_Mobile_Table_1] ON [dbo].[tblStudent]
(
	[StudentMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAdmin]  WITH CHECK ADD  CONSTRAINT [FK_tblAdmin_tblAdmin] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[tblCollege] ([CollegeID])
GO
ALTER TABLE [dbo].[tblAdmin] CHECK CONSTRAINT [FK_tblAdmin_tblAdmin]
GO
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblState] FOREIGN KEY([StateID])
REFERENCES [dbo].[tblState] ([StateID])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblState]
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD  CONSTRAINT [FK_tblCourse_tblCollege] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[tblCollege] ([CollegeID])
GO
ALTER TABLE [dbo].[tblCourse] CHECK CONSTRAINT [FK_tblCourse_tblCollege]
GO
ALTER TABLE [dbo].[tblFaculty]  WITH CHECK ADD  CONSTRAINT [FK_tblFaculty_tblCollege] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[tblCollege] ([CollegeID])
GO
ALTER TABLE [dbo].[tblFaculty] CHECK CONSTRAINT [FK_tblFaculty_tblCollege]
GO
ALTER TABLE [dbo].[tblSemester]  WITH CHECK ADD  CONSTRAINT [FK_tblSemester_tblCourse] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tblCourse] ([CourseID])
GO
ALTER TABLE [dbo].[tblSemester] CHECK CONSTRAINT [FK_tblSemester_tblCourse]
GO
ALTER TABLE [dbo].[tblState]  WITH CHECK ADD  CONSTRAINT [FK_tblState_tblCountry] FOREIGN KEY([CountryID])
REFERENCES [dbo].[tblCountry] ([CountryID])
GO
ALTER TABLE [dbo].[tblState] CHECK CONSTRAINT [FK_tblState_tblCountry]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblCollege] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[tblCollege] ([CollegeID])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblCollege]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblCourse] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tblCourse] ([CourseID])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblCourse]
GO
ALTER TABLE [dbo].[tblSubject]  WITH CHECK ADD  CONSTRAINT [FK_tblSubject_tblSemester] FOREIGN KEY([SemID])
REFERENCES [dbo].[tblSemester] ([SemID])
GO
ALTER TABLE [dbo].[tblSubject] CHECK CONSTRAINT [FK_tblSubject_tblSemester]
GO
USE [master]
GO
ALTER DATABASE [MyCampuz] SET  READ_WRITE 
GO
