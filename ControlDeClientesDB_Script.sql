USE [master]
GO
/****** Object:  Database [ControlDeClientesCfaDB]    Script Date: 5/23/2023 3:52:50 PM ******/
CREATE DATABASE [ControlDeClientesCfaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ControlDeClientesCfaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ControlDeClientesCfaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ControlDeClientesCfaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ControlDeClientesCfaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlDeClientesCfaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET  MULTI_USER 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ControlDeClientesCfaDB]
GO
/****** Object:  Table [dbo].[ClientContact]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientContact](
	[IdNumber] [bigint] NOT NULL,
	[PersonalPhoneNumber] [bigint] NULL,
	[HomePhoneNumber] [bigint] NULL,
	[WorkPhoneNumber] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLocation]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLocation](
	[IdNumber] [bigint] NOT NULL,
	[HomeAddress] [varchar](50) NULL,
	[WorkAddress] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientsTable]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientsTable](
	[Code] [bigint] IDENTITY(1,1) NOT NULL,
	[IdType] [varchar](20) NOT NULL,
	[IdNumber] [bigint] NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[FirstSurname] [varchar](30) NOT NULL,
	[SecondSurname] [varchar](30) NULL,
	[Gender] [char](1) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (11345678, 3155614781, 5080947, 2341938)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (12325578, 3156753489, 4567892, 0)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (12325678, 3014567897, 0, 5038978)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (12345678, 3007535105, 5080947, 4213583)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (12385578, 3105295416, 4482000, 0)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (13325678, 0, 5038978, 2346180)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (13345678, 3126379477, 5038978, 4210892)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (18387578, 3156293682, 0, 0)
GO
INSERT [dbo].[ClientContact] ([IdNumber], [PersonalPhoneNumber], [HomePhoneNumber], [WorkPhoneNumber]) VALUES (183875078, 3017977560, 0, 0)
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (11345678, N'Calle 3', N'Calle 4')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (12325578, N'Calle 11', N'Calle 12')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (12325678, N'Calle 9', N'Calle 10')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (12345678, N'Calle 1', N'Calle 2')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (12385578, N'Calle 13', N'Calle 14')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (13325678, N'Calle 7', N'Calle 8')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (13345678, N'Calle 5', N'Calle 6')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (18387578, N'Calle 17', N'Calle 19')
GO
INSERT [dbo].[ClientLocation] ([IdNumber], [HomeAddress], [WorkAddress]) VALUES (183875078, N'Calle 20', N'Calle 21')
GO
SET IDENTITY_INSERT [dbo].[ClientsTable] ON 
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (11, N'CC', 11345678, N'Gabriel', N'Gallego', N'Estrada', N'M', CAST(N'1955-01-12' AS Date), N'gabriel@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (15, N'CC', 12325578, N'Daniela', N'Puerta', N'Vazquez', N'F', CAST(N'1997-11-08' AS Date), N'danielap@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (14, N'CC', 12325678, N'Alba', N'Rosa', NULL, N'F', CAST(N'1938-12-24' AS Date), N'alba@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (10, N'CC', 12345678, N'Mariana', N'Gallego', NULL, N'F', CAST(N'1997-11-19' AS Date), N'mariana@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (16, N'CC', 12385578, N'Daniela', N'Gallego', NULL, N'F', CAST(N'1994-03-23' AS Date), N'danielag@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (13, N'CC', 13325678, N'Adolfo', N'Rodas', NULL, N'M', CAST(N'1933-12-29' AS Date), N'adolfo@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (12, N'CC', 13345678, N'Cecilia', N'Rodas', N'Gallego', N'F', CAST(N'1963-09-01' AS Date), N'cecilia@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (18, N'CC', 18387578, N'Daniela', N'Jimenez', NULL, N'F', CAST(N'1996-03-16' AS Date), N'danielaj@correo.com')
GO
INSERT [dbo].[ClientsTable] ([Code], [IdType], [IdNumber], [Name], [FirstSurname], [SecondSurname], [Gender], [BirthDate], [Email]) VALUES (19, N'CC', 183875078, N'Stefanny', N'Orozco', NULL, N'F', CAST(N'1994-12-09' AS Date), N'stefanny@correo.com')
GO
SET IDENTITY_INSERT [dbo].[ClientsTable] OFF
GO
/****** Object:  StoredProcedure [dbo].[add_client]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[add_client](
@idtype varchar(20),
@idnumber bigint,
@name varchar(30),
@firstsurname varchar(30),
@secondsurname varchar(30),
@gender char(1),
@birthdate date,
@homeaddress varchar(50),
@workaddress varchar(50),
@personalphonenumber bigint,
@homephonenumber bigint,
@workphonenumber bigint,
@email varchar(20)
)
as
begin


insert into ClientsTable(IdType,IdNumber,Name,FirstSurname, SecondSurname, Gender, BirthDate, Email)
values
(
@idtype,
@idnumber,
@name,
@firstsurname,
@secondsurname,
@gender,
@birthdate,
@email
)

insert into ClientContact(IdNumber, PersonalPhoneNumber, HomePhoneNumber, WorkPhoneNumber)
values
(
@idnumber,
@personalphonenumber,
@homephonenumber,
@workphonenumber
)

insert into ClientLocation(IdNumber, HomeAddress, WorkAddress)
values
(
@idnumber,
@homeaddress,
@workaddress
)

UPDATE ClientContact
SET PersonalPhoneNumber = 0
WHERE PersonalPhoneNumber IS NULL;

UPDATE ClientContact
SET HomePhoneNumber = 0
WHERE HomePhoneNumber IS NULL;

UPDATE ClientContact
SET WorkPhoneNumber = 0
WHERE WorkPhoneNumber IS NULL;

UPDATE ClientLocation
SET HomeAddress = ' '
WHERE HomeAddress IS NULL;

UPDATE ClientLocation
SET WorkAddress = ' '
WHERE WorkAddress IS NULL;

end
GO
/****** Object:  StoredProcedure [dbo].[delete_client]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[delete_client](
@idnumber bigint
)
as
begin

delete from ClientsTable where IdNumber = @idnumber

delete from ClientContact where IdNumber = @idnumber

delete from ClientLocation where IdNumber = @idnumber

end
GO
/****** Object:  StoredProcedure [dbo].[edit_client]    Script Date: 5/23/2023 3:52:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[edit_client](
@idtype varchar(20),
@idnumber bigint,
@birthdate date,
@homeaddress varchar(50),
@workaddress varchar(50),
@personalphonenumber bigint,
@homephonenumber bigint,
@workphonenumber bigint
)
as
begin

update ClientsTable set 
IdType = @idtype,
IdNumber = @idnumber,
BirthDate = @birthdate
where IdNumber = @idnumber

update ClientContact set 
IdNumber = @idnumber,
PersonalPhoneNumber = @personalphonenumber,
HomePhoneNumber = @homephonenumber,
WorkPhoneNumber = @workphonenumber
where IdNumber = @idnumber

update ClientLocation set 
IdNumber = @idnumber,
HomeAddress = @homeaddress,
WorkAddress = @workaddress
where IdNumber = @idnumber

end

GO
USE [master]
GO
ALTER DATABASE [ControlDeClientesCfaDB] SET  READ_WRITE 
GO
