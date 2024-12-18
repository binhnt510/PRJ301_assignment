USE [sua_prj]
GO
/****** Object:  Table [dbo].[AttendanceEmployee]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceEmployee](
	[AttendanceID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsWork] [int] NOT NULL,
	[CreateBy] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_AttendanceEmployee] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendenceWorker]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendenceWorker](
	[AttendentID] [int] IDENTITY(1,1) NOT NULL,
	[SchEmpID] [int] NOT NULL,
	[ActuralQuantity] [int] NOT NULL,
	[Alpha] [decimal](2, 1) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreateBy] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[AttendentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(7,1) NOT NULL,
	[DepartmentName] [nvarchar](150) NOT NULL,
	[type] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(41,1) NOT NULL,
	[EmployeeName] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[address] [varchar](150) NOT NULL,
	[dob] [date] NOT NULL,
	[RoleID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[shift] [varchar](2) NULL,
	[salary] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] IDENTITY(11,1) NOT NULL,
	[FeatureName] [nvarchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
	[show] [bit] NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plan]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plan](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](150) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlanCampain]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlanCampain](
	[PlanCampnID] [int] IDENTITY(1,1) NOT NULL,
	[PlanID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Estimate] [int] NOT NULL,
 CONSTRAINT [PK_PlanCampain] PRIMARY KEY CLUSTERED 
(
	[PlanCampnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(4,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(7,1) NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[FeatureID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualCampaign]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualCampaign](
	[ScID] [int] IDENTITY(46,1) NOT NULL,
	[PlanCampnID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Shift] [varchar](2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_SchedualCampaign] PRIMARY KEY CLUSTERED 
(
	[ScID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchedualEmployee]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchedualEmployee](
	[SchEmpID] [int] IDENTITY(184,1) NOT NULL,
	[ScID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[OrderedQuantity] [int] NOT NULL,
 CONSTRAINT [PK_SchedualEmployee] PRIMARY KEY CLUSTERED 
(
	[SchEmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/12/2024 8:46:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserName] [nvarchar](150) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AttendenceWorker] ON 

INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (1, 1, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (2, 2, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (3, 3, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (4, 4, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (5, 5, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (6, 6, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (7, 7, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (8, 8, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (9, 9, 7, CAST(0.8 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (10, 10, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (11, 11, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (12, 12, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (13, 13, 4, CAST(1.3 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (14, 14, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (15, 15, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (16, 16, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (17, 17, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (18, 18, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (19, 19, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (20, 20, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (21, 21, 8, CAST(1.3 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (22, 22, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (23, 23, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (24, 24, 7, CAST(0.5 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (25, 25, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (26, 26, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (27, 27, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (28, 28, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (29, 29, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (30, 30, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (31, 31, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (32, 32, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (33, 33, 9, CAST(1.5 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (34, 34, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (35, 35, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (36, 36, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (37, 37, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (38, 38, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (39, 39, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (40, 40, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (41, 41, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (42, 42, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (43, 43, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (44, 44, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (45, 45, 6, CAST(0.3 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (46, 46, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (47, 47, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (48, 48, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (49, 49, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (50, 50, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (51, 51, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (52, 52, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (53, 53, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (54, 54, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (55, 55, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (56, 56, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (57, 57, 8, CAST(1.8 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (58, 58, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (59, 59, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (60, 60, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (61, 61, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (62, 62, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (63, 63, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (64, 64, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (65, 65, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (66, 66, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (67, 67, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (68, 68, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (69, 69, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (70, 70, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (71, 71, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (72, 72, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (73, 73, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (74, 74, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (75, 75, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (76, 76, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (77, 77, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (78, 78, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (79, 79, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (80, 80, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (81, 81, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (82, 82, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (83, 83, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (84, 84, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (85, 85, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (86, 86, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (87, 87, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (88, 88, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (89, 89, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (90, 90, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (91, 91, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (92, 92, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (93, 93, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (94, 94, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (95, 95, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (96, 96, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (97, 97, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (98, 98, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (99, 99, 3, CAST(0.8 AS Decimal(2, 1)), NULL, N'admin')
GO
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (100, 100, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (101, 101, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (102, 102, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (103, 103, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (104, 104, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (105, 105, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (106, 106, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (107, 107, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (108, 108, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (109, 109, 4, CAST(1.3 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (110, 110, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (111, 111, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (112, 112, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (113, 113, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (114, 114, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (115, 115, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (116, 116, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (117, 117, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (118, 118, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (119, 119, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (120, 120, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (121, 121, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (122, 122, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (123, 123, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (124, 124, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (125, 125, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (126, 126, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (127, 127, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (128, 128, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (129, 129, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (130, 130, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (131, 131, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (132, 132, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (133, 133, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (134, 134, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (135, 135, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (136, 136, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (137, 137, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (138, 138, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (139, 139, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (140, 140, 2, CAST(0.3 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (141, 141, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (142, 142, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (143, 143, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (144, 144, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (145, 145, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (146, 146, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (147, 147, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (148, 148, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (149, 149, 6, CAST(1.8 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (150, 150, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (151, 151, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (152, 152, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (153, 153, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (154, 154, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (155, 155, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (156, 156, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (157, 157, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (158, 158, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (159, 159, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (160, 160, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (161, 161, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (162, 162, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (163, 163, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (164, 164, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (165, 165, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (166, 166, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (167, 167, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (168, 168, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (169, 169, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (170, 170, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (171, 171, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (172, 172, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (173, 173, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (175, 175, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (176, 176, 4, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (177, 177, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (178, 178, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (179, 179, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (180, 180, 8, CAST(1.0 AS Decimal(2, 1)), NULL, N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (181, 207, 10, CAST(5.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (182, 221, 10, CAST(5.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (183, 222, 10, CAST(6.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (184, 208, 10, CAST(6.0 AS Decimal(2, 1)), N'333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (185, 209, 10, CAST(7.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (186, 223, 10, CAST(7.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (187, 224, 10, CAST(8.0 AS Decimal(2, 1)), N'33333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (188, 210, 10, CAST(8.0 AS Decimal(2, 1)), N'3333', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (199, 211, 10, CAST(1.0 AS Decimal(2, 1)), N'tot', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (200, 216, 10, CAST(1.0 AS Decimal(2, 1)), N'tot', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (201, 217, 10, CAST(2.0 AS Decimal(2, 1)), N'tốt', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (202, 212, 10, CAST(2.0 AS Decimal(2, 1)), N'tốt', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (203, 213, 10, CAST(2.0 AS Decimal(2, 1)), N'tot lam', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (204, 218, 10, CAST(2.0 AS Decimal(2, 1)), N'tot lam', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (205, 219, 10, CAST(2.0 AS Decimal(2, 1)), N'tốt lắm', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (206, 214, 10, CAST(2.0 AS Decimal(2, 1)), N'tốt lắm', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (207, 215, 10, CAST(1.0 AS Decimal(2, 1)), N'tốt
lắm', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (208, 220, 10, CAST(1.0 AS Decimal(2, 1)), N'tốt
lắm', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (209, 202, 7, CAST(1.0 AS Decimal(2, 1)), N'tot', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (210, 203, 7, CAST(1.0 AS Decimal(2, 1)), N'', N'admin')
GO
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (211, 181, 7, CAST(1.0 AS Decimal(2, 1)), N'', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (212, 204, 7, CAST(1.0 AS Decimal(2, 1)), N'', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (213, 205, 7, CAST(1.0 AS Decimal(2, 1)), N'', N'admin')
INSERT [dbo].[AttendenceWorker] ([AttendentID], [SchEmpID], [ActuralQuantity], [Alpha], [Note], [CreateBy]) VALUES (214, 206, 7, CAST(1.0 AS Decimal(2, 1)), N'tot', N'admin')
SET IDENTITY_INSERT [dbo].[AttendenceWorker] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (1, N'Production Workshop1', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (2, N'Production Workshop2', N'WS')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (3, N'Production Planning', N'HO')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (4, N'Accounting', N'HO')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (5, N'Administration', N'HO')
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [type]) VALUES (6, N'Sale', N'HO')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (1, N'Tran Van A', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 7, 5, NULL, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (2, N'Nguyen Thi B', 0, N'Hue', CAST(N'1991-02-02' AS Date), 2, 3, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (3, N'Le Van C', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 2, 3, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (4, N'Pham Thi D', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 3, 1, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (5, N'Do Van E', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 3, 2, NULL, CAST(1260000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (6, N'Bui Thi F', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 5, 1, N'K3', CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (7, N'Hoang Van G', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 1, 1, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (8, N'Vu Thi H', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 1, 1, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (9, N'Nguyen Van I', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 1, 1, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (10, N'Tran Thi J', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 1, 2, NULL, CAST(12000000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (11, N'Pham Van K', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 1, 2, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (12, N'Le Thi L', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 1, 2, NULL, CAST(1140000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (13, N'Nguyen Van M', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 5, 2, N'K1', CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (14, N'Tran Van N', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 5, 2, N'K3', CAST(1380000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (15, N'Nguyen Thi O', 0, N'Hue', CAST(N'1991-02-02' AS Date), 5, 2, N'K3', CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (16, N'Le Van P', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 6, 6, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (17, N'Pham Thi Q', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 4, 4, NULL, CAST(1200000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (18, N'Do Van R', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 5, 1, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (19, N'Bui Thi S', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 5, 1, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (20, N'Hoang Van T', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 5, 1, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (21, N'Vu Thi U', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 5, 1, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (22, N'Nguyen Van V', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 5, 1, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (23, N'Tran Thi W', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 5, 1, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (24, N'Pham Van X', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 5, 1, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (25, N'Le Thi Y', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 5, 1, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (26, N'Nguyen Van Z', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 5, 1, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (27, N'Tran Van AA', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 5, 1, N'K3', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (28, N'Nguyen Thi BB', 0, N'Hue', CAST(N'1991-02-02' AS Date), 5, 1, N'K3', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (29, N'Le Van CC', 1, N'Nghe An', CAST(N'1992-03-03' AS Date), 5, 1, N'K3', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (30, N'Pham Thi DD', 0, N'Ha Noi', CAST(N'1993-04-04' AS Date), 5, 2, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (31, N'Do Van EE', 1, N'Hai Phong', CAST(N'1994-05-05' AS Date), 5, 2, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (32, N'Bui Thi FF', 0, N'Thanh Hoa', CAST(N'1995-06-06' AS Date), 5, 2, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (33, N'Hoang Van GG', 1, N'Ha Tinh', CAST(N'1996-07-07' AS Date), 5, 2, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (34, N'Vu Thi HH', 0, N'Quang Tri', CAST(N'1997-08-08' AS Date), 5, 2, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (35, N'Nguyen Van II', 1, N'Ha Noi', CAST(N'1998-09-09' AS Date), 5, 2, N'K3', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (36, N'Tran Thi JJ', 0, N'Hai Duong', CAST(N'1999-10-10' AS Date), 5, 2, N'K3', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (37, N'Pham Van KK', 1, N'Nam Dinh', CAST(N'2000-11-11' AS Date), 5, 2, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (38, N'Le Thi LL', 0, N'Quang Ninh', CAST(N'2001-12-12' AS Date), 5, 2, N'K2', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (39, N'Nguyen Van MM', 1, N'Hai Phong', CAST(N'2002-01-01' AS Date), 5, 2, N'K1', CAST(40000.00 AS Decimal(18, 2)))
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [gender], [address], [dob], [RoleID], [DepartmentID], [shift], [salary]) VALUES (40, N'Tran Van NN', 1, N'Da Nang', CAST(N'1990-01-01' AS Date), 5, 2, N'K3', CAST(40000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (1, N'Home ', N'/home', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (2, N'List Plan With PlanCampaign & Create SchedualCampaign', N'/work/listplan', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (3, N'Create Plan & PlanCampaign', N'/work/createplan', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (4, N'Create Schedule Campaign', N'/work/schedulecampain', 0)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (5, N'Check Process', N'/work/checkprocess', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (6, N'Create Detail Product For Worker', N'/work/detailforworker', 0)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (7, N'Attendance ', N'/employee/attendance', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (8, N'Calculating Salary Worker', N'/employee/salaryworker', 1)
INSERT [dbo].[Feature] ([FeatureID], [FeatureName], [url], [show]) VALUES (10, N'List Schedule Campaign & Create SchedualEmployee', N'/work/listschedulecampaign', 1)
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (1, N'San Xuat Gio', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-05' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (2, N'San Xuat Thung va Met', CAST(N'2024-10-01' AS Date), CAST(N'2024-10-05' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (3, N'Create new Plan for Son', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-19' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (4, N'congty A', CAST(N'2024-10-10' AS Date), CAST(N'2024-10-23' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (5, N'congty CNPN', CAST(N'2024-11-01' AS Date), CAST(N'2024-11-08' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (6, N'congty B', CAST(N'2024-10-26' AS Date), CAST(N'2024-10-28' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (7, N'congty C', CAST(N'2024-10-28' AS Date), CAST(N'2024-10-29' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (8, N'congtyaaaaaa', CAST(N'2024-10-28' AS Date), CAST(N'2024-10-28' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (9, N'1111111111111', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (13, N'java', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (14, N'javadđ', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (15, N'javadđ', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-29' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (16, N'csssssss', CAST(N'2024-10-04' AS Date), CAST(N'2024-10-04' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (17, N'csssssss', CAST(N'2024-10-04' AS Date), CAST(N'2024-10-04' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (18, N'4444444444444', CAST(N'2024-10-29' AS Date), CAST(N'2024-10-30' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (19, N'haha', CAST(N'2024-10-16' AS Date), CAST(N'2024-10-17' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (20, N'haha', CAST(N'2024-10-16' AS Date), CAST(N'2024-10-17' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (22, N'scscscs', CAST(N'2024-10-17' AS Date), CAST(N'2024-10-16' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (23, N'xcxcxcxc', CAST(N'2024-10-03' AS Date), CAST(N'2024-10-03' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (24, N'java', CAST(N'2024-10-30' AS Date), CAST(N'2024-10-30' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (25, N'hello', CAST(N'2024-10-23' AS Date), CAST(N'2024-10-23' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (27, N'test thử 2', CAST(N'2024-11-01' AS Date), CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (28, N'tessssssssssssss', CAST(N'2024-09-01' AS Date), CAST(N'2024-10-01' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (29, N'thử tháng 12', CAST(N'2024-12-01' AS Date), CAST(N'2024-12-01' AS Date), 2)
INSERT [dbo].[Plan] ([PlanID], [PlanName], [StartDate], [EndDate], [DepartmentID]) VALUES (30, N'thử tháng 11', CAST(N'2024-11-15' AS Date), CAST(N'2024-11-16' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Plan] OFF
GO
SET IDENTITY_INSERT [dbo].[PlanCampain] ON 

INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (1, 1, 1, 240, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (2, 2, 2, 240, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (3, 2, 3, 480, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (4, 3, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (5, 3, 3, 200, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (6, 4, 1, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (7, 5, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (8, 5, 2, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (9, 6, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (10, 7, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (11, 8, 2, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (12, 9, 3, 10, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (13, 13, 2, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (14, 14, 2, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (15, 15, 2, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (16, 16, 2, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (17, 17, 2, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (18, 18, 3, 10, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (19, 19, 3, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (20, 20, 3, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (21, 1, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (22, 22, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (23, 23, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (24, 24, 2, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (25, 25, 1, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (27, 27, 2, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (28, 28, 3, 100, 1)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (29, 29, 1, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (30, 29, 2, 100, 2)
INSERT [dbo].[PlanCampain] ([PlanCampnID], [PlanID], [ProductID], [Quantity], [Estimate]) VALUES (31, 30, 1, 100, 2)
SET IDENTITY_INSERT [dbo].[PlanCampain] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (1, N'Giỏ')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (2, N'Thúng')
INSERT [dbo].[Product] ([ProductID], [ProductName]) VALUES (3, N'Mẹt')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Production Manager')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Production Planning Director')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Manager Workshop')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (4, N'Accountant')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (5, N'Worker')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (6, N'Sale')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (7, N'Administrator ')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 4)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 6)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (1, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (2, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (3, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (3, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (4, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (5, 2)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (5, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (6, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (6, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (7, 1)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (7, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (8, 4)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (8, 7)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (10, 3)
INSERT [dbo].[RoleFeature] ([FeatureID], [RoleID]) VALUES (10, 7)
GO
SET IDENTITY_INSERT [dbo].[SchedualCampaign] ON 

INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (1, 1, CAST(N'2024-10-01' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (2, 2, CAST(N'2024-10-01' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (3, 3, CAST(N'2024-10-01' AS Date), N'K1', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (4, 1, CAST(N'2024-10-01' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (5, 2, CAST(N'2024-10-01' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (6, 3, CAST(N'2024-10-01' AS Date), N'K2', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (7, 1, CAST(N'2024-10-01' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (8, 2, CAST(N'2024-10-01' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (9, 3, CAST(N'2024-10-01' AS Date), N'K3', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (10, 1, CAST(N'2024-10-02' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (11, 2, CAST(N'2024-10-02' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (12, 3, CAST(N'2024-10-02' AS Date), N'K1', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (13, 1, CAST(N'2024-10-02' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (14, 2, CAST(N'2024-10-02' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (15, 3, CAST(N'2024-10-02' AS Date), N'K2', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (16, 1, CAST(N'2024-10-02' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (17, 2, CAST(N'2024-10-02' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (18, 3, CAST(N'2024-10-02' AS Date), N'K3', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (19, 1, CAST(N'2024-10-03' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (20, 2, CAST(N'2024-10-03' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (21, 3, CAST(N'2024-10-03' AS Date), N'K1', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (22, 1, CAST(N'2024-10-03' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (23, 2, CAST(N'2024-10-03' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (24, 3, CAST(N'2024-10-03' AS Date), N'K2', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (25, 1, CAST(N'2024-10-03' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (26, 2, CAST(N'2024-10-03' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (27, 3, CAST(N'2024-10-03' AS Date), N'K3', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (28, 1, CAST(N'2024-10-04' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (29, 2, CAST(N'2024-10-04' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (30, 3, CAST(N'2024-10-04' AS Date), N'K1', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (31, 1, CAST(N'2024-10-04' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (32, 2, CAST(N'2024-10-04' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (33, 3, CAST(N'2024-10-04' AS Date), N'K2', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (34, 1, CAST(N'2024-10-04' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (35, 2, CAST(N'2024-10-04' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (36, 3, CAST(N'2024-10-04' AS Date), N'K3', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (37, 1, CAST(N'2024-10-05' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (38, 2, CAST(N'2024-10-05' AS Date), N'K1', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (39, 3, CAST(N'2024-10-05' AS Date), N'K1', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (40, 1, CAST(N'2024-10-05' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (41, 2, CAST(N'2024-10-05' AS Date), N'K2', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (42, 3, CAST(N'2024-10-05' AS Date), N'K2', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (43, 1, CAST(N'2024-10-05' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (44, 2, CAST(N'2024-10-05' AS Date), N'K3', 16)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (45, 3, CAST(N'2024-10-05' AS Date), N'K3', 32)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (46, 7, CAST(N'2024-11-01' AS Date), N'K1', 12)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (47, 7, CAST(N'2024-11-02' AS Date), N'K1', 12)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (49, 7, CAST(N'2024-11-03' AS Date), N'K1', 13)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (50, 5, CAST(N'2024-10-17' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (51, 5, CAST(N'2024-10-17' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (52, 5, CAST(N'2024-10-17' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (53, 5, CAST(N'2024-10-18' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (54, 5, CAST(N'2024-10-18' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (55, 5, CAST(N'2024-10-18' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (56, 5, CAST(N'2024-10-19' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (57, 5, CAST(N'2024-10-19' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (58, 5, CAST(N'2024-10-19' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (59, 5, CAST(N'2024-10-17' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (60, 5, CAST(N'2024-10-17' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (61, 5, CAST(N'2024-10-17' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (62, 5, CAST(N'2024-10-18' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (63, 5, CAST(N'2024-10-18' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (64, 5, CAST(N'2024-10-18' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (65, 5, CAST(N'2024-10-19' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (66, 5, CAST(N'2024-10-19' AS Date), N'K2', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (67, 5, CAST(N'2024-10-19' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (68, 9, CAST(N'2024-10-26' AS Date), N'K1', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (69, 9, CAST(N'2024-10-26' AS Date), N'K2', 40)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (70, 9, CAST(N'2024-10-26' AS Date), N'K3', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (71, 9, CAST(N'2024-10-27' AS Date), N'K1', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (72, 9, CAST(N'2024-10-27' AS Date), N'K2', 40)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (73, 9, CAST(N'2024-10-27' AS Date), N'K3', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (74, 9, CAST(N'2024-10-28' AS Date), N'K1', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (75, 9, CAST(N'2024-10-28' AS Date), N'K2', 40)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (76, 9, CAST(N'2024-10-28' AS Date), N'K3', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (77, 4, CAST(N'2024-10-17' AS Date), N'K1', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (78, 4, CAST(N'2024-10-17' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (79, 4, CAST(N'2024-10-17' AS Date), N'K3', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (80, 4, CAST(N'2024-10-18' AS Date), N'K1', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (81, 4, CAST(N'2024-10-18' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (82, 4, CAST(N'2024-10-18' AS Date), N'K3', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (83, 4, CAST(N'2024-10-19' AS Date), N'K1', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (84, 4, CAST(N'2024-10-19' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (85, 4, CAST(N'2024-10-19' AS Date), N'K3', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (86, 4, CAST(N'2024-10-17' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (87, 4, CAST(N'2024-10-17' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (88, 4, CAST(N'2024-10-17' AS Date), N'K3', 7)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (89, 4, CAST(N'2024-10-18' AS Date), N'K1', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (90, 4, CAST(N'2024-10-18' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (91, 4, CAST(N'2024-10-18' AS Date), N'K3', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (92, 4, CAST(N'2024-10-19' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (93, 4, CAST(N'2024-10-19' AS Date), N'K2', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (94, 4, CAST(N'2024-10-19' AS Date), N'K3', 7)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (95, 10, CAST(N'2024-10-28' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (96, 10, CAST(N'2024-10-28' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (97, 10, CAST(N'2024-10-28' AS Date), N'K3', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (98, 10, CAST(N'2024-10-29' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (99, 10, CAST(N'2024-10-29' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (100, 10, CAST(N'2024-10-29' AS Date), N'K3', 6)
GO
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (101, 10, CAST(N'2024-10-28' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (102, 10, CAST(N'2024-10-28' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (103, 10, CAST(N'2024-10-28' AS Date), N'K3', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (104, 10, CAST(N'2024-10-29' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (105, 10, CAST(N'2024-10-29' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (106, 10, CAST(N'2024-10-29' AS Date), N'K3', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (107, 10, CAST(N'2024-10-28' AS Date), N'K1', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (108, 10, CAST(N'2024-10-28' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (109, 10, CAST(N'2024-10-28' AS Date), N'K3', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (110, 10, CAST(N'2024-10-29' AS Date), N'K1', 7)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (111, 10, CAST(N'2024-10-29' AS Date), N'K2', 6)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (112, 10, CAST(N'2024-10-29' AS Date), N'K3', 7)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (113, 11, CAST(N'2024-10-28' AS Date), N'K1', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (114, 11, CAST(N'2024-10-28' AS Date), N'K2', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (115, 11, CAST(N'2024-10-28' AS Date), N'K3', 3)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (116, 11, CAST(N'2024-10-28' AS Date), N'K1', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (117, 11, CAST(N'2024-10-28' AS Date), N'K2', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (118, 11, CAST(N'2024-10-28' AS Date), N'K3', 3)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (119, 11, CAST(N'2024-10-28' AS Date), N'K1', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (120, 11, CAST(N'2024-10-28' AS Date), N'K2', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (121, 11, CAST(N'2024-10-28' AS Date), N'K3', 3)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (122, 12, CAST(N'2024-10-29' AS Date), N'K1', 2)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (123, 12, CAST(N'2024-10-29' AS Date), N'K2', 2)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (124, 12, CAST(N'2024-10-29' AS Date), N'K3', 2)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (125, 23, CAST(N'2024-10-03' AS Date), N'K1', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (126, 23, CAST(N'2024-10-03' AS Date), N'K2', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (127, 23, CAST(N'2024-10-03' AS Date), N'K3', 0)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (128, 21, CAST(N'2024-11-02' AS Date), N'K1', 45)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (129, 21, CAST(N'2024-11-02' AS Date), N'K2', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (130, 21, CAST(N'2024-11-02' AS Date), N'K3', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (131, 24, CAST(N'2024-10-30' AS Date), N'K1', 10)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (132, 24, CAST(N'2024-10-30' AS Date), N'K2', 60)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (133, 24, CAST(N'2024-10-30' AS Date), N'K3', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (134, 25, CAST(N'2024-10-23' AS Date), N'K1', 40)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (135, 25, CAST(N'2024-10-23' AS Date), N'K2', 40)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (136, 25, CAST(N'2024-10-23' AS Date), N'K3', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (137, 27, CAST(N'2024-11-01' AS Date), N'K1', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (138, 27, CAST(N'2024-11-01' AS Date), N'K2', 15)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (139, 27, CAST(N'2024-11-01' AS Date), N'K3', 15)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (140, 27, CAST(N'2024-11-02' AS Date), N'K1', 15)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (141, 27, CAST(N'2024-11-02' AS Date), N'K2', 15)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (142, 27, CAST(N'2024-11-02' AS Date), N'K3', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (143, 18, CAST(N'2024-10-29' AS Date), N'K1', 5)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (144, 18, CAST(N'2024-10-29' AS Date), N'K2', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (145, 18, CAST(N'2024-10-29' AS Date), N'K3', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (146, 18, CAST(N'2024-10-30' AS Date), N'K1', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (147, 18, CAST(N'2024-10-30' AS Date), N'K2', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (148, 18, CAST(N'2024-10-30' AS Date), N'K3', 1)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (149, 30, CAST(N'2024-12-01' AS Date), N'K1', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (150, 30, CAST(N'2024-12-01' AS Date), N'K2', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (151, 30, CAST(N'2024-12-01' AS Date), N'K3', 0)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (152, 29, CAST(N'2024-12-01' AS Date), N'K1', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (153, 29, CAST(N'2024-12-01' AS Date), N'K2', 50)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (154, 29, CAST(N'2024-12-01' AS Date), N'K3', 0)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (155, 15, CAST(N'2024-10-29' AS Date), N'K3', 0)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (156, 20, CAST(N'2024-10-16' AS Date), N'K1', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (157, 20, CAST(N'2024-10-16' AS Date), N'K2', 30)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (158, 20, CAST(N'2024-10-17' AS Date), N'K1', 20)
INSERT [dbo].[SchedualCampaign] ([ScID], [PlanCampnID], [Date], [Shift], [Quantity]) VALUES (159, 20, CAST(N'2024-10-17' AS Date), N'K2', 30)
SET IDENTITY_INSERT [dbo].[SchedualCampaign] OFF
GO
SET IDENTITY_INSERT [dbo].[SchedualEmployee] ON 

INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (1, 1, 1, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (2, 1, 2, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (3, 1, 3, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (4, 1, 4, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (5, 2, 14, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (6, 2, 15, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (7, 2, 16, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (8, 2, 17, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (9, 3, 27, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (10, 3, 28, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (11, 3, 29, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (12, 3, 31, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (13, 4, 5, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (14, 4, 6, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (15, 4, 7, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (16, 4, 8, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (17, 5, 18, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (18, 5, 19, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (19, 5, 21, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (20, 5, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (21, 6, 32, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (22, 6, 33, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (23, 6, 34, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (24, 6, 35, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (25, 7, 9, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (26, 7, 11, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (27, 7, 12, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (28, 7, 13, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (29, 8, 23, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (30, 8, 24, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (31, 8, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (32, 8, 26, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (33, 9, 36, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (34, 9, 37, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (35, 9, 38, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (36, 9, 39, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (37, 10, 1, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (38, 10, 2, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (39, 10, 3, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (40, 10, 4, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (41, 11, 14, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (42, 11, 15, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (43, 11, 16, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (44, 11, 17, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (45, 12, 27, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (46, 12, 28, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (47, 12, 29, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (48, 12, 31, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (49, 13, 5, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (50, 13, 6, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (51, 13, 7, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (52, 13, 8, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (53, 14, 18, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (54, 14, 19, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (55, 14, 21, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (56, 14, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (57, 15, 32, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (58, 15, 33, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (59, 15, 34, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (60, 15, 35, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (61, 16, 9, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (62, 16, 11, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (63, 16, 12, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (64, 16, 13, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (65, 17, 23, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (66, 17, 24, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (67, 17, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (68, 17, 26, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (69, 18, 36, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (70, 18, 37, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (71, 18, 38, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (72, 18, 39, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (73, 19, 1, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (74, 19, 2, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (75, 19, 3, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (76, 19, 4, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (77, 20, 14, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (78, 20, 15, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (79, 20, 16, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (80, 20, 17, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (81, 21, 27, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (82, 21, 28, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (83, 21, 29, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (84, 21, 31, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (85, 22, 5, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (86, 22, 6, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (87, 22, 7, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (88, 22, 8, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (89, 23, 18, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (90, 23, 19, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (91, 23, 21, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (92, 23, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (93, 24, 32, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (94, 24, 33, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (95, 24, 34, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (96, 24, 35, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (97, 25, 9, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (98, 25, 11, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (99, 25, 12, 4)
GO
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (100, 25, 13, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (101, 26, 23, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (102, 26, 24, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (103, 26, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (104, 26, 26, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (105, 27, 36, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (106, 27, 37, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (107, 27, 38, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (108, 27, 39, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (109, 28, 1, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (110, 28, 2, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (111, 28, 3, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (112, 28, 4, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (113, 29, 14, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (114, 29, 15, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (115, 29, 16, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (116, 29, 17, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (117, 30, 27, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (118, 30, 28, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (119, 30, 29, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (120, 30, 31, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (121, 31, 5, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (122, 31, 6, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (123, 31, 7, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (124, 31, 8, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (125, 32, 18, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (126, 32, 19, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (127, 32, 21, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (128, 32, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (129, 33, 32, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (130, 33, 33, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (131, 33, 34, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (132, 33, 35, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (133, 34, 9, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (134, 34, 11, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (135, 34, 12, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (136, 34, 13, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (137, 35, 23, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (138, 35, 24, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (139, 35, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (140, 35, 26, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (141, 36, 36, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (142, 36, 37, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (143, 36, 38, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (144, 36, 39, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (145, 37, 1, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (146, 37, 2, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (147, 37, 3, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (148, 37, 4, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (149, 38, 14, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (150, 38, 15, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (151, 38, 16, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (152, 38, 17, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (153, 39, 27, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (154, 39, 28, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (155, 39, 29, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (156, 39, 31, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (157, 40, 5, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (158, 40, 6, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (159, 40, 7, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (160, 40, 8, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (161, 41, 18, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (162, 41, 19, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (163, 41, 21, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (164, 41, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (165, 42, 32, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (166, 42, 33, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (167, 42, 34, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (168, 42, 35, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (169, 43, 9, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (170, 43, 11, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (171, 43, 12, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (172, 43, 13, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (173, 44, 23, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (174, 44, 24, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (175, 44, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (176, 44, 26, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (177, 45, 36, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (178, 45, 37, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (179, 45, 38, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (180, 45, 39, 8)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (181, 46, 19, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (182, 47, 19, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (183, 49, 19, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (184, 131, 13, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (185, 131, 30, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (186, 131, 31, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (187, 131, 32, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (188, 131, 39, 6)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (189, 134, 18, 20)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (190, 134, 19, 20)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (191, 134, 20, 0)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (192, 134, 21, 0)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (193, 134, 22, 0)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (194, 139, 6, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (195, 139, 27, 2)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (196, 139, 28, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (197, 139, 29, 2)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (198, 138, 23, 2)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (199, 138, 24, 3)
GO
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (200, 138, 25, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (201, 138, 26, 6)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (202, 137, 18, 1)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (203, 137, 19, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (204, 137, 20, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (205, 137, 21, 5)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (206, 137, 22, 4)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (207, 150, 33, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (208, 150, 34, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (209, 150, 37, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (210, 150, 38, 20)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (211, 149, 13, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (212, 149, 30, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (213, 149, 31, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (214, 149, 32, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (215, 149, 39, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (216, 152, 13, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (217, 152, 30, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (218, 152, 31, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (219, 152, 32, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (220, 152, 39, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (221, 153, 33, 20)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (222, 153, 34, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (223, 153, 37, 10)
INSERT [dbo].[SchedualEmployee] ([SchEmpID], [ScID], [EmployeeID], [OrderedQuantity]) VALUES (224, 153, 38, 10)
SET IDENTITY_INSERT [dbo].[SchedualEmployee] OFF
GO
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'admin', N'admin', N'Quản trị viên')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'ketoan', N'123', N'Kế Toán')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'mrplan', N'123', N'Kế Hoạch')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qd1', N'123', N'Kế Hoạch WS1')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qd2', N'123', N'Kế Hoạch WS2')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qd3', N'123', N'Kế Hoạch  WS3')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk1w1', N'123', N'Quản lí K1 WS1')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk1w2', N'123', N'Quản lí K1 WS2')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk2w1', N'123', N'Quản lí K2 WS1')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk2w2', N'123', N'Quản lí K2 WS2')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk3w1', N'123', N'Quản lí K3 WS1')
INSERT [dbo].[User] ([UserName], [password], [displayname]) VALUES (N'qlk3w2', N'123', N'Quản lí K3 WS2')
GO
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'admin', 7)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'ketoan', 4)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'mrplan', 2)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qd1', 3)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qd2', 3)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qd3', 3)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk1w1', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk1w2', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk2w1', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk2w2', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk3w1', 1)
INSERT [dbo].[UserRole] ([UserName], [RoleID]) VALUES (N'qlk3w2', 1)
GO
ALTER TABLE [dbo].[AttendanceEmployee]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceEmployee_AttendanceEmployee1] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[AttendanceEmployee] CHECK CONSTRAINT [FK_AttendanceEmployee_AttendanceEmployee1]
GO
ALTER TABLE [dbo].[AttendenceWorker]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_SchedualEmployee] FOREIGN KEY([SchEmpID])
REFERENCES [dbo].[SchedualEmployee] ([SchEmpID])
GO
ALTER TABLE [dbo].[AttendenceWorker] CHECK CONSTRAINT [FK_Attendence_SchedualEmployee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Department1] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Department1]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Plan] FOREIGN KEY([PlanID])
REFERENCES [dbo].[Plan] ([PlanID])
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Plan]
GO
ALTER TABLE [dbo].[PlanCampain]  WITH CHECK ADD  CONSTRAINT [FK_PlanCampain_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PlanCampain] CHECK CONSTRAINT [FK_PlanCampain_Product]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[SchedualCampaign]  WITH CHECK ADD  CONSTRAINT [FK_SchedualCampaign_PlanCampain] FOREIGN KEY([PlanCampnID])
REFERENCES [dbo].[PlanCampain] ([PlanCampnID])
GO
ALTER TABLE [dbo].[SchedualCampaign] CHECK CONSTRAINT [FK_SchedualCampaign_PlanCampain]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_Employee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_Employee]
GO
ALTER TABLE [dbo].[SchedualEmployee]  WITH CHECK ADD  CONSTRAINT [FK_SchedualEmployee_SchedualCampaign] FOREIGN KEY([ScID])
REFERENCES [dbo].[SchedualCampaign] ([ScID])
GO
ALTER TABLE [dbo].[SchedualEmployee] CHECK CONSTRAINT [FK_SchedualEmployee_SchedualCampaign]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[User] ([UserName])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
