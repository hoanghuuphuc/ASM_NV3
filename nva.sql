USE [master]
GO
/****** Object:  Database [NVA3]    Script Date: 8/12/2023 7:54:00 PM ******/
CREATE DATABASE [NVA3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J6Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\J6Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J6Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\J6Store_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [NVA3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NVA3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NVA3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NVA3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NVA3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NVA3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NVA3] SET ARITHABORT OFF 
GO
ALTER DATABASE [NVA3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NVA3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NVA3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NVA3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NVA3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NVA3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NVA3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NVA3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NVA3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NVA3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NVA3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NVA3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NVA3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NVA3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NVA3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NVA3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NVA3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NVA3] SET RECOVERY FULL 
GO
ALTER DATABASE [NVA3] SET  MULTI_USER 
GO
ALTER DATABASE [NVA3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NVA3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NVA3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NVA3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NVA3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NVA3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NVA3', N'ON'
GO
ALTER DATABASE [NVA3] SET QUERY_STORE = ON
GO
ALTER DATABASE [NVA3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [NVA3]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 8/12/2023 7:54:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[activation_token] [nvarchar](max) NULL,
	[reset_token] [nvarchar](max) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authorities]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authorities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[RoleId] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Productid] [int] NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 8/12/2023 7:54:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Photo], [activation_token], [reset_token], [active]) VALUES (N'1@gmail.com', N'123', N'1', N'1', NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Photo], [activation_token], [reset_token], [active]) VALUES (N'12@gmail.com', N'$2a$10$tlaS.gYOyzitBnpadUln0eiFa7fJS2FyV/25rBt8HjqWnpWYZW7Ku', N'1', N'1', NULL, NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Photo], [activation_token], [reset_token], [active]) VALUES (N'123@gmail.com', N'$2a$10$97P7r0oFu753zakeo45th.gzxfmldp42i6FCRIUQNRcIi34qqs96O', N'1', N'1', NULL, NULL, NULL)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Photo], [activation_token], [reset_token], [active]) VALUES (N'admin@gmail.com', N'$2a$10$qWe08Z/SOl4VKjG6Dgtc.ellmbIQrhh6N.wPLMwdilXZ1sM8dThn2', N'1', N'1', NULL, NULL, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Photo], [activation_token], [reset_token], [active]) VALUES (N'huuphuc@gmail.com', N'123', N'hi1', N'hi1', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Authorities] ON 

INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7105, N'huuphuc@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7106, N'huuphuc@gmail.com', N'CUST')
INSERT [dbo].[Authorities] ([Id], [Username], [RoleId]) VALUES (7109, N'huuphuc@gmail.com', N'CUST')
SET IDENTITY_INSERT [dbo].[Authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1000, N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1001, N'Máy tính xách tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1002, N'Máy ảnh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1003, N'Điện thoại')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1004, N'Nước hoa')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1005, N'Nữ trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1006, N'Nón thời trang')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1007, N'Túi xách du lịch')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5000, N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5001, N'Đồng hồ đeo tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5002, N'Đồng hồ đeo tay')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([Id], [Productid], [Color], [Quantity]) VALUES (1, 2, N'xanh', 1)
INSERT [dbo].[ProductColor] ([Id], [Productid], [Color], [Quantity]) VALUES (2, 2, N'đỏ', 2)
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (2, N'Oppo', N'https://res.cloudinary.com/djfbh9dqg/image/upload/v1689747982/Java6/1_yrygqi.png', 500000, CAST(N'2022-12-06' AS Date), 1, 1000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (6, N'Oppo 2', N'https://res.cloudinary.com/djfbh9dqg/image/upload/v1689747982/Java6/1_yrygqi.png', 200000, CAST(N'2022-12-06' AS Date), 1, 1000)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [CategoryId]) VALUES (9, N'demo 3', N'https://res.cloudinary.com/djfbh9dqg/image/upload/v1689747982/Java6/1_yrygqi.png', 10000, CAST(N'2023-08-12' AS Date), 1, 1000)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'STAF', N'Staffs')
GO
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [DF_Customers_Photo]  DEFAULT (N'Photo.gif') FOR [Photo]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Image]  DEFAULT (N'Product.gif') FOR [Image]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ProductDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[Authorities]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Authorities] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK3ess0s7i9qs6sim1pf9kxhkpq]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mật khẩu đăng nhập' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Họ và tên' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Fullname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Accounts', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên tiếng Việt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Categories', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã chi tiết' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'OrderId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'ProductId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá bán' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số lượng mua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OrderDetails', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hóa đơn' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã khách hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Username'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày đặt hàng' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Địa chỉ nhận' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tên hàng hóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình ảnh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đơn giá' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngày sản xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Đang kinh doanh ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Available'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Mã loại, FK' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'CategoryId'
GO
USE [master]
GO
ALTER DATABASE [NVA3] SET  READ_WRITE 
GO
