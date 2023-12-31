USE [master]
GO
/****** Object:  Database [WEBAPP]    Script Date: 30/08/2023 2:05:13 am ******/
CREATE DATABASE [WEBAPP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WEBAPP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WEBAPP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WEBAPP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WEBAPP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WEBAPP] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WEBAPP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WEBAPP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WEBAPP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WEBAPP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WEBAPP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WEBAPP] SET ARITHABORT OFF 
GO
ALTER DATABASE [WEBAPP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WEBAPP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WEBAPP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WEBAPP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WEBAPP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WEBAPP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WEBAPP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WEBAPP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WEBAPP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WEBAPP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WEBAPP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WEBAPP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WEBAPP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WEBAPP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WEBAPP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WEBAPP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WEBAPP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WEBAPP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WEBAPP] SET  MULTI_USER 
GO
ALTER DATABASE [WEBAPP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WEBAPP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WEBAPP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WEBAPP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WEBAPP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WEBAPP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WEBAPP] SET QUERY_STORE = ON
GO
ALTER DATABASE [WEBAPP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WEBAPP]
GO
/****** Object:  Table [dbo].[course]    Script Date: 30/08/2023 2:05:13 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[course_code] [varchar](50) NOT NULL,
	[course_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_course_1] PRIMARY KEY CLUSTERED 
(
	[course_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email]    Script Date: 30/08/2023 2:05:13 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email](
	[regid] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_email_1] PRIMARY KEY CLUSTERED 
(
	[regid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enrolement]    Script Date: 30/08/2023 2:05:13 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enrolement](
	[stid] [varchar](50) NOT NULL,
	[course_name] [varchar](50) NOT NULL,
	[couse_code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_enrolement] PRIMARY KEY CLUSTERED 
(
	[stid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 30/08/2023 2:05:13 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[firstname] [varchar](50) NOT NULL,
	[lastname] [varchar](50) NOT NULL,
	[regid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[regid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[enrolement]  WITH CHECK ADD  CONSTRAINT [FK_enrolement_course] FOREIGN KEY([couse_code])
REFERENCES [dbo].[course] ([course_code])
GO
ALTER TABLE [dbo].[enrolement] CHECK CONSTRAINT [FK_enrolement_course]
GO
ALTER TABLE [dbo].[enrolement]  WITH CHECK ADD  CONSTRAINT [FK_enrolement_student] FOREIGN KEY([stid])
REFERENCES [dbo].[student] ([regid])
GO
ALTER TABLE [dbo].[enrolement] CHECK CONSTRAINT [FK_enrolement_student]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'student'
GO
USE [master]
GO
ALTER DATABASE [WEBAPP] SET  READ_WRITE 
GO
