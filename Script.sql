USE [master]
GO
/****** Object:  Database [Yatch Dock]    Script Date: 02.12.2021 11:04:40 ******/
CREATE DATABASE [Yatch Dock]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Yatch Dock].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Yatch Dock] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Yatch Dock] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Yatch Dock] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Yatch Dock] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Yatch Dock] SET ARITHABORT OFF 
GO
ALTER DATABASE [Yatch Dock] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Yatch Dock] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Yatch Dock] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Yatch Dock] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Yatch Dock] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Yatch Dock] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Yatch Dock] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Yatch Dock] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Yatch Dock] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Yatch Dock] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Yatch Dock] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Yatch Dock] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Yatch Dock] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Yatch Dock] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Yatch Dock] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Yatch Dock] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Yatch Dock] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Yatch Dock] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Yatch Dock] SET  MULTI_USER 
GO
ALTER DATABASE [Yatch Dock] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Yatch Dock] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Yatch Dock] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Yatch Dock] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Yatch Dock] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Yatch Dock]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 02.12.2021 11:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[AccessoryId] [int] NOT NULL,
	[AccName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [money] NOT NULL,
	[VAT] [decimal](2, 2) NOT NULL,
	[Inventory] [int] NOT NULL,
	[OrderLevel] [int] NOT NULL,
	[OrderBatch] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[AccessoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatAccessories]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatAccessories](
	[FitId] [int] NOT NULL,
	[AccessoryId] [int] NOT NULL,
	[BoatId] [int] NOT NULL,
 CONSTRAINT [PK_BoatAccessories] PRIMARY KEY CLUSTERED 
(
	[FitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boats]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boats](
	[BoatId] [int] NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[BoatTypeId] [int] NOT NULL,
	[NumberOfRowers] [int] NULL,
	[Mast] [bit] NOT NULL,
	[Colour] [nvarchar](50) NULL,
	[WoodTypeId] [int] NULL,
	[BasePrice] [money] NOT NULL,
	[WAT] [decimal](2, 2) NOT NULL,
 CONSTRAINT [PK_Boats] PRIMARY KEY CLUSTERED 
(
	[BoatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoatType]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoatType](
	[BoatTypeId] [int] NOT NULL,
	[BoatType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_BoatType] PRIMARY KEY CLUSTERED 
(
	[BoatTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[DepositPayed] [money] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ContractTotalPrice] [money] NOT NULL,
	[ContractTotalPriceInclVAT] [money] NOT NULL,
	[ProductionProcessId] [int] NOT NULL,
 CONSTRAINT [PK_Contracts] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[OrganisationName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[IdNumber] [nvarchar](50) NOT NULL,
	[IdDocumentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [int] NOT NULL,
	[ContractId] [int] NOT NULL,
	[Settled] [bit] NOT NULL,
	[Sum] [money] NOT NULL,
	[SumInclVAT] [money] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] NOT NULL,
	[AccessoryId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryCriteria] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[SalespersonId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[BoatId] [int] NOT NULL,
	[DeliveryAddress] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PartnerId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionProcess]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionProcess](
	[ProductionProcessId] [int] NOT NULL,
	[ProductionProcess] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductionProcess] PRIMARY KEY CLUSTERED 
(
	[ProductionProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPersons]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPersons](
	[SalespersonId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[SalespersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WoodType]    Script Date: 02.12.2021 11:04:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WoodType](
	[WoodTypeId] [int] NOT NULL,
	[WoodType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WoodType] PRIMARY KEY CLUSTERED 
(
	[WoodTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Partners] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([PartnerId])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Partners]
GO
ALTER TABLE [dbo].[BoatAccessories]  WITH CHECK ADD  CONSTRAINT [FK_BoatAccessories_Accessories] FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessories] ([AccessoryId])
GO
ALTER TABLE [dbo].[BoatAccessories] CHECK CONSTRAINT [FK_BoatAccessories_Accessories]
GO
ALTER TABLE [dbo].[BoatAccessories]  WITH CHECK ADD  CONSTRAINT [FK_BoatAccessories_Boats] FOREIGN KEY([BoatId])
REFERENCES [dbo].[Boats] ([BoatId])
GO
ALTER TABLE [dbo].[BoatAccessories] CHECK CONSTRAINT [FK_BoatAccessories_Boats]
GO
ALTER TABLE [dbo].[Boats]  WITH CHECK ADD  CONSTRAINT [FK_Boats_BoatType] FOREIGN KEY([BoatTypeId])
REFERENCES [dbo].[BoatType] ([BoatTypeId])
GO
ALTER TABLE [dbo].[Boats] CHECK CONSTRAINT [FK_Boats_BoatType]
GO
ALTER TABLE [dbo].[Boats]  WITH CHECK ADD  CONSTRAINT [FK_Boats_WoodType] FOREIGN KEY([WoodTypeId])
REFERENCES [dbo].[WoodType] ([WoodTypeId])
GO
ALTER TABLE [dbo].[Boats] CHECK CONSTRAINT [FK_Boats_WoodType]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_Orders]
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [FK_Contracts_ProductionProcess] FOREIGN KEY([ProductionProcessId])
REFERENCES [dbo].[ProductionProcess] ([ProductionProcessId])
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [FK_Contracts_ProductionProcess]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Contracts] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contracts] ([ContractId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Contracts]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Accessories] FOREIGN KEY([AccessoryId])
REFERENCES [dbo].[Accessories] ([AccessoryId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Accessories]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Boats] FOREIGN KEY([BoatId])
REFERENCES [dbo].[Boats] ([BoatId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Boats]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Managers] FOREIGN KEY([SalespersonId])
REFERENCES [dbo].[SalesPersons] ([SalespersonId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Managers]
GO
USE [master]
GO
ALTER DATABASE [Yatch Dock] SET  READ_WRITE 
GO
