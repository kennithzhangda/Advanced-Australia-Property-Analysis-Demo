USE [master]
GO
/****** Object:  Database [Australia_PropertyAnalysis_Advanced]    Script Date: 4/05/2023 5:55:17 pm ******/
CREATE DATABASE [Australia_PropertyAnalysis_Advanced]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Australia_PropertyAnalysis_Advanced', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.IC\MSSQL\DATA\Australia_PropertyAnalysis_Advanced.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Australia_PropertyAnalysis_Advanced_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.IC\MSSQL\DATA\Australia_PropertyAnalysis_Advanced_log.ldf' , SIZE = 335872KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Australia_PropertyAnalysis_Advanced].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ARITHABORT OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET RECOVERY FULL 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET  MULTI_USER 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Australia_PropertyAnalysis_Advanced', N'ON'
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET QUERY_STORE = ON
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Australia_PropertyAnalysis_Advanced]
GO
/****** Object:  Table [dbo].[DimAuLocalSchool]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimAuLocalSchool](
	[SchoolKey] [int] IDENTITY(1,1) NOT NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](50) NULL,
	[SchoolName] [nvarchar](50) NULL,
	[Street] [nvarchar](50) NULL,
	[LevelofSchooling] [nvarchar](50) NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
	[StateCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_DimAuLocalSchool] PRIMARY KEY CLUSTERED 
(
	[SchoolKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimGeography]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimGeography](
	[GeographyKey] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](50) NULL,
	[StateCode] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[Distric] [nvarchar](50) NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](50) NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
 CONSTRAINT [PK_DimGeography] PRIMARY KEY CLUSTERED 
(
	[GeographyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOffenceCategory]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOffenceCategory](
	[OffenceCategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[OffenceCategoryID] [int] NULL,
	[OffenceCategory] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimOffenceCategory] PRIMARY KEY CLUSTERED 
(
	[OffenceCategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOffenceSubcategory]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOffenceSubcategory](
	[OffenceSubcategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[OffenceSubcategoryID] [int] NULL,
	[OffenceSubcategory] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimOffenceSubcategory] PRIMARY KEY CLUSTERED 
(
	[OffenceSubcategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimState]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimState](
	[StateKey] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimState] PRIMARY KEY CLUSTERED 
(
	[StateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTransport]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTransport](
	[TransportKey] [int] IDENTITY(1,1) NOT NULL,
	[StopIdNew] [int] NOT NULL,
	[StopName] [nvarchar](max) NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
	[Mode] [nvarchar](10) NULL,
	[StateCode] [nvarchar](10) NULL,
	[Suburb] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimTransport] PRIMARY KEY CLUSTERED 
(
	[TransportKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCrimeByYear]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCrimeByYear](
	[CrimeKey] [int] IDENTITY(1,1) NOT NULL,
	[StateCode] [nvarchar](10) NULL,
	[City] [nvarchar](10) NULL,
	[Suburb] [nvarchar](max) NULL,
	[Postcode] [int] NULL,
	[Year] [int] NULL,
	[IncidentNumber] [int] NULL,
	[PopulationKey] [int] NULL,
	[Population] [int] NULL,
	[OffenceCategoryKey] [int] NULL,
	[OffenceSubcategoryKey] [int] NULL,
	[GeographyKey] [int] NULL,
 CONSTRAINT [PK_FactCrimeByYear] PRIMARY KEY CLUSTERED 
(
	[CrimeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactMedianPropertyValueByYear]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactMedianPropertyValueByYear](
	[PropertyKey] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](10) NULL,
	[Suburb] [nvarchar](50) NULL,
	[PropertyMedian1] [int] NULL,
	[UpdatedYear1] [int] NULL,
	[UpdatedMonth1] [int] NULL,
	[PropertyMedian2] [int] NULL,
	[UpdatedYear2] [int] NULL,
	[UpdatedMonth2] [int] NULL,
	[Postcode] [int] NULL,
	[StateCode] [nvarchar](10) NULL,
	[GeographyKey] [int] NULL,
	[SchoolKey] [int] NULL,
	[TransportKey] [int] NULL,
 CONSTRAINT [PK_FactMedianPropertyValueByYear] PRIMARY KEY CLUSTERED 
(
	[PropertyKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSuburbPopulation]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSuburbPopulation](
	[PopulationKey] [int] IDENTITY(1,1) NOT NULL,
	[State] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[Suburb] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Population] [int] NULL,
	[Postcode] [int] NULL,
	[StateKey] [int] NULL,
 CONSTRAINT [PK_FactSuburbPopulation] PRIMARY KEY CLUSTERED 
(
	[PopulationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSuburbRentalMedian]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSuburbRentalMedian](
	[RentalKey] [int] IDENTITY(1,1) NOT NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](10) NULL,
	[City] [nvarchar](10) NULL,
	[StateCode] [nvarchar](10) NULL,
	[RentalMedian] [numeric](18, 2) NULL,
	[GeographyKey] [int] NULL,
 CONSTRAINT [PK_FactSuburbRentalMedian] PRIMARY KEY CLUSTERED 
(
	[RentalKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stg_Crime]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Crime](
	[State] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Postcode] [nvarchar](10) NULL,
	[Offence category] [nvarchar](255) NULL,
	[Offence subcategory] [nvarchar](255) NULL,
	[Year] [nvarchar](10) NULL,
	[Recorded Incidents] [nvarchar](10) NULL,
	[District] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stg_PropertyMedianValue]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_PropertyMedianValue](
	[City] [nvarchar](255) NULL,
	[Suburb] [nvarchar](255) NULL,
	[Median1] [int] NULL,
	[UpdatedYear1] [int] NULL,
	[UpdatedMonth1] [int] NULL,
	[Median2] [nvarchar](255) NULL,
	[UpdatedYear2] [nvarchar](255) NULL,
	[UpdatedMonth2] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[StateCode] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stg_Rental]    Script Date: 4/05/2023 5:55:17 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stg_Rental](
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[StateCode] [nvarchar](255) NULL,
	[RentalMedian] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_DimGeography]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_DimOffenceCategory] FOREIGN KEY([OffenceCategoryKey])
REFERENCES [dbo].[DimOffenceCategory] ([OffenceCategoryKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_DimOffenceCategory]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_DimOffenceSubcategory] FOREIGN KEY([OffenceSubcategoryKey])
REFERENCES [dbo].[DimOffenceSubcategory] ([OffenceSubcategoryKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_DimOffenceSubcategory]
GO
ALTER TABLE [dbo].[FactCrimeByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactCrimeByYear_FactSuburbPopulation] FOREIGN KEY([PopulationKey])
REFERENCES [dbo].[FactSuburbPopulation] ([PopulationKey])
GO
ALTER TABLE [dbo].[FactCrimeByYear] CHECK CONSTRAINT [FK_FactCrimeByYear_FactSuburbPopulation]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactMedianPropertyValueByYear_DimAuLocalSchool] FOREIGN KEY([SchoolKey])
REFERENCES [dbo].[DimAuLocalSchool] ([SchoolKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FK_FactMedianPropertyValueByYear_DimAuLocalSchool]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactMedianPropertyValueByYear_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FK_FactMedianPropertyValueByYear_DimGeography]
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear]  WITH CHECK ADD  CONSTRAINT [FK_FactMedianPropertyValueByYear_DimTransport] FOREIGN KEY([TransportKey])
REFERENCES [dbo].[DimTransport] ([TransportKey])
GO
ALTER TABLE [dbo].[FactMedianPropertyValueByYear] CHECK CONSTRAINT [FK_FactMedianPropertyValueByYear_DimTransport]
GO
ALTER TABLE [dbo].[FactSuburbPopulation]  WITH CHECK ADD  CONSTRAINT [FK_FactSuburbPopulation_DimState] FOREIGN KEY([StateKey])
REFERENCES [dbo].[DimState] ([StateKey])
GO
ALTER TABLE [dbo].[FactSuburbPopulation] CHECK CONSTRAINT [FK_FactSuburbPopulation_DimState]
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian]  WITH CHECK ADD  CONSTRAINT [FK_FactSuburbRentalMedian_DimGeography] FOREIGN KEY([GeographyKey])
REFERENCES [dbo].[DimGeography] ([GeographyKey])
GO
ALTER TABLE [dbo].[FactSuburbRentalMedian] CHECK CONSTRAINT [FK_FactSuburbRentalMedian_DimGeography]
GO
USE [master]
GO
ALTER DATABASE [Australia_PropertyAnalysis_Advanced] SET  READ_WRITE 
GO
