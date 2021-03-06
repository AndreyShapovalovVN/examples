USE [master]
GO
/****** Object:  Database [DBTest]    Script Date: 6/6/2018 7:40:08 PM ******/
CREATE DATABASE [DBTest]
 CONTAINMENT = NONE
GO
ALTER DATABASE [DBTest] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBTest] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBTest] SET RECOVERY FULL 
GO
ALTER DATABASE [DBTest] SET  MULTI_USER 
GO
ALTER DATABASE [DBTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBTest]
GO
CREATE LOGIN dbuser1
    WITH PASSWORD = 'dbuser1';  
GO  
/****** Object:  User [dbuser1]    Script Date: 6/6/2018 7:40:08 PM ******/
CREATE USER [dbuser1] FOR LOGIN [dbuser1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [dbuser1]
GO
/****** Object:  Table [dbo].[address]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[Inn] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](128) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[Inn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auto]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto](
	[Inn] [nvarchar](10) NULL,
	[Model] [nvarchar](32) NULL,
	[Reg_num] [nvarchar](12) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Companies]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[EDRPOU] [nvarchar](10) NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[documents]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[documents](
	[Inn] [nvarchar](10) NOT NULL,
	[FileName] [nvarchar](50) NULL,
	[Data] [varbinary](max) NULL,
 CONSTRAINT [PK_documents] PRIMARY KEY CLUSTERED 
(
	[Inn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[people]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[people](
	[Inn] [nvarchar](10) NOT NULL,
	[Surname] [nvarchar](64) NULL,
	[Firstname] [nvarchar](64) NULL,
	[Patronymic] [nvarchar](64) NULL,
	[Birthdate] [date] NULL,
	[Passport_ser] [nvarchar](5) NULL,
	[Passport_num] [nvarchar](10) NULL,
 CONSTRAINT [PK_people] PRIMARY KEY CLUSTERED 
(
	[Inn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/6/2018 7:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[Title] [nvarchar](100) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345671', N'Киев, б. Шевченко 1а')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345672', N'Винница, Соборная 2')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345673', N'Харьков, Сумская 8')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345674', N'Днепропетровск, Дорожная 8б')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345675', N'Харьков, ул. Строителей 254')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345676', N'Донецк, Независимости 54в')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345677', N'Бахмут, вул. Леваневського 1, кв 1')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345678', N'Одесса, Набережная 11')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345679', N'Львов, Базарная 3а')
INSERT [dbo].[address] ([Inn], [Address]) VALUES (N'12345670', N'Конотоп, Киевска 11')
INSERT [dbo].[auto] ([Inn], [Model], [Reg_num]) VALUES (N'12345671', N'Форд', N'аа1204ва')
INSERT [dbo].[auto] ([Inn], [Model], [Reg_num]) VALUES (N'12345672', N'Ауди', N'вк2301вн')
INSERT [dbo].[auto] ([Inn], [Model], [Reg_num]) VALUES (N'12345673', N'Шкода', N'в12312а')
SET IDENTITY_INSERT [dbo].[Companies] ON 

INSERT [dbo].[Companies] ([ID], [Name], [EDRPOU]) VALUES (1, N'Укрзализниця', N'13245678')
INSERT [dbo].[Companies] ([ID], [Name], [EDRPOU]) VALUES (2, N'Нафтогаз', N'87654321')
INSERT [dbo].[Companies] ([ID], [Name], [EDRPOU]) VALUES (3, N'ДП Документ', N'11122233')
SET IDENTITY_INSERT [dbo].[Companies] OFF
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345671', N'Конанов', N'Эдуард', N'Петович', CAST(0x3E110B00 AS Date), N'ВК', N'332211')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345672', N'Васюк', N'Виктор', N'Валентинович', CAST(0x14050B00 AS Date), N'ВС', N'223311')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345673', N'Николаева', N'Ирина', N'Степановна', CAST(0x6A070B00 AS Date), N'ВН', N'112233')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345674', N'Петров', N'Петр', N'Петрович', NULL, N'ВС', N'221133')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345675', N'Звонарева', N'Ирина', N'Викторовна', CAST(0xCDF60A00 AS Date), N'ВБ', N'441133')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345676', N'Иванов', N'Михаил', N'Иванович', CAST(0xE9040B00 AS Date), N'ВБ', N'442211')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345677', N'Резноренко', N'Михайло', N'Тимофійович', CAST(0xA0F20A00 AS Date), N'ВО', N'441155')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345678', N'Харламов', N'Валерий', N'Борисович', CAST(0xA0F20A00 AS Date), N'ВА', N'441188')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345679', N'Михайлов', N'Николай', N'Алексеевич', CAST(0x800B0B00 AS Date), N'ВН', N'441199')
INSERT [dbo].[people] ([Inn], [Surname], [Firstname], [Patronymic], [Birthdate], [Passport_ser], [Passport_num]) VALUES (N'12345670', N'Токарева', N'Анна', N'Николаевна', CAST(0xFD110B00 AS Date), N'АН', N'441100')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (2, 1, N'Дмитрий', N'Сергеевич', N'Яковлев', N'Донецк', N'Донецкая', N'230 стр. див.', N'us6itv@hotmail.com', N'Программист')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (3, 1, N'Петров', N'Валерий', N'Алексеевич', N'Харьков', N'Харьковская', N'Зеленая', N'v_petrov@gmail.com', N'Программист')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (4, 2, N'Анна', N'Андреевна', N'Большая', N'Киев', N'Киевская', N'м. Независимости', N'a_bolshaya@gmail.com', N'Бухгалтер')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (5, 2, N'Николай', N'Николаевич', N'Пеньков', N'Херсон', N'Херсонская', N'Тараса Шевченко', N'n_penkov@gmail.com', N'Тестировщик')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (6, 2, N'Василий', N'Анатольевич', N'Пеший', N'Киев', N'Киевская', N'м. Независимости', N'v_pishui@hotmail.com', N'Программист')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (7, 3, N'Ольга', N'Николаевна', N'Пенькова', N'Запорожье', N'Запорожская', N'Мира', N'o_penkova@gmail.com', N'Инженер')
INSERT [dbo].[Users] ([ID], [CompanyID], [Name], [MiddleName], [Surname], [City], [Region], [Address], [Email], [Title]) VALUES (8, 3, N'Анна', N'Алексеевна', N'Доренко', N'Запорожье', N'Запорожская', N'Мира', N'a_dorenko@yandex.ru', N'Инженер')
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [DBTest] SET  READ_WRITE 
GO
