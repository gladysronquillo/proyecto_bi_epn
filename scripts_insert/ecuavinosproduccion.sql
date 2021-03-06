USE [master]
GO
/****** Object:  Database [Ecuavinos_produccion]    Script Date: 1/9/2018 12:13:22 AM ******/
CREATE DATABASE [Ecuavinos_produccion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ecuavinos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecuavinos.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ecuavinos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecuavinos_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ecuavinos_produccion] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecuavinos_produccion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecuavinos_produccion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecuavinos_produccion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecuavinos_produccion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ecuavinos_produccion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecuavinos_produccion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET RECOVERY FULL 
GO
ALTER DATABASE [Ecuavinos_produccion] SET  MULTI_USER 
GO
ALTER DATABASE [Ecuavinos_produccion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecuavinos_produccion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecuavinos_produccion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecuavinos_produccion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ecuavinos_produccion] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ecuavinos_produccion', N'ON'
GO
USE [Ecuavinos_produccion]
GO
/****** Object:  Schema [produccion]    Script Date: 1/9/2018 12:13:22 AM ******/
CREATE SCHEMA [produccion]
GO
/****** Object:  Table [dbo].[AlmacenProduccion]    Script Date: 1/9/2018 12:13:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlmacenProduccion](
	[AlmacenProduccionID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionAlmacen] [nvarchar](200) NULL,
	[Pais] [nvarchar](200) NULL,
	[Ciudad] [nvarchar](200) NULL,
 CONSTRAINT [PK_AlmacenProduccion] PRIMARY KEY CLUSTERED 
(
	[AlmacenProduccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GrupoProducto]    Script Date: 1/9/2018 12:13:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GrupoProducto](
	[Grupo_ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Producto] [nvarchar](50) NOT NULL,
	[Color_Vino] [varchar](50) NULL,
 CONSTRAINT [PK_GrupoProducto] PRIMARY KEY CLUSTERED 
(
	[Grupo_ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produccion]    Script Date: 1/9/2018 12:13:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produccion](
	[ProduccionID] [int] IDENTITY(1,1) NOT NULL,
	[Codigo_Producto] [int] NOT NULL,
	[AlmacenProduccionID] [int] NOT NULL,
	[Anio_produccion] [datetime] NOT NULL,
	[Volumen_produccion] [int] NOT NULL,
	[Costo] [money] NOT NULL,
 CONSTRAINT [PK_Produccion] PRIMARY KEY CLUSTERED 
(
	[ProduccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 1/9/2018 12:13:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Codigo_Producto] [int] NOT NULL,
	[Grupo_ProductoID] [int] NOT NULL,
	[Descripcion_Producto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[Codigo_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Produccion]  WITH CHECK ADD  CONSTRAINT [FK_Produccion_AlmacenProduccion] FOREIGN KEY([AlmacenProduccionID])
REFERENCES [dbo].[AlmacenProduccion] ([AlmacenProduccionID])
GO
ALTER TABLE [dbo].[Produccion] CHECK CONSTRAINT [FK_Produccion_AlmacenProduccion]
GO
ALTER TABLE [dbo].[Produccion]  WITH CHECK ADD  CONSTRAINT [FK_Produccion_Producto] FOREIGN KEY([Codigo_Producto])
REFERENCES [dbo].[Producto] ([Codigo_Producto])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Produccion] CHECK CONSTRAINT [FK_Produccion_Producto]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_GrupoProducto] FOREIGN KEY([Grupo_ProductoID])
REFERENCES [dbo].[GrupoProducto] ([Grupo_ProductoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_GrupoProducto]
GO
USE [master]
GO
ALTER DATABASE [Ecuavinos_produccion] SET  READ_WRITE 
GO
