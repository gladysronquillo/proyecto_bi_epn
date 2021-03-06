USE [master]
GO
/****** Object:  Database [Ecuavinos_Ventas]    Script Date: 1/9/2018 12:12:58 AM ******/
CREATE DATABASE [Ecuavinos_Ventas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ecuavinos_Ventas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecuavinos_Ventas.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ecuavinos_Ventas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Ecuavinos_Ventas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ecuavinos_Ventas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ecuavinos_Ventas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET RECOVERY FULL 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET  MULTI_USER 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ecuavinos_Ventas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ecuavinos_Ventas] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ecuavinos_Ventas', N'ON'
GO
USE [Ecuavinos_Ventas]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[DireccionID] [int] NOT NULL,
	[TipoID] [int] NOT NULL,
	[Nombre] [nvarchar](250) NOT NULL,
	[Identificacion] [nvarchar](50) NOT NULL,
	[Celular] [varchar](15) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[DireccionID] [int] IDENTITY(1,1) NOT NULL,
	[Ciudad] [nvarchar](50) NOT NULL,
	[Pais] [nvarchar](50) NOT NULL,
	[Calles] [nvarchar](50) NOT NULL,
	[N_Casa] [nvarchar](50) NULL,
	[Codigo_Postal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[DireccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GrupoProducto]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GrupoProducto](
	[Grupo_ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_GrupoProducto] [nvarchar](50) NOT NULL,
	[Color_Vino] [varchar](50) NULL,
 CONSTRAINT [PK_GrupoProducto] PRIMARY KEY CLUSTERED 
(
	[Grupo_ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orden_Compra]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden_Compra](
	[Orden_CompraID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NOT NULL,
	[DireccionID] [int] NOT NULL,
	[TiendaID] [int] NOT NULL,
	[Fecha_Compra] [datetime] NOT NULL,
 CONSTRAINT [PK_Orden_Compra] PRIMARY KEY CLUSTERED 
(
	[Orden_CompraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orden_CompraDetalle]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orden_CompraDetalle](
	[Orden_CompraDetalleID] [int] IDENTITY(1,1) NOT NULL,
	[Orden_CompraID] [int] NOT NULL,
	[ProductoID] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio_Unitario] [money] NOT NULL,
	[Precio_Total] [money] NOT NULL,
 CONSTRAINT [PK_Orden_CompraDetalle] PRIMARY KEY CLUSTERED 
(
	[Orden_CompraDetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoID] [varchar](50) NOT NULL,
	[Grupo_ProductoID] [int] NOT NULL,
	[Producto_Descripcion] [varchar](50) NOT NULL,
	[Precio_Unidad] [money] NOT NULL,
	[Anio] [datetime] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[TiendaID] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionTienda] [nvarchar](50) NOT NULL,
	[TipoTienda] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[TiendaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo]    Script Date: 1/9/2018 12:12:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo](
	[TipoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Tipo] [varchar](10) NOT NULL,
	[Es_Mayorista] [bit] NOT NULL CONSTRAINT [DF_Tipo_Es_Mayorista]  DEFAULT ((0)),
 CONSTRAINT [PK_Tipo] PRIMARY KEY CLUSTERED 
(
	[TipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Direccion] FOREIGN KEY([DireccionID])
REFERENCES [dbo].[Direccion] ([DireccionID])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Direccion]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Tipo] FOREIGN KEY([TipoID])
REFERENCES [dbo].[Tipo] ([TipoID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Tipo]
GO
ALTER TABLE [dbo].[Orden_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Compra_Cliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ClienteID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orden_Compra] CHECK CONSTRAINT [FK_Orden_Compra_Cliente]
GO
ALTER TABLE [dbo].[Orden_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Compra_Direccion] FOREIGN KEY([DireccionID])
REFERENCES [dbo].[Direccion] ([DireccionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orden_Compra] CHECK CONSTRAINT [FK_Orden_Compra_Direccion]
GO
ALTER TABLE [dbo].[Orden_Compra]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Compra_Tienda] FOREIGN KEY([TiendaID])
REFERENCES [dbo].[Tienda] ([TiendaID])
GO
ALTER TABLE [dbo].[Orden_Compra] CHECK CONSTRAINT [FK_Orden_Compra_Tienda]
GO
ALTER TABLE [dbo].[Orden_CompraDetalle]  WITH CHECK ADD  CONSTRAINT [FK_Orden_CompraDetalle_Orden_Compra] FOREIGN KEY([Orden_CompraID])
REFERENCES [dbo].[Orden_Compra] ([Orden_CompraID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orden_CompraDetalle] CHECK CONSTRAINT [FK_Orden_CompraDetalle_Orden_Compra]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_GrupoProducto] FOREIGN KEY([Grupo_ProductoID])
REFERENCES [dbo].[GrupoProducto] ([Grupo_ProductoID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_GrupoProducto]
GO
USE [master]
GO
ALTER DATABASE [Ecuavinos_Ventas] SET  READ_WRITE 
GO
