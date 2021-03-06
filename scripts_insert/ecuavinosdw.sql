USE [master]
GO
/****** Object:  Database [EcuavinosDW]    Script Date: 1/9/2018 12:12:27 AM ******/
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
EXEC sys.sp_db_vardecimal_storage_format N'EcuavinosDW', N'ON'
GO
USE [EcuavinosDW]
GO
/****** Object:  Table [dbo].[DimCliente]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimCliente](
	[clienteID] [int] NOT NULL,
	[direccionID] [int] NOT NULL,
	[tipoID] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DimCliente] PRIMARY KEY CLUSTERED 
(
	[clienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[Date] [datetime] NULL,
	[FullDateUK] [char](10) NULL,
	[FullDateUSA] [char](10) NULL,
	[DayOfMonth] [varchar](2) NULL,
	[DaySuffix] [varchar](4) NULL,
	[DayName] [varchar](9) NULL,
	[DayOfWeekUSA] [char](1) NULL,
	[DayOfWeekUK] [char](1) NULL,
	[DayOfWeekInMonth] [varchar](2) NULL,
	[DayOfWeekInYear] [varchar](2) NULL,
	[DayOfQuarter] [varchar](3) NULL,
	[DayOfYear] [varchar](3) NULL,
	[WeekOfMonth] [varchar](1) NULL,
	[WeekOfQuarter] [varchar](2) NULL,
	[WeekOfYear] [varchar](2) NULL,
	[Month] [varchar](2) NULL,
	[MonthName] [varchar](9) NULL,
	[MonthOfQuarter] [varchar](2) NULL,
	[Quarter] [char](1) NULL,
	[QuarterName] [varchar](9) NULL,
	[Year] [char](4) NULL,
	[YearName] [char](7) NULL,
	[MonthYear] [char](10) NULL,
	[MMYYYY] [char](6) NULL,
	[FirstDayOfMonth] [date] NULL,
	[LastDayOfMonth] [date] NULL,
	[FirstDayOfQuarter] [date] NULL,
	[LastDayOfQuarter] [date] NULL,
	[FirstDayOfYear] [date] NULL,
	[LastDayOfYear] [date] NULL,
	[IsHolidayUSA] [bit] NULL,
	[IsWeekday] [bit] NULL,
	[HolidayUSA] [varchar](50) NULL,
	[IsHolidayUK] [bit] NULL,
	[HolidayUK] [varchar](50) NULL,
	[FiscalDayOfYear] [varchar](3) NULL,
	[FiscalWeekOfYear] [varchar](3) NULL,
	[FiscalMonth] [varchar](2) NULL,
	[FiscalQuarter] [char](1) NULL,
	[FiscalQuarterName] [varchar](9) NULL,
	[FiscalYear] [char](4) NULL,
	[FiscalYearName] [char](7) NULL,
	[FiscalMonthYear] [char](10) NULL,
	[FiscalMMYYYY] [char](6) NULL,
	[FiscalFirstDayOfMonth] [date] NULL,
	[FiscalLastDayOfMonth] [date] NULL,
	[FiscalFirstDayOfQuarter] [date] NULL,
	[FiscalLastDayOfQuarter] [date] NULL,
	[FiscalFirstDayOfYear] [date] NULL,
	[FiscalLastDayOfYear] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DimDireccion]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DimDireccion](
	[direccionID] [int] NOT NULL,
	[pais] [varchar](50) NOT NULL,
	[ciudad] [varchar](50) NOT NULL,
	[Numero_casa] [varchar](50) NOT NULL,
	[calle] [varchar](250) NOT NULL,
	[codigoPostal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DimDireccion] PRIMARY KEY CLUSTERED 
(
	[direccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIMProducto]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIMProducto](
	[productoID] [int] NOT NULL,
	[grupoproductoID] [int] NOT NULL,
	[Descripcion_producto] [varchar](50) NOT NULL,
	[TipoVino] [varchar](50) NOT NULL,
	[Anio] [datetime] NOT NULL,
	[volumen_produccion] [int] NOT NULL,
	[costo] [money] NOT NULL,
 CONSTRAINT [PK_DIMProducto] PRIMARY KEY CLUSTERED 
(
	[productoID] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fact_Orders]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Orders](
	[clienteID] [int] NOT NULL,
	[productoID] [int] NOT NULL,
	[fechaEntrega] [int] NOT NULL,
	[direccionID] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precioUnitario] [money] NOT NULL,
	[precioTotal] [money] NOT NULL,
	[orderCompraID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupo_Producto]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grupo_Producto](
	[grupoProductoID] [int] NOT NULL,
	[NombreGrupo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grupo_Producto] PRIMARY KEY CLUSTERED 
(
	[grupoProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tipo_Cliente]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Cliente](
	[tipoClienteID] [int] NOT NULL,
	[Nombre_Tipo] [varchar](50) NOT NULL,
	[es_Mayorista] [bit] NOT NULL CONSTRAINT [DF_Tipo_Cliente_es_Mayorista]  DEFAULT ((0)),
 CONSTRAINT [PK_Tipo_Cliente] PRIMARY KEY CLUSTERED 
(
	[tipoClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DimCliente]  WITH NOCHECK ADD  CONSTRAINT [FK_DimCliente_DimDireccion] FOREIGN KEY([direccionID])
REFERENCES [dbo].[DimDireccion] ([direccionID])
GO
ALTER TABLE [dbo].[DimCliente] CHECK CONSTRAINT [FK_DimCliente_DimDireccion]
GO
ALTER TABLE [dbo].[DimCliente]  WITH NOCHECK ADD  CONSTRAINT [FK_DimCliente_Tipo_Cliente] FOREIGN KEY([tipoID])
REFERENCES [dbo].[Tipo_Cliente] ([tipoClienteID])
GO
ALTER TABLE [dbo].[DimCliente] CHECK CONSTRAINT [FK_DimCliente_Tipo_Cliente]
GO
ALTER TABLE [dbo].[DIMProducto]  WITH NOCHECK ADD  CONSTRAINT [FK_DIMProducto_Grupo_Producto] FOREIGN KEY([grupoproductoID])
REFERENCES [dbo].[Grupo_Producto] ([grupoProductoID])
GO
ALTER TABLE [dbo].[DIMProducto] CHECK CONSTRAINT [FK_DIMProducto_Grupo_Producto]
GO
ALTER TABLE [dbo].[Fact_Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Orders_DimCliente] FOREIGN KEY([clienteID])
REFERENCES [dbo].[DimCliente] ([clienteID])
GO
ALTER TABLE [dbo].[Fact_Orders] CHECK CONSTRAINT [FK_Fact_Orders_DimCliente]
GO
ALTER TABLE [dbo].[Fact_Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Orders_DimDate] FOREIGN KEY([fechaEntrega])
REFERENCES [dbo].[DimDate] ([DateKey])
GO
ALTER TABLE [dbo].[Fact_Orders] CHECK CONSTRAINT [FK_Fact_Orders_DimDate]
GO
ALTER TABLE [dbo].[Fact_Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Fact_Orders_DimDireccion] FOREIGN KEY([direccionID])
REFERENCES [dbo].[DimDireccion] ([direccionID])
GO
ALTER TABLE [dbo].[Fact_Orders] CHECK CONSTRAINT [FK_Fact_Orders_DimDireccion]
GO
/****** Object:  StoredProcedure [dbo].[FillDimTime]    Script Date: 1/9/2018 12:12:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FillDimTime]
as
BEGIN

--Specify Total Number of Hours You need to fill in Time Dimension
DECLARE @Size INTEGER
--iF @Size=32 THEN This will Fill values Upto 32:59 hr in Time Dimension 
Set @Size=23

DECLARE @hour INTEGER
DECLARE @minute INTEGER
DECLARE @second INTEGER
DECLARE @k INTEGER
DECLARE @TimeAltKey INTEGER
DECLARE @TimeInSeconds INTEGER
DECLARE @Time30 varchar(25)
DECLARE @Hour30 varchar(4)
DECLARE @Minute30 varchar(4)
DECLARE @Second30 varchar(4)
DECLARE @HourBucket varchar(15)
DECLARE @HourBucketGroupKey int
DECLARE @DayTimeBucket varchar(100)
DECLARE @DayTimeBucketGroupKey int

SET @hour = 0
SET @minute = 0
SET @second  = 0
SET @k  = 0
SET @TimeAltKey  = 0

WHILE(@hour<= @Size ) 
BEGIN
	
	if (@hour <10 )
		 begin
		 set @Hour30 = '0' + cast( @hour as varchar(10))
		 end
	else
		 begin
		 set @Hour30 = @hour 
		 end
	--Create Hour Bucket Value	 
	set @HourBucket= @Hour30+':00' +'-' +@Hour30+':59' 
	
	
	WHILE(@minute <= 59) 
	BEGIN
		WHILE(@second  <= 59)
		 BEGIN	
	 
		 set @TimeAltKey = @hour *10000 +@minute*100 +@second 
		 set @TimeInSeconds =@hour * 3600 + @minute *60 +@second 
		
		 If @minute  <10 
		   begin
		   set @Minute30  = '0' + cast ( @minute as varchar(10) )
		   end
		 else
		   begin
		   set @Minute30  = @minute 
		   end
		 
		 if @second   <10 
		   begin
		   set @Second30   = '0' + cast ( @second as varchar(10) )
		   end
		 else
		   begin
		   set @Second30  = @second 
		   end
	--Concatenate values for Time30	 
	set @Time30 = @Hour30 +':'+@Minute30 +':'+@Second30 
		 
    --DayTimeBucketGroupKey can be used in Sorting of DayTime Bucket In proper Order
    SELECT @DayTimeBucketGroupKey =
        CASE
			 WHEN (@TimeAltKey >= 00000 AND  @TimeAltKey <= 25959) THEN 0 
			 WHEN (@TimeAltKey >= 30000 AND  @TimeAltKey <= 65959) THEN 1 
             WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959)  THEN 2
             WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) THEN 3
             WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959)THEN 4
             WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)THEN 5
             WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959) THEN 6 
             WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)THEN 7 
             WHEN (@TimeAltKey >= 240000) THEN  8
        END              
     --print @DayTimeBucketGroupKey
	-- DayTimeBucket Time Divided in Spcific Time Zone So Data can Be Grouped as per Bucket for Analyzing as per time of day
    SELECT @DayTimeBucket =
        CASE 
             WHEN (@TimeAltKey >= 00000 AND  @TimeAltKey <= 25959) THEN  'Late Night (00:00 AM To 02:59 AM)' 
             WHEN (@TimeAltKey >= 30000 AND  @TimeAltKey <= 65959) THEN  'Early Morning(03:00 AM To 6:59 AM)' 
             WHEN (@TimeAltKey >= 70000 AND @TimeAltKey <= 85959) THEN   'AM Peak (7:00 AM To 8:59 AM)'
             WHEN (@TimeAltKey >= 90000 AND @TimeAltKey <= 115959) THEN  'Mid Morning (9:00 AM To 11:59 AM)' 
             WHEN (@TimeAltKey >= 120000 AND @TimeAltKey <= 135959) THEN 'Lunch (12:00 PM To 13:59 PM)'
             WHEN (@TimeAltKey >= 140000 AND @TimeAltKey <= 155959)THEN  'Mid Afternoon (14:00 PM To 15:59 PM)'
             WHEN (@TimeAltKey >= 50000 AND @TimeAltKey <= 175959)THEN   'PM Peak (16:00 PM To 17:59 PM)' 
             WHEN (@TimeAltKey >= 180000 AND @TimeAltKey <= 235959)THEN  'Evening (18:00 PM To 23:59 PM)' 
             WHEN (@TimeAltKey >= 240000) THEN                           'Previous Day Late Night (24:00 PM to '+cast( @Size as varchar(10))  +':00 PM )'
         END 
      --    print   @DayTimeBucket    
	  
	    INSERT into  DimTime (TimeKey,TimeAltKey,[Time30] ,[Hour30] ,[MinuteNumber],[SecondNumber],[TimeInSecond],[HourlyBucket],DayTimeBucketGroupKey,DayTimeBucket) 
	    VALUES (@k,@TimeAltKey ,@Time30 ,@hour ,@minute,@Second , @TimeInSeconds,@HourBucket,@DayTimeBucketGroupKey,@DayTimeBucket )
	    
	    SET @second  = @second + 1		
	    SET @k = @k  + 1	
	END
		SET @minute = @minute + 1		
		SET @second = 0		
	END
	
	    SET @hour = @hour + 1
	    SET @minute =0
    END

END



GO
USE [master]
GO
ALTER DATABASE [EcuavinosDW] SET  READ_WRITE 
GO
