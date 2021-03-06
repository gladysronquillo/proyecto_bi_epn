USE [master]
GO

/****** Object:  Database [EcuavinosDW]    Script Date: 1/8/2018 10:33:16 PM ******/
CREATE DATABASE [EcuavinosDW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcuavinosDW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EcuavinosDW.mdf' , SIZE = 11264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EcuavinosDW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\EcuavinosDW_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [EcuavinosDW] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcuavinosDW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [EcuavinosDW] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [EcuavinosDW] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [EcuavinosDW] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [EcuavinosDW] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [EcuavinosDW] SET ARITHABORT OFF 
GO

ALTER DATABASE [EcuavinosDW] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [EcuavinosDW] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [EcuavinosDW] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [EcuavinosDW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [EcuavinosDW] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [EcuavinosDW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [EcuavinosDW] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [EcuavinosDW] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [EcuavinosDW] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [EcuavinosDW] SET  DISABLE_BROKER 
GO

ALTER DATABASE [EcuavinosDW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [EcuavinosDW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [EcuavinosDW] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [EcuavinosDW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [EcuavinosDW] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [EcuavinosDW] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [EcuavinosDW] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [EcuavinosDW] SET RECOVERY FULL 
GO

ALTER DATABASE [EcuavinosDW] SET  MULTI_USER 
GO

ALTER DATABASE [EcuavinosDW] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [EcuavinosDW] SET DB_CHAINING OFF 
GO

ALTER DATABASE [EcuavinosDW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [EcuavinosDW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [EcuavinosDW] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [EcuavinosDW] SET  READ_WRITE 
GO


