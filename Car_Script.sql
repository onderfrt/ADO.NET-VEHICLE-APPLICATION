USE [master]
GO
/****** Object:  Database [Car]    Script Date: 10.05.2022 11:27:38 ******/
CREATE DATABASE [Car]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Car.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Car_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Car_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Car] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Car] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car] SET RECOVERY FULL 
GO
ALTER DATABASE [Car] SET  MULTI_USER 
GO
ALTER DATABASE [Car] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Car] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Car', N'ON'
GO
ALTER DATABASE [Car] SET QUERY_STORE = OFF
GO
USE [Car]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Car]
GO
/****** Object:  Table [dbo].[BodyType]    Script Date: 10.05.2022 11:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BodyType](
	[Description_] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 10.05.2022 11:27:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Description_] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FuelType]    Script Date: 10.05.2022 11:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuelType](
	[Description_] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gear]    Script Date: 10.05.2022 11:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gear](
	[Description_] [varchar](40) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info]    Script Date: 10.05.2022 11:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Price] [money] NULL,
	[Year_] [int] NULL,
	[Fuel] [varchar](50) NULL,
	[Gear] [varchar](50) NULL,
	[Km] [int] NULL,
	[Body] [varchar](50) NULL,
	[Power_] [smallint] NULL,
	[Color] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.05.2022 11:27:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](20) NOT NULL,
	[pass] [varchar](20) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BodyType] ([Description_]) VALUES (N'Hatchback')
INSERT [dbo].[BodyType] ([Description_]) VALUES (N'Sedan')
INSERT [dbo].[BodyType] ([Description_]) VALUES (N'SUV')
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([id], [Description_]) VALUES (1, N'Mercedes')
INSERT [dbo].[Brand] ([id], [Description_]) VALUES (2, N'Bmw')
INSERT [dbo].[Brand] ([id], [Description_]) VALUES (3, N'Togg')
INSERT [dbo].[Brand] ([id], [Description_]) VALUES (4, N'Volkswagen')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
INSERT [dbo].[FuelType] ([Description_]) VALUES (N'Benzin')
INSERT [dbo].[FuelType] ([Description_]) VALUES (N'Benzin&LPG')
INSERT [dbo].[FuelType] ([Description_]) VALUES (N'Dizel')
INSERT [dbo].[FuelType] ([Description_]) VALUES (N'Hibrid')
INSERT [dbo].[FuelType] ([Description_]) VALUES (N'Elektrik')
GO
INSERT [dbo].[Gear] ([Description_]) VALUES (N'Manuel')
INSERT [dbo].[Gear] ([Description_]) VALUES (N'Yarı Otomatik')
INSERT [dbo].[Gear] ([Description_]) VALUES (N'Otomatik')
GO
SET IDENTITY_INSERT [dbo].[Info] ON 

INSERT [dbo].[Info] ([Id], [Brand], [Model], [Price], [Year_], [Fuel], [Gear], [Km], [Body], [Power_], [Color]) VALUES (1, N'Mercedes', N'c200', 500000.0000, 2010, N'Benzin', N'Yarı Otomatik', 4000, N'Sedan', 250, N'Siyah')
INSERT [dbo].[Info] ([Id], [Brand], [Model], [Price], [Year_], [Fuel], [Gear], [Km], [Body], [Power_], [Color]) VALUES (2, N'Bmw', N'330', 600000.0000, 2016, N'Dizel', N'Manuel', 40000, N'Hatchback', 400, N'Sarı')
SET IDENTITY_INSERT [dbo].[Info] OFF
GO
INSERT [dbo].[Users] ([username], [pass]) VALUES (N'admin', N'12345')
GO
USE [master]
GO
ALTER DATABASE [Car] SET  READ_WRITE 
GO
