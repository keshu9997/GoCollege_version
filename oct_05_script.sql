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
/****** Object:  Table [dbo].[tblCity]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblCollege]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblCollStuCourseSemStudent]    Script Date: 05/10/2016 23:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCollStuCourseSemStudent](
	[CollStuCourseSemID] [bigint] NULL,
	[CollegeID] [bigint] NULL,
	[CourseID] [bigint] NULL,
	[SemID] [bigint] NULL,
	[StudentID] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblCourse]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblFaculty]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblSection]    Script Date: 05/10/2016 23:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSection](
	[SectionID] [bigint] IDENTITY(1,1) NOT NULL,
	[CourseID] [bigint] NULL,
	[SemID] [bigint] NULL,
	[SectionName] [char](10) NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_tblStudentAttendance] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSemester]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblState]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblStudent]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblStudentAttendance]    Script Date: 05/10/2016 23:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudentAttendance](
	[USN] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[IsAttended] [int] NULL,
	[CourseID] [bigint] NULL,
	[SectionID] [bigint] NULL,
	[Year] [int] NULL,
	[SubjectID] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStudentAttendanceCount]    Script Date: 05/10/2016 23:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStudentAttendanceCount](
	[StudentUSN] [varchar](50) NULL,
	[CourseID] [bigint] NULL,
	[SectionID] [bigint] NULL,
	[Year] [int] NULL,
	[SubjectID] [bigint] NULL,
	[TotalClassesHeld] [int] NULL,
	[TotalClassesAttended] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 05/10/2016 23:15:01 ******/
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
/****** Object:  Table [dbo].[tblTypeOfUser]    Script Date: 05/10/2016 23:15:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTypeOfUser](
	[TypeOfUserID] [bigint] NULL,
	[TypeOfUser] [char](1) NULL
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
INSERT [dbo].[tblCollStuCourseSemStudent] ([CollStuCourseSemID], [CollegeID], [CourseID], [SemID], [StudentID]) VALUES (1, 1, 4, 1, 1)
INSERT [dbo].[tblCollStuCourseSemStudent] ([CollStuCourseSemID], [CollegeID], [CourseID], [SemID], [StudentID]) VALUES (2, 1, 4, 1, 2)
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([CountryID], [CountryName], [CountryStatus]) VALUES (1, N'India', N'A')
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
SET IDENTITY_INSERT [dbo].[tblCourse] ON 

INSERT [dbo].[tblCourse] ([CourseID], [CollegeID], [CourseName], [CourseShortName], [CourseTotalSems], [CourseStatus]) VALUES (4, 1, N'Master of Computer Applications', N'MCA', 6, N'A')
INSERT [dbo].[tblCourse] ([CourseID], [CollegeID], [CourseName], [CourseShortName], [CourseTotalSems], [CourseStatus]) VALUES (5, 1, N'Master of Business Management', N'MBA', 4, N'A')
SET IDENTITY_INSERT [dbo].[tblCourse] OFF
SET IDENTITY_INSERT [dbo].[tblFaculty] ON 

INSERT [dbo].[tblFaculty] ([FacultyID], [FacultyCode], [FacultyName], [FacultyMobile], [FacultyEmail], [CollegeID], [FacultyAddress], [FacultyPassword], [FacultyStatus]) VALUES (3, N'1FF', N'John', N'9874563210', N'john@gmail.com', 1, N'kljfkjlkdf32k', N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
INSERT [dbo].[tblFaculty] ([FacultyID], [FacultyCode], [FacultyName], [FacultyMobile], [FacultyEmail], [CollegeID], [FacultyAddress], [FacultyPassword], [FacultyStatus]) VALUES (4, N'1RPK112016', N'Chetana', N'9996655223', N'che@gmail.com', 1, N'glkkljklj234234 kn', N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
SET IDENTITY_INSERT [dbo].[tblFaculty] OFF
SET IDENTITY_INSERT [dbo].[tblSection] ON 

INSERT [dbo].[tblSection] ([SectionID], [CourseID], [SemID], [SectionName], [Status]) VALUES (1, 4, 1, N'A         ', N'A')
INSERT [dbo].[tblSection] ([SectionID], [CourseID], [SemID], [SectionName], [Status]) VALUES (2, 4, 1, N'B         ', N'A')
SET IDENTITY_INSERT [dbo].[tblSection] OFF
SET IDENTITY_INSERT [dbo].[tblSemester] ON 

INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (1, 1, 4, 6)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (2, 2, 4, 7)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (4, 1, 5, 6)
INSERT [dbo].[tblSemester] ([SemID], [SemNumber], [CourseID], [SemTotalSubjects]) VALUES (5, 2, 5, 7)
SET IDENTITY_INSERT [dbo].[tblSemester] OFF
SET IDENTITY_INSERT [dbo].[tblState] ON 

INSERT [dbo].[tblState] ([StateID], [CountryID], [StateName], [StateStatus]) VALUES (1, 1, N'Karnataka', N'A')
INSERT [dbo].[tblState] ([StateID], [CountryID], [StateName], [StateStatus]) VALUES (2, 1, N'Maharashtra', N'A')
SET IDENTITY_INSERT [dbo].[tblState] OFF
SET IDENTITY_INSERT [dbo].[tblStudent] ON 

INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (1, N'1rn12mca49', N'Ram', 1, 8899665544, N'Ram@gmail.com', N'Hubli', 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (2, N'1rn12mca48', N'Kiran', 1, 7788996655, N'kiran@gmail.com', N'Kolar', 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (5, N'1rn12mca01', N'Akashya', 1, 9988556633, N'Ak@gmail.com', N'Bengaluru', 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
INSERT [dbo].[tblStudent] ([StudentID], [StudentUSN], [StudentName], [CollegeID], [StudentMobile], [StudentEmail], [StudentAddress], [CourseID], [SemID], [StudentPassword], [StudentStatus]) VALUES (6, N'1rn12mca02', N'Ahmed', 1, 8596741230, N'ah@gmail.com', NULL, 4, 1, N'5qEbwqN+KXfjmRt0igLEdQ==', N'R')
SET IDENTITY_INSERT [dbo].[tblStudent] OFF
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69500000000 AS DateTime), 0, 4, 1, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 0, 4, 1, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca48', CAST(0x0000A69500000000 AS DateTime), 1, 4, 1, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca49', CAST(0x0000A69400000000 AS DateTime), 1, 4, 1, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca01', CAST(0x0000A69500000000 AS DateTime), 0, 4, 2, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 0, 4, 2, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69500000000 AS DateTime), 1, 4, 2, 2016, 10)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 1)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 4)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 7)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 0, 4, 2, 2016, 8)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 1, 4, 2, 2016, 9)
INSERT [dbo].[tblStudentAttendance] ([USN], [Date], [IsAttended], [CourseID], [SectionID], [Year], [SubjectID]) VALUES (N'1rn12mca02', CAST(0x0000A69400000000 AS DateTime), 0, 4, 2, 2016, 10)
INSERT [dbo].[tblStudentAttendanceCount] ([StudentUSN], [CourseID], [SectionID], [Year], [SubjectID], [TotalClassesHeld], [TotalClassesAttended]) VALUES (N'1rn12mca49', 4, 1, 2016, 1, 2, 2)
INSERT [dbo].[tblStudentAttendanceCount] ([StudentUSN], [CourseID], [SectionID], [Year], [SubjectID], [TotalClassesHeld], [TotalClassesAttended]) VALUES (N'1rn12mca48', 4, 2, 2016, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblSubject] ON 

INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (1, N'13MCA11 ', 1, N'Problem Solving using C')
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (4, N'13MCA12', 1, N' Discrete Mathematics Structure')
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (7, N'13MCA13', 1, N'3 Fundamentals of Computer')
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (8, N'13MCA14', 1, N'Introduction to Unix ')
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (9, N'13MCA15', 1, N'NULLIntroduction to Web Technologies ')
INSERT [dbo].[tblSubject] ([SubjectID], [SubjectCode], [SemID], [SubjectName]) VALUES (10, N'13MCA16', 1, N'C Programming Laboratory')
SET IDENTITY_INSERT [dbo].[tblSubject] OFF
INSERT [dbo].[tblTypeOfUser] ([TypeOfUserID], [TypeOfUser]) VALUES (1, N'A')
INSERT [dbo].[tblTypeOfUser] ([TypeOfUserID], [TypeOfUser]) VALUES (2, N'F')
INSERT [dbo].[tblTypeOfUser] ([TypeOfUserID], [TypeOfUser]) VALUES (3, N'S')
SET ANSI_PADDING ON

GO
/****** Object:  Index [EUK_tblAdmin]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [EUK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MUK_tblAdmin]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [MUK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_UK_tblAdmin]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [UN_UK_tblAdmin] ON [dbo].[tblAdmin]
(
	[AdminName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblCollege]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [IX_tblCollege] ON [dbo].[tblCollege]
(
	[CollegeEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MUK_Table_2]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [MUK_Table_2] ON [dbo].[tblCollege]
(
	[CollegeMobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PUK_Table_2_1]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [PUK_Table_2_1] ON [dbo].[tblCollege]
(
	[CollegePhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Table_2]    Script Date: 05/10/2016 23:15:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Table_2] ON [dbo].[tblCollege]
(
	[CollegeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_tblCountry_Name_UK]    Script Date: 05/10/2016 23:15:02 ******/
CREATE UNIQUE NONCLUSTERED INDEX [_tblCountry_Name_UK] ON [dbo].[tblCountry]
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_tblState]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [UK_tblState] ON [dbo].[tblState]
(
	[StateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_USN_Table_1]    Script Date: 05/10/2016 23:15:02 ******/
ALTER TABLE [dbo].[tblStudent] ADD  CONSTRAINT [UK_USN_Table_1] UNIQUE NONCLUSTERED 
(
	[StudentUSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Email_Table_1]    Script Date: 05/10/2016 23:15:02 ******/
CREATE NONCLUSTERED INDEX [UK_Email_Table_1] ON [dbo].[tblStudent]
(
	[StudentEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK_Mobile_Table_1]    Script Date: 05/10/2016 23:15:02 ******/
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
ALTER TABLE [dbo].[tblSection]  WITH CHECK ADD  CONSTRAINT [FK_tblStudentAttendance_tblCourse] FOREIGN KEY([CourseID])
REFERENCES [dbo].[tblCourse] ([CourseID])
GO
ALTER TABLE [dbo].[tblSection] CHECK CONSTRAINT [FK_tblStudentAttendance_tblCourse]
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
