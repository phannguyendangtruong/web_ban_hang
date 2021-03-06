USE [master]
GO
/****** Object:  Database [Truong_Java5]    Script Date: 6/18/2022 3:50:05 PM ******/
CREATE DATABASE [Truong_Java5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Truong_Java5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Truong_Java5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Truong_Java5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Truong_Java5_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Truong_Java5] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Truong_Java5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Truong_Java5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Truong_Java5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Truong_Java5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Truong_Java5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Truong_Java5] SET ARITHABORT OFF 
GO
ALTER DATABASE [Truong_Java5] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Truong_Java5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Truong_Java5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Truong_Java5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Truong_Java5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Truong_Java5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Truong_Java5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Truong_Java5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Truong_Java5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Truong_Java5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Truong_Java5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Truong_Java5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Truong_Java5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Truong_Java5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Truong_Java5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Truong_Java5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Truong_Java5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Truong_Java5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Truong_Java5] SET  MULTI_USER 
GO
ALTER DATABASE [Truong_Java5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Truong_Java5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Truong_Java5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Truong_Java5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Truong_Java5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Truong_Java5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Truong_Java5] SET QUERY_STORE = OFF
GO
USE [Truong_Java5]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[billId] [int] IDENTITY(1,1) NOT NULL,
	[usernameCustomer] [varchar](20) NULL,
	[fullname] [nvarchar](30) NULL,
	[address] [nvarchar](100) NULL,
	[totalprice] [int] NULL,
	[billDate] [date] NULL,
	[staffusername] [varchar](20) NULL,
	[isDeleted] [bit] NULL,
	[Confirm] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[billDetails]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billDetails](
	[billdetailsId] [int] IDENTITY(1,1) NOT NULL,
	[billId] [int] NULL,
	[productId] [int] NULL,
	[quantity] [int] NULL,
	[brandid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[billdetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brand]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brand](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[cmt_date] [datetime] NULL,
	[content] [varchar](255) NULL,
	[is_deleted] [bit] NOT NULL,
	[customerid] [varchar](255) NULL,
	[product_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[username] [varchar](20) NOT NULL,
	[customerName] [nvarchar](30) NULL,
	[password] [varchar](20) NULL,
	[birthday] [date] NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](12) NULL,
	[address] [nvarchar](100) NULL,
	[gender] [bit] NULL,
	[image] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](300) NULL,
	[price] [float] NOT NULL,
	[dateSubmited] [date] NOT NULL,
	[quantity] [int] NOT NULL,
	[previousImg] [nvarchar](100) NOT NULL,
	[backSidePhoto] [nvarchar](100) NOT NULL,
	[brandId] [int] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotionalCode]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotionalCode](
	[promotionalCodeId] [int] IDENTITY(1,1) NOT NULL,
	[promotionalCodeDate] [date] NULL,
	[percentageReduction] [int] NULL,
	[code] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[promotionalCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 6/18/2022 3:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[username] [varchar](20) NOT NULL,
	[fullname] [nvarchar](30) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[birthday] [date] NOT NULL,
	[gender] [bit] NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[admin] [bit] NULL,
	[isDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (1, N'tien', N'Duy Tiến', N'364 Dương Quảng Hàm quận Gò Vấp', 1300, CAST(N'2022-06-09' AS Date), N'truongpnd', 0, 1)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (2, N'tien', N'Duy Tiến', N'364 Dương Quảng Hàm quận Gò Vấp', 1340, CAST(N'2022-06-09' AS Date), N'truongpnd', 0, 1)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (3, N'tien', N'Duy Tiến', N'364 Dương Quảng Hàm quận Gò Vấp', 1680, CAST(N'2022-06-09' AS Date), N'truongpnd', 0, 1)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (4, N'tien', N'Duy Tiến', N'364 Dương Quảng Hàm quận Gò Vấp', 2610, CAST(N'2022-06-09' AS Date), N'truongpnd', 0, 0)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (5, N'tien', N'Duy Tiến', N'364 Dương Quảng Hàm quận Gò Vấp', 715, CAST(N'2022-06-09' AS Date), N'truongpnd', 0, 0)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (6, N'ndc', N'Phan Nguyễn Đăng Trường', N'364 Dương Quảng Hàm quận Gò Vấp', 900, CAST(N'2022-06-09' AS Date), NULL, 0, 0)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (7, N'tien', N'Phan Nguyễn Đăng Trường', N'364 Dương Quảng Hàm quận Gò Vấp', 240, CAST(N'2022-06-09' AS Date), NULL, 0, 0)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (12, N'tien', N'Phan Nguyễn Đăng Trường', N'364 Dương Quảng Hàm quận Gò Vấp', 325, CAST(N'2022-06-15' AS Date), NULL, 0, 0)
INSERT [dbo].[bill] ([billId], [usernameCustomer], [fullname], [address], [totalprice], [billDate], [staffusername], [isDeleted], [Confirm]) VALUES (13, N'tien', N'Phan Nguyễn Đăng Trường', N'364 Dương Quảng Hàm quận Gò Vấp', 1260, CAST(N'2022-06-17' AS Date), NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[billDetails] ON 

INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (45, 1, 18, 1, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (46, 1, 13, 3, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (47, 2, 21, 3, 2)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (48, 2, 24, 1, 2)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (49, 3, 38, 4, 3)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (50, 4, 24, 3, 2)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (51, 5, 17, 1, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (52, 5, 14, 1, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (53, 6, 14, 3, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (54, 7, 20, 1, 2)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (59, 12, 12, 1, 1)
INSERT [dbo].[billDetails] ([billdetailsId], [billId], [productId], [quantity], [brandid]) VALUES (60, 13, 38, 3, 3)
SET IDENTITY_INSERT [dbo].[billDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[brand] ON 

INSERT [dbo].[brand] ([brandId], [brandName]) VALUES (1, N'SWE')
INSERT [dbo].[brand] ([brandId], [brandName]) VALUES (2, N'Degrey')
INSERT [dbo].[brand] ([brandId], [brandName]) VALUES (3, N'Hades')
SET IDENTITY_INSERT [dbo].[brand] OFF
GO
INSERT [dbo].[customer] ([username], [customerName], [password], [birthday], [email], [phone], [address], [gender], [image]) VALUES (N'ndc', N'Nguyễn Lê Duy ', N'123', CAST(N'2016-05-15' AS Date), N'pndangtruong@gmail.com', N'0939195150', N'364 Dương Quảng Hàm quận Gò Vấp', 0, NULL)
INSERT [dbo].[customer] ([username], [customerName], [password], [birthday], [email], [phone], [address], [gender], [image]) VALUES (N'poly', N'Phan Nguyễn Đăng Trường', N'123', CAST(N'2021-09-14' AS Date), N'qwe@gmail.com', N'12312313', N'364 Dương Quảng Hàm quận Gò Vấp', 1, NULL)
INSERT [dbo].[customer] ([username], [customerName], [password], [birthday], [email], [phone], [address], [gender], [image]) VALUES (N'tien', N'Nguyễn Lê Duy Tiến', N'123', CAST(N'2002-01-04' AS Date), N'truongpndps16501@fpt.edu.vn', N'0939195152', N'364 Dương Quảng Hàm F13 quận Gò Vấp', 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (11, N'INTL TEE - PINK', N'100% cottonForm Châu ÂuSWE signature được in trên áo....
', 375, CAST(N'2022-05-23' AS Date), 100, N'tee-pink-truoc.jpg', N'tee-pink-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (12, N'INTL TEE - BLACK', N'100% cottonForm Châu ÂuSWE signature được in sau lưng áo....
', 325, CAST(N'2022-05-23' AS Date), 100, N'tee-black-truoc.jpg', N'tee-black-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (13, N'CUBE SMOKE TEE - BLACK', N'Mẫu nữ - 165cm/48kg - mặc size M Mẫu nam - 177cm/63kg - mặc size XL...
', 355, CAST(N'2022-05-23' AS Date), 100, N'cubesmoketee-black-truoc.jpg', N'cubesmoketee-black-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (14, N'CUBE COACH JACKET - BLACK', N'Áo khoác dù 2 lớp, dày dặnNút đen bấm chắc chắnForm Châu ÂuLogo SWE được in trước và sau lưng áo....', 375, CAST(N'2022-05-23' AS Date), 200, N'CUBECOACHJACKET-BLACK-truoc.jpg', N'CUBECOACHJACKET-black-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (15, N'CUBE SMOKE TEE - WHITE', N'Mẫu nữ - 165cm/48kg - mặc size M Mẫu nam - 177cm/63kg - mặc size XL...
', 355, CAST(N'2022-05-23' AS Date), 100, N'CUBESMOKETEE-WHITE-truoc.jpg', N'CUBESMOKETEE-WHITE-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (16, N'THUNDER TEE - BLACK', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....
', 355, CAST(N'2022-05-23' AS Date), 100, N'THUNDERTEE-BLACK-truoc.jpg', N'THUNDERTEE-BLACK-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (17, N'90S TEE - BLACK', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 340, CAST(N'2022-05-23' AS Date), 100, N'90STEE-BLACK-truoc.jpg', N'90STEE-BLACK-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (18, N'SMOKE JACKET', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 560, CAST(N'2022-05-23' AS Date), 100, N'SMOKEJACKET-truoc.jpg', N'SMOKEJACKET-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (19, N'THERMAL TEE - DARK GREY', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 355, CAST(N'2022-05-23' AS Date), 140, N'thermal-tee-dark-truoc.jpg', N'thermal-tee-dark-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (20, N'RINGER TEE - PINK
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 300, CAST(N'2022-05-23' AS Date), 100, N'ringer-tee-pink-truoc.jpg', N'ringer-tee-pink-sau.jpg', 1, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (21, N'Áo Polo Mono Degrey Trắng - APMD Trắng', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 350, CAST(N'2022-06-03' AS Date), 120, N'polo-mono-degrey-trang-truoc.jpg', N'polo-mono-degrey-trang-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (22, N'Áo Túi Logo Trắng - ATLG Trắng', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 240, CAST(N'2022-06-03' AS Date), 120, N'ao-tui-logo-trang-truoc.jpg', N'ao-tui-logo-trang-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (23, N'Áo Túi Logo Rêu - ATLG Rêu', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 240, CAST(N'2022-06-03' AS Date), 130, N'ao-tui-logo-reu-truoc.jpg', N'ao-tui-logo-reu-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (24, N'Áo Polo Sọc Degrey - APSD', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 290, CAST(N'2022-06-03' AS Date), 200, N'ao-polo-soc-degrey-truoc.jpg', N'ao-polo-soc-degrey-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (25, N'Áo Tiên Tri Vũ Trụ Xoài - TTVT', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 240, CAST(N'2022-06-03' AS Date), 120, N'ao-ttvt-xoai-truoc.jpg', N'ao-ttvt-xoai-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (26, N'Áo Túi Logo Be - ATLG Be', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 240, CAST(N'2022-06-03' AS Date), 120, N'ao-tui-logo-be-truoc.jpg', N'ao-tui-logo-be-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (27, N'Hoodie Xoài Nhí Nhố - HNN', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 390, CAST(N'2022-06-03' AS Date), 100, N'hoodie-xoai-nhi-nho-truoc.jpg', N'hoodie-xoai-nhi-nho-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (28, N'Sweater Degrey Basic - SDB', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 380, CAST(N'2022-06-03' AS Date), 100, N'sweater-degrey-basic-truoc.jpg', N'sweater-degrey-basic-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (29, N'Degrey Premium Leather Jacket Đen - DPLJ Đen', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 720, CAST(N'2022-06-03' AS Date), 100, N'degrey-premium-truoc.jpg', N'degrey-premium-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (30, N'Hoodie Degrey Basic Xanh - HDB Xanh', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 420, CAST(N'2022-06-03' AS Date), 100, N'hoodie-degrey-xanh-truoc.jpg', N'hoodie-degrey-xanh-sau.jpg', 2, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (31, N'REVOLUTION TEE', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 420, CAST(N'2022-06-03' AS Date), 100, N'revolution-tee-truoc.jpg', N'revolution-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (32, N'PEACE AND LOVE TEE', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 420, CAST(N'2022-06-03' AS Date), 100, N'peace-and-love-tee-truoc.jpg', N'peace-and-love-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (34, N'PREMIER TEE
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 380, CAST(N'2022-06-03' AS Date), 100, N'premier-tee-truoc.jpg', N'premier-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (35, N'T-REX TEE', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 390, CAST(N'2022-06-03' AS Date), 120, N't-rex-tee-truoc.jpg', N't-rex-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (36, N'HADES TYPICAL TEE
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 380, CAST(N'2022-06-03' AS Date), 120, N'hades-typical-tee-truoc.jpg', N'hades-typical-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (37, N'AFTERGLOW TEE
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 420, CAST(N'2022-06-03' AS Date), 120, N'afterglow-tee-truoc.jpg', N'afterglow-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (38, N'WILD DRIVING TEE
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 420, CAST(N'2022-06-03' AS Date), 130, N'wild-driving-tee-truoc.jpg', N'wild-driving-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (39, N'DESTRUCTION TEE
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 380, CAST(N'2022-06-03' AS Date), 130, N'destruction-tee-truoc.jpg', N'destruction-tee-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (41, N'CHESS POLO
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 450, CAST(N'2022-06-03' AS Date), 150, N'chess-polo-truoc.jpg', N'chess-polo-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (42, N'GAMBLING SHIRT
', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 450, CAST(N'2022-06-03' AS Date), 150, N'gambling-shirt-truoc.jpg', N'gambling-shirt-sau.jpg', 3, 0)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (47, N'qweqwe', N'qweqwe', 1, CAST(N'2022-06-09' AS Date), 1, N'c2eb01f83b0afb54a21b.jpg', N'c2eb01f83b0afb54a21b.jpg', NULL, 1)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (48, N'Dang truong', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 11, CAST(N'2022-06-09' AS Date), 11, N'c2eb01f83b0afb54a21b.jpg', N'123232112332.jpg', NULL, 1)
INSERT [dbo].[product] ([productId], [productName], [description], [price], [dateSubmited], [quantity], [previousImg], [backSidePhoto], [brandId], [isDeleted]) VALUES (49, N'Dang truong', N'Form áo Châu Âu.Định lượng : 220 gsm.100% cotton.Sản phẩm được in lụa.Tag logo được gắn ở tay áo.Tem chống hàng giả của SWE được may trong sườn áo.Các bạn vui lòng tham khảo bảng size chart trước khi đặt hàng....', 111, CAST(N'2022-06-09' AS Date), 111, N'123232112332.jpg', N'123232112332.jpg', NULL, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[promotionalCode] ON 

INSERT [dbo].[promotionalCode] ([promotionalCodeId], [promotionalCodeDate], [percentageReduction], [code]) VALUES (1, CAST(N'2022-05-30' AS Date), 30, N'CMSN')
INSERT [dbo].[promotionalCode] ([promotionalCodeId], [promotionalCodeDate], [percentageReduction], [code]) VALUES (2, CAST(N'2022-06-30' AS Date), 20, N'GIAMGIA')
SET IDENTITY_INSERT [dbo].[promotionalCode] OFF
GO
INSERT [dbo].[staff] ([username], [fullname], [password], [birthday], [gender], [phone], [email], [address], [admin], [isDeleted]) VALUES (N'aa', N'aa', N'aa', CAST(N'2022-06-02' AS Date), 1, N'31232312323', N'truongpnd@gmail.com', N'364 Dương Quảng Hàm quận Gò Vấp', 1, 0)
INSERT [dbo].[staff] ([username], [fullname], [password], [birthday], [gender], [phone], [email], [address], [admin], [isDeleted]) VALUES (N'tiennld', N'Nguyễn Lê Duy Tiến', N'1234', CAST(N'2002-01-08' AS Date), 0, N'093919123', N'tiennld@gmail.com', N'123 Tô Ký phường Trung Mỹ Tây, quận 12', 0, 0)
INSERT [dbo].[staff] ([username], [fullname], [password], [birthday], [gender], [phone], [email], [address], [admin], [isDeleted]) VALUES (N'truongpnd', N'Phan Nguyễn Đăng Trường', N'123', CAST(N'2002-08-08' AS Date), 0, N'0939195150', N'pndangtruong@gmail.com', N'1072 Lê Đức Thọ, F13, quận Gò Vấp', 0, 0)
GO
/****** Object:  Index [UKn4wtjt3fmahgaw6w6741dn20t]    Script Date: 6/18/2022 3:50:05 PM ******/
ALTER TABLE [dbo].[billDetails] ADD  CONSTRAINT [UKn4wtjt3fmahgaw6w6741dn20t] UNIQUE NONCLUSTERED 
(
	[billId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[bill] ADD  DEFAULT ((0)) FOR [Confirm]
GO
ALTER TABLE [dbo].[product] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[staff] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [fk_bill_customer] FOREIGN KEY([usernameCustomer])
REFERENCES [dbo].[customer] ([username])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [fk_bill_customer]
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD  CONSTRAINT [fk_bill_staff] FOREIGN KEY([staffusername])
REFERENCES [dbo].[staff] ([username])
GO
ALTER TABLE [dbo].[bill] CHECK CONSTRAINT [fk_bill_staff]
GO
ALTER TABLE [dbo].[billDetails]  WITH CHECK ADD  CONSTRAINT [fk_billdetails_brand] FOREIGN KEY([brandid])
REFERENCES [dbo].[brand] ([brandId])
GO
ALTER TABLE [dbo].[billDetails] CHECK CONSTRAINT [fk_billdetails_brand]
GO
ALTER TABLE [dbo].[billDetails]  WITH CHECK ADD  CONSTRAINT [fk_billDetails_product] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[billDetails] CHECK CONSTRAINT [fk_billDetails_product]
GO
ALTER TABLE [dbo].[billDetails]  WITH CHECK ADD  CONSTRAINT [FKewbv0yo74ys6g1qxwogi4wk40] FOREIGN KEY([billId])
REFERENCES [dbo].[bill] ([billId])
GO
ALTER TABLE [dbo].[billDetails] CHECK CONSTRAINT [FKewbv0yo74ys6g1qxwogi4wk40]
GO
ALTER TABLE [dbo].[billDetails]  WITH CHECK ADD  CONSTRAINT [FKpbvchrxg26q7b3chmnmydd7hf] FOREIGN KEY([productId])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[billDetails] CHECK CONSTRAINT [FKpbvchrxg26q7b3chmnmydd7hf]
GO
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FKm1rmnfcvq5mk26li4lit88pc5] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([productId])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FKm1rmnfcvq5mk26li4lit88pc5]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_product_brand] FOREIGN KEY([brandId])
REFERENCES [dbo].[brand] ([brandId])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_product_brand]
GO
USE [master]
GO
ALTER DATABASE [Truong_Java5] SET  READ_WRITE 
GO
