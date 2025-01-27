/****** Object:  Database [SoXoTuChon_BenTre]    Script Date: 09/11/2023 12:15:36 CH ******/
CREATE DATABASE [SoXoTuChon_BenTre]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SoXoTuChon_BenTre', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SoXoTuChon_BenTre.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SoXoTuChon_BenTre_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SoXoTuChon_BenTre_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SoXoTuChon_BenTre].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ARITHABORT OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET  MULTI_USER 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SoXoTuChon_BenTre] SET QUERY_STORE = OFF
GO
/****** Object:  Table [dbo].[Dai]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dai](
	[IDDai] [int] IDENTITY(1,1) NOT NULL,
	[MaDai] [nchar](10) NULL,
	[TenDai] [nvarchar](max) NULL,
 CONSTRAINT [PK_Dai] PRIMARY KEY CLUSTERED 
(
	[IDDai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[IDGame] [int] IDENTITY(1,1) NOT NULL,
	[NgayChoi] [int] NULL,
	[MaDai] [nchar](10) NULL,
	[Lo] [nchar](10) NULL,
	[So] [nchar](10) NULL,
	[SoTien] [float] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[XacNhan] [bit] NULL,
	[ThoiGianDat] [nchar](10) NULL,
	[Loai] [int] NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[IDGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] IDENTITY(1,1) NOT NULL,
	[LevelCode] [nchar](10) NULL,
	[LevelName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lo]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lo](
	[IDLo] [int] IDENTITY(1,1) NOT NULL,
	[MaLo] [nchar](10) NULL,
	[TenLo] [nvarchar](50) NULL,
	[Loai] [int] NULL,
 CONSTRAINT [PK_Lo] PRIMARY KEY CLUSTERED 
(
	[IDLo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_title] [nvarchar](max) NULL,
	[menu_description] [nvarchar](max) NULL,
	[menu_url] [nvarchar](max) NULL,
	[menu_valuepath] [text] NULL,
	[menu_parent_id] [int] NULL,
	[menu_order] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NapTien]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NapTien](
	[IDNap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNap] [int] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[SoTien] [float] NULL,
	[NganHang] [nvarchar](max) NULL,
	[XacNhan] [bit] NULL,
	[NguoiXacNhan] [nvarchar](50) NULL,
	[NgayXacNhan] [int] NULL,
	[HinhDinhKem] [nvarchar](max) NULL,
	[LyDo] [nvarchar](max) NULL,
 CONSTRAINT [PK_NapTien] PRIMARY KEY CLUSTERED 
(
	[IDNap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[AuthorDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[menu_id] [int] NULL,
	[them] [bit] NULL,
	[sua] [bit] NULL,
	[xoa] [bit] NULL,
	[inan] [bit] NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[AuthorDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDuThuong]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDuThuong](
	[IDPhieuDuThuong] [int] IDENTITY(1,1) NOT NULL,
	[IDGame] [int] NULL,
	[NgayXuat] [int] NULL,
	[SoPhieu] [nvarchar](50) NULL,
	[SoDuThuong] [nvarchar](50) NULL,
	[KetQua] [nvarchar](50) NULL,
	[So] [nchar](10) NULL,
	[Lo] [nchar](10) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NguoiXuat] [nvarchar](50) NULL,
	[Loai] [int] NULL,
 CONSTRAINT [PK_PhieuDuThuong] PRIMARY KEY CLUSTERED 
(
	[IDPhieuDuThuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RutTien]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RutTien](
	[IDRut] [int] IDENTITY(1,1) NOT NULL,
	[NgayRut] [int] NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[SoTien] [float] NULL,
	[NganHang] [nvarchar](max) NULL,
	[XacNhan] [bit] NULL,
	[NguoiXacNhan] [nvarchar](50) NULL,
	[NgayXacNhan] [int] NULL,
	[HinhDinhKem] [nchar](10) NULL,
	[LyDo] [nvarchar](max) NULL,
 CONSTRAINT [PK_RutTien] PRIMARY KEY CLUSTERED 
(
	[IDRut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanHeThong]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanHeThong](
	[IDTaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[LevelCode] [nchar](10) NULL,
	[LaQuanLy] [bit] NULL,
	[MaDaiLy] [nvarchar](50) NULL,
	[HoTen] [nvarchar](max) NULL,
	[ChietKhau] [nvarchar](50) NULL,
	[SoDienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoTaiKhoan] [nvarchar](50) NULL,
	[NganHang] [nvarchar](max) NULL,
	[KichHoat] [bit] NULL,
	[ViTien] [float] NULL,
	[NgayDangKy] [datetime] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[IDTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraThuong]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraThuong](
	[IDTraThuong] [int] IDENTITY(1,1) NOT NULL,
	[NgayTraThuong] [int] NULL,
	[IDPhieuDuThuong] [int] NULL,
	[SoPhieu] [nvarchar](50) NULL,
	[SoDuThuong] [nvarchar](50) NULL,
	[So] [nchar](10) NULL,
	[Lo] [nchar](10) NULL,
	[NguoiTra] [nvarchar](50) NULL,
 CONSTRAINT [PK_TraThuong] PRIMARY KEY CLUSTERED 
(
	[IDTraThuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dai] ON 

INSERT [dbo].[Dai] ([IDDai], [MaDai], [TenDai]) VALUES (1, N'BT        ', N'Bến Tre')
SET IDENTITY_INSERT [dbo].[Dai] OFF
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (17, 45141, N'BT        ', N'4L        ', N'7777      ', 500000, N'admin', 0, N'06:48:27  ', 4)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (18, 45142, N'BT        ', N'Đ/X       ', N'22        ', 100000, N'admin', 0, N'08:23:31  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (19, 45145, N'BT        ', N'Đ/X       ', N'17        ', 50000, N'admin', 1, N'10:22:02  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (20, 45147, N'BT        ', N'Đ/X       ', N'07        ', 50000, N'admin', 0, N'18:14:40  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (25, 45219, N'BT        ', N'Đ/X       ', N'00        ', 10000, N'', 1, N'22:54:56  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (26, 45218, N'BT        ', N'Đ/X       ', N'00        ', 10000, N'', 0, N'15:26:43  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (27, 45218, N'BT        ', N'17L       ', N'223       ', 50000, N'', 1, N'15:37:38  ', 3)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (28, 45231, N'BT        ', N'4L        ', N'3456      ', 10000, N'', 1, N'21:14:51  ', 4)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (29, 45231, N'BT        ', N'4L        ', N'5567      ', 20000, N'', 1, N'21:14:52  ', 4)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (30, 45231, N'BT        ', N'4L        ', N'3334      ', 20000, N'', 1, N'21:14:52  ', 4)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (31, 45231, N'BT        ', N'Đ/X       ', N'111       ', 10000, N'', 1, N'21:20:35  ', 3)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (32, 45231, N'BT        ', N'Đ/X       ', N'123       ', 20000, N'', 1, N'21:54:05  ', 3)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (33, 45231, N'BT        ', N'Đ/X       ', N'456       ', 50000, N'', 1, N'21:54:05  ', 3)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (34, 45233, N'BT        ', N'Đ/X       ', N'07        ', 10000, N'', 1, N'21:24:55  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (35, 45233, N'BT        ', N'Đ/X       ', N'334       ', 10000, N'', 0, N'21:26:58  ', 3)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (36, 45236, N'BT        ', N'Đ/X       ', N'11        ', 50000, N'', 0, N'21:34:27  ', 2)
INSERT [dbo].[Games] ([IDGame], [NgayChoi], [MaDai], [Lo], [So], [SoTien], [TaiKhoan], [XacNhan], [ThoiGianDat], [Loai]) VALUES (37, 45236, N'BT        ', N'Đ/X       ', N'345       ', 100000, N'', 0, N'23:18:07  ', 3)
SET IDENTITY_INSERT [dbo].[Games] OFF
GO
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([LevelID], [LevelCode], [LevelName]) VALUES (2, N'01        ', N'admin')
INSERT [dbo].[Level] ([LevelID], [LevelCode], [LevelName]) VALUES (4, N'02        ', N'Dai ly')
INSERT [dbo].[Level] ([LevelID], [LevelCode], [LevelName]) VALUES (5, N'03        ', N'user')
SET IDENTITY_INSERT [dbo].[Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Lo] ON 

INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (1, N'Đ         ', N'Đầu', 2)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (2, N'X/C       ', N'Cuối', 2)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (3, N'Đ/C       ', N'Đầu-Cuối', 2)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (4, N'18L       ', N'18 Lô', 2)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (5, N'Đ/X       ', N'Đầu', 3)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (6, N'X/C       ', N'Cuối', 3)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (7, N'Đ/C       ', N'Đầu-Cuối', 3)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (8, N'7L        ', N'7 Lô', 3)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (9, N'17L       ', N'17 Lô', 3)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (10, N'4L        ', N'4 Lô', 4)
INSERT [dbo].[Lo] ([IDLo], [MaLo], [TenLo], [Loai]) VALUES (11, N'16L       ', N'16 Lô', 4)
SET IDENTITY_INSERT [dbo].[Lo] OFF
GO
SET IDENTITY_INSERT [dbo].[NapTien] ON 

INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (2, 45140, N'admin', 100000, NULL, 1, N'admin', 45140, NULL, N'Huỷ mua số 313        - Lô 7L         - Loại 3 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (3, 45140, N'admin', 200000, NULL, 1, N'admin', 45140, NULL, N'Huỷ mua số 111        - Lô X/C        - Loại 3 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (5, 45140, N'admin', 10000, NULL, 1, N'test', 45207, NULL, N'Nạp tiền vào ví')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (6, 45158, N'admin', 50000, NULL, 1, N'', 45158, NULL, N'Huỷ mua số 43         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (7, 45158, N'admin', 50000, NULL, 1, N'', 45158, NULL, N'Huỷ mua số 10         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (8, 45159, N'admin', 50000, NULL, 1, N'Admin', 45159, NULL, N'Huỷ mua số 43         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (9, 45160, N'Admin', 20000, NULL, 1, N'Admin', 45160, NULL, N'Huỷ mua số 00         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (11, 45170, N'admin', 5000000, NULL, 1, N'admin', 45217, NULL, N'Nạp tiền vào ví')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (13, 45218, N'Test1', 100000, NULL, 1, N'Test1', 45218, NULL, N'Nạp tiền vào ví')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (14, 45231, N'0909999999', 50000, NULL, 1, N'admin', 45231, NULL, N'Nạp tiền vào ví')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (17, 45235, N'0909999999', 1000000, NULL, 1, N'0909999999', 45235, NULL, N'Nạp tiền vào ví')
INSERT [dbo].[NapTien] ([IDNap], [NgayNap], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (18, 45237, N'Test1', 1000000, NULL, 1, N'admin', 45237, NULL, N'Nạp tiền vào ví')
SET IDENTITY_INSERT [dbo].[NapTien] OFF
GO
SET IDENTITY_INSERT [dbo].[RutTien] ON 

INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (8, 45140, N'admin', 200000, NULL, 0, N'', 0, NULL, N'Rút tiền ra khỏi ví')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (9, 45140, N'admin', 50000, NULL, 0, N'', 0, NULL, N'Mua số 011        - Lô Đ/X        - Loại 3 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (10, 45140, N'admin', 200000, NULL, 0, N'', 0, NULL, N'Mua số 111        - Lô X/C        - Loại 3 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (11, 45140, N'admin', 5000000, NULL, 1, N'admin', 45171, NULL, N'Quản lý admin Xác nhận admin nạp thêm 5000000')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (12, 45140, N'Admin', 100000, NULL, 1, N'admin', 45140, NULL, N'Mua số 0123       - Lô 16L        - Loại 4 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (13, 45140, N'Admin', 200000, NULL, 1, N'admin', 45140, NULL, N'Mua số 3333       - Lô 16L        - Loại 4 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (14, 45140, N'admin', 50000, NULL, 1, N'admin', 45140, NULL, N'Mua số 10         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (15, 45140, N'admin', 10000, NULL, 0, NULL, 0, NULL, N'Rút tiền ra khỏi ví')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (16, 45158, N'admin', 50000, NULL, 1, N'', 45158, NULL, N'Mua số 43         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (17, 45158, N'admin', 50000, NULL, 1, N'', 45158, NULL, N'Mua số 10         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (18, 45159, N'admin', 50000, NULL, 1, N'Admin', 45159, NULL, N'Mua số 43         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (19, 45160, N'Admin', 20000, NULL, 1, N'Admin', 45160, NULL, N'Mua số 00         - Lô Đ/X        - Loại 2 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (20, 45170, N'admin', 5000000, NULL, 1, N'admin', 45170, NULL, N'Quản lý admin Xác nhận admin nạp thêm 5000000')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (21, 45213, N'0909999999', 100, NULL, 1, N'admin', 45231, NULL, N'Rút tiền ra khỏi ví')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (22, 45215, N'admin', 50000, NULL, 1, N'', 45215, NULL, N'Mua số 011        - Lô Đ/X        - Loại 3 số - Đài BT        ')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (23, 45233, N'0909999999', 90000000, NULL, 1, N'0909999999', 45233, NULL, N'Rút tiền ra khỏi ví')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (24, 45233, N'0909999999', 1000000, NULL, 0, NULL, 0, NULL, N'Rút tiền ra khỏi ví')
INSERT [dbo].[RutTien] ([IDRut], [NgayRut], [TaiKhoan], [SoTien], [NganHang], [XacNhan], [NguoiXacNhan], [NgayXacNhan], [HinhDinhKem], [LyDo]) VALUES (25, 45235, N'0909999999', 40000, NULL, 1, N'0909999999', 45235, NULL, N'Rút tiền ra khỏi ví')
SET IDENTITY_INSERT [dbo].[RutTien] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoanHeThong] ON 

INSERT [dbo].[TaiKhoanHeThong] ([IDTaiKhoan], [TaiKhoan], [MatKhau], [LevelCode], [LaQuanLy], [MaDaiLy], [HoTen], [ChietKhau], [SoDienThoai], [DiaChi], [SoTaiKhoan], [NganHang], [KichHoat], [ViTien], [NgayDangKy]) VALUES (1, N'admin', N'admin', N'01        ', 1, N'', N'Mr Thanh', N'0', N'012345678', N'', N'', N'', 1, 20450000, CAST(N'2023-11-08T07:46:36.640' AS DateTime))
INSERT [dbo].[TaiKhoanHeThong] ([IDTaiKhoan], [TaiKhoan], [MatKhau], [LevelCode], [LaQuanLy], [MaDaiLy], [HoTen], [ChietKhau], [SoDienThoai], [DiaChi], [SoTaiKhoan], [NganHang], [KichHoat], [ViTien], [NgayDangKy]) VALUES (2, N'test', N'123', NULL, 1, N'admin', N'test1', N'0', N'1111', N'', N'', N'', 1, 0, CAST(N'2023-09-03T23:29:44.360' AS DateTime))
INSERT [dbo].[TaiKhoanHeThong] ([IDTaiKhoan], [TaiKhoan], [MatKhau], [LevelCode], [LaQuanLy], [MaDaiLy], [HoTen], [ChietKhau], [SoDienThoai], [DiaChi], [SoTaiKhoan], [NganHang], [KichHoat], [ViTien], [NgayDangKy]) VALUES (3, N'Antest', N'123456', NULL, 0, N'Admin', N'An', N'0', N'0909090909', N'Rb ', N'1234', N'A', 1, 0, CAST(N'2023-10-14T20:32:01.113' AS DateTime))
INSERT [dbo].[TaiKhoanHeThong] ([IDTaiKhoan], [TaiKhoan], [MatKhau], [LevelCode], [LaQuanLy], [MaDaiLy], [HoTen], [ChietKhau], [SoDienThoai], [DiaChi], [SoTaiKhoan], [NganHang], [KichHoat], [ViTien], [NgayDangKy]) VALUES (4, N'0909999999', N'123456', NULL, 1, N'Admin', N'Nguyễn Văn b', N'15', N'0909999999', N'TP hcm', N'0123456', N'vcb', 1, 961000, CAST(N'2023-11-09T00:30:53.547' AS DateTime))
INSERT [dbo].[TaiKhoanHeThong] ([IDTaiKhoan], [TaiKhoan], [MatKhau], [LevelCode], [LaQuanLy], [MaDaiLy], [HoTen], [ChietKhau], [SoDienThoai], [DiaChi], [SoTaiKhoan], [NganHang], [KichHoat], [ViTien], [NgayDangKy]) VALUES (5, N'Test1', N'123456', NULL, 1, N'0909999999', N'Test', N'10', N'0123123', N'TP hcm', N'', N'', 1, 1100000, CAST(N'2023-11-09T12:10:05.213' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaiKhoanHeThong] OFF
GO
ALTER TABLE [dbo].[Games] ADD  CONSTRAINT [DF_Games_XacNhan]  DEFAULT ((0)) FOR [XacNhan]
GO
ALTER TABLE [dbo].[NapTien] ADD  CONSTRAINT [DF_NapTien_NgayXacNhan]  DEFAULT ((0)) FOR [NgayXacNhan]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_them]  DEFAULT ((0)) FOR [them]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_sua]  DEFAULT ((0)) FOR [sua]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_xoa]  DEFAULT ((0)) FOR [xoa]
GO
ALTER TABLE [dbo].[PhanQuyen] ADD  CONSTRAINT [DF_PhanQuyen_inan]  DEFAULT ((0)) FOR [inan]
GO
ALTER TABLE [dbo].[RutTien] ADD  CONSTRAINT [DF_RutTien_XacNhan]  DEFAULT ((0)) FOR [XacNhan]
GO
ALTER TABLE [dbo].[RutTien] ADD  CONSTRAINT [DF_RutTien_NgayXacNhan]  DEFAULT ((0)) FOR [NgayXacNhan]
GO
ALTER TABLE [dbo].[TaiKhoanHeThong] ADD  CONSTRAINT [DF_TaiKhoan_LaQuanLy]  DEFAULT ((0)) FOR [LaQuanLy]
GO
ALTER TABLE [dbo].[TaiKhoanHeThong] ADD  CONSTRAINT [DF_TaiKhoanHeThong_KichHoat]  DEFAULT ((1)) FOR [KichHoat]
GO
ALTER TABLE [dbo].[TaiKhoanHeThong] ADD  CONSTRAINT [DF_TaiKhoanHeThong_ViTien]  DEFAULT ((0)) FOR [ViTien]
GO
ALTER TABLE [dbo].[TaiKhoanHeThong] ADD  CONSTRAINT [DF_TaiKhoanHeThong_NgayDangKy]  DEFAULT (getdate()) FOR [NgayDangKy]
GO
/****** Object:  StoredProcedure [dbo].[sp_Games_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Games_All]
as
Begin
select * from Games
End

GO
/****** Object:  StoredProcedure [dbo].[sp_Games_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Games_Delete]
@IDGame as int
 as
delete Games
where (Games.IDGame=@IDGame)

GO
/****** Object:  StoredProcedure [dbo].[sp_Games_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Games_Insert]
@NgayChoi as int,
@MaDai as nchar (20),
@Lo as nchar (20),
@So as nchar (20),
@SoTien as float ,
@TaiKhoan as nvarchar (100),
@IDGame_Output int output 
 as
insert into Games(
NgayChoi,
MaDai,
Lo,
So,
SoTien,
TaiKhoan
)
values (
@NgayChoi,
@MaDai,
@Lo,
@So,
@SoTien,
@TaiKhoan
)
GO
/****** Object:  StoredProcedure [dbo].[sp_Games_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Games_Update]
@IDGame as int,
@NgayChoi as int,
@MaDai as nchar (20),
@Lo as nchar (20),
@So as nchar (20),
@SoTien as float ,
@TaiKhoan as nvarchar (100)
 as
update Games set 
NgayChoi = @NgayChoi,
MaDai = @MaDai,
Lo = @Lo,
So = @So,
SoTien = @SoTien,
TaiKhoan = @TaiKhoan
where Games.IDGame =  @IDGame


GO
/****** Object:  StoredProcedure [dbo].[sp_Level_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Level_All]
as
Begin
select * from Level
End

GO
/****** Object:  StoredProcedure [dbo].[sp_Level_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Level_Delete]
@LevelID as int
 as
delete Level
where (Level.LevelID=@LevelID)

GO
/****** Object:  StoredProcedure [dbo].[sp_Level_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Level_Insert]
@LevelCode as nchar (20),
@LevelName as nvarchar (max),
@LevelID_Output int output 
 as
insert into Level(
LevelCode,
LevelName
)
values (
@LevelCode,
@LevelName
)
GO
/****** Object:  StoredProcedure [dbo].[sp_Level_TheoID]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create  procedure [dbo].[sp_Level_TheoID]
@LevelID int
as  
Begin  
select * from [Level] where LevelID=@LevelID
End  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_Level_TheoMa]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create  procedure [dbo].[sp_Level_TheoMa]
@LevelCode nchar(10)
as  
Begin  
select * from [Level] where LevelCode=@LevelCode
End  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_Level_TheoMaID]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create  procedure [dbo].[sp_Level_TheoMaID]
@LevelCode nchar(10),
@LevelID int
as  
Begin  
select * from [Level] where LevelCode=@LevelCode and LevelID<>@LevelID
End  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_Level_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Level_Update]
@LevelID as int,
@LevelCode as nchar (20),
@LevelName as nvarchar (max)
 as
update Level set 
LevelCode = @LevelCode,
LevelName = @LevelName
where Level.LevelID =  @LevelID


GO
/****** Object:  StoredProcedure [dbo].[sp_Menu_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Menu_All]
as
Begin
select * from Menu
End

GO
/****** Object:  StoredProcedure [dbo].[sp_Menu_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_Menu_Delete]
@menu_id as int
 as
delete Menu
where (Menu.menu_id=@menu_id)

GO
/****** Object:  StoredProcedure [dbo].[sp_Menu_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Menu_Insert]
@menu_title as nvarchar (max),
@menu_description as nvarchar (max),
@menu_url as nvarchar (max),
@menu_valuepath as text ,
@menu_parent_id as int,
@menu_order as nvarchar (100),
@menu_id_Output int output 
 as
insert into Menu(
menu_title,
menu_description,
menu_url,
menu_valuepath,
menu_parent_id,
menu_order
)
values (
@menu_title,
@menu_description,
@menu_url,
@menu_valuepath,
@menu_parent_id,
@menu_order
)
GO
/****** Object:  StoredProcedure [dbo].[sp_Menu_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_Menu_Update]
@menu_id as int,
@menu_title as nvarchar (max),
@menu_description as nvarchar (max),
@menu_url as nvarchar (max),
@menu_valuepath as text ,
@menu_parent_id as int,
@menu_order as nvarchar (100)
 as
update Menu set 
menu_title = @menu_title,
menu_description = @menu_description,
menu_url = @menu_url,
menu_valuepath = @menu_valuepath,
menu_parent_id = @menu_parent_id,
menu_order = @menu_order
where Menu.menu_id =  @menu_id


GO
/****** Object:  StoredProcedure [dbo].[sp_NapTien_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_NapTien_All]
as
Begin
select * from NapTien
End

GO
/****** Object:  StoredProcedure [dbo].[sp_NapTien_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_NapTien_Delete]
@IDNap as int
 as
delete NapTien
where (NapTien.IDNap=@IDNap)

GO
/****** Object:  StoredProcedure [dbo].[sp_NapTien_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_NapTien_Insert]
@NgayNap as int,
@TaiKhoan as nvarchar (100),
@SoTien as float ,
@NganHang as nvarchar (max),
@XacNhan as bit,
@NguoiXacNhan as nvarchar (100),
@NgayXacNhan as int,
@HinhDinhKem as nvarchar (max),
@IDNap_Output int output 
 as
insert into NapTien(
NgayNap,
TaiKhoan,
SoTien,
NganHang,
XacNhan,
NguoiXacNhan,
NgayXacNhan,
HinhDinhKem
)
values (
@NgayNap,
@TaiKhoan,
@SoTien,
@NganHang,
@XacNhan,
@NguoiXacNhan,
@NgayXacNhan,
@HinhDinhKem
)
GO
/****** Object:  StoredProcedure [dbo].[sp_NapTien_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_NapTien_Update]
@IDNap as int,
@NgayNap as int,
@TaiKhoan as nvarchar (100),
@SoTien as float ,
@NganHang as nvarchar (max),
@XacNhan as bit,
@NguoiXacNhan as nvarchar (100),
@NgayXacNhan as int,
@HinhDinhKem as nvarchar (max)
 as
update NapTien set 
NgayNap = @NgayNap,
TaiKhoan = @TaiKhoan,
SoTien = @SoTien,
NganHang = @NganHang,
XacNhan = @XacNhan,
NguoiXacNhan = @NguoiXacNhan,
NgayXacNhan = @NgayXacNhan,
HinhDinhKem = @HinhDinhKem
where NapTien.IDNap =  @IDNap


GO
/****** Object:  StoredProcedure [dbo].[sp_PhanQuyen_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_PhanQuyen_All]
as
Begin
select * from PhanQuyen
End

GO
/****** Object:  StoredProcedure [dbo].[sp_PhanQuyen_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_PhanQuyen_Delete]
@AuthorDetailsID as int
 as
delete PhanQuyen
where (PhanQuyen.AuthorDetailsID=@AuthorDetailsID)

GO
/****** Object:  StoredProcedure [dbo].[sp_PhanQuyen_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_PhanQuyen_Insert]
@TaiKhoan as nvarchar (100),
@menu_id as int,
@them as bit,
@sua as bit,
@xoa as bit,
@inan as bit,
@AuthorDetailsID_Output int output 
 as
insert into PhanQuyen(
TaiKhoan,
menu_id,
them,
sua,
xoa,
inan
)
values (
@TaiKhoan,
@menu_id,
@them,
@sua,
@xoa,
@inan
)
GO
/****** Object:  StoredProcedure [dbo].[sp_PhanQuyen_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_PhanQuyen_Update]
@AuthorDetailsID as int,
@TaiKhoan as nvarchar (100),
@menu_id as int,
@them as bit,
@sua as bit,
@xoa as bit,
@inan as bit
 as
update PhanQuyen set 
TaiKhoan = @TaiKhoan,
menu_id = @menu_id,
them = @them,
sua = @sua,
xoa = @xoa,
inan = @inan
where PhanQuyen.AuthorDetailsID =  @AuthorDetailsID


GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuDuThuong_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_PhieuDuThuong_All]
as
Begin
select * from PhieuDuThuong
End

GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuDuThuong_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_PhieuDuThuong_Delete]
@IDPhieuDuThuong as int
 as
delete PhieuDuThuong
where (PhieuDuThuong.IDPhieuDuThuong=@IDPhieuDuThuong)

GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuDuThuong_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_PhieuDuThuong_Insert]
@IDGame as int,
@NgayXuat as int,
@SoPhieu as nvarchar (100),
@SoDuThuong as nvarchar (100),
@KetQua as nvarchar (100),
@So as nchar (20),
@Lo as nchar (20),
@GhiChu as nvarchar (max),
@NguoiXuat as nvarchar (100),
@IDPhieuDuThuong_Output int output 
 as
insert into PhieuDuThuong(
IDGame,
NgayXuat,
SoPhieu,
SoDuThuong,
KetQua,
So,
Lo,
GhiChu,
NguoiXuat
)
values (
@IDGame,
@NgayXuat,
@SoPhieu,
@SoDuThuong,
@KetQua,
@So,
@Lo,
@GhiChu,
@NguoiXuat
)
GO
/****** Object:  StoredProcedure [dbo].[sp_PhieuDuThuong_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_PhieuDuThuong_Update]
@IDPhieuDuThuong as int,
@IDGame as int,
@NgayXuat as int,
@SoPhieu as nvarchar (100),
@SoDuThuong as nvarchar (100),
@KetQua as nvarchar (100),
@So as nchar (20),
@Lo as nchar (20),
@GhiChu as nvarchar (max),
@NguoiXuat as nvarchar (100)
 as
update PhieuDuThuong set 
IDGame = @IDGame,
NgayXuat = @NgayXuat,
SoPhieu = @SoPhieu,
SoDuThuong = @SoDuThuong,
KetQua = @KetQua,
So = @So,
Lo = @Lo,
GhiChu = @GhiChu,
NguoiXuat = @NguoiXuat
where PhieuDuThuong.IDPhieuDuThuong =  @IDPhieuDuThuong


GO
/****** Object:  StoredProcedure [dbo].[sp_RutTien_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_RutTien_All]
as
Begin
select * from RutTien
End

GO
/****** Object:  StoredProcedure [dbo].[sp_RutTien_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_RutTien_Delete]
@IDRut as int
 as
delete RutTien
where (RutTien.IDRut=@IDRut)

GO
/****** Object:  StoredProcedure [dbo].[sp_RutTien_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_RutTien_Insert]
@NgayRut as int,
@TaiKhoan as nvarchar (100),
@SoTien as float ,
@NganHang as nvarchar (max),
@XacNhan as bit,
@NguoiXacNhan as nvarchar (100),
@NgayXacNhan as int,
@HinhDinhKem as nchar (20),
@IDRut_Output int output 
 as
insert into RutTien(
NgayRut,
TaiKhoan,
SoTien,
NganHang,
XacNhan,
NguoiXacNhan,
NgayXacNhan,
HinhDinhKem
)
values (
@NgayRut,
@TaiKhoan,
@SoTien,
@NganHang,
@XacNhan,
@NguoiXacNhan,
@NgayXacNhan,
@HinhDinhKem
)
GO
/****** Object:  StoredProcedure [dbo].[sp_RutTien_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_RutTien_Update]
@IDRut as int,
@NgayRut as int,
@TaiKhoan as nvarchar (100),
@SoTien as float ,
@NganHang as nvarchar (max),
@XacNhan as bit,
@NguoiXacNhan as nvarchar (100),
@NgayXacNhan as int,
@HinhDinhKem as nchar (20)
 as
update RutTien set 
NgayRut = @NgayRut,
TaiKhoan = @TaiKhoan,
SoTien = @SoTien,
NganHang = @NganHang,
XacNhan = @XacNhan,
NguoiXacNhan = @NguoiXacNhan,
NgayXacNhan = @NgayXacNhan,
HinhDinhKem = @HinhDinhKem
where RutTien.IDRut =  @IDRut


GO
/****** Object:  StoredProcedure [dbo].[sp_TaiKhoanHeThong_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_TaiKhoanHeThong_All]
as
Begin
select * from TaiKhoanHeThong
End

GO
/****** Object:  StoredProcedure [dbo].[sp_TaiKhoanHeThong_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_TaiKhoanHeThong_Delete]
@IDTaiKhoan as int
 as
delete TaiKhoanHeThong
where (TaiKhoanHeThong.IDTaiKhoan=@IDTaiKhoan)

GO
/****** Object:  StoredProcedure [dbo].[sp_TaiKhoanHeThong_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_TaiKhoanHeThong_Insert]
@TaiKhoan as nvarchar (100),
@MatKhau as nvarchar (100),
@LevelCode as nchar (20),
@LaQuanLy as bit,
@MaDaiLy as nchar (20),
@HoTen as nvarchar (max),
@ChietKhau as nvarchar (100),
@SoDienThoai as nvarchar (100),
@DiaChi as nvarchar (max),
@SoTaiKhoan as nvarchar (100),
@NganHang as nvarchar (max),
@KichHoat as bit,
@ViTien as float ,
@IDTaiKhoan_Output int output 
 as
insert into TaiKhoanHeThong(
TaiKhoan,
MatKhau,
LevelCode,
LaQuanLy,
MaDaiLy,
HoTen,
ChietKhau,
SoDienThoai,
DiaChi,
SoTaiKhoan,
NganHang,
KichHoat,
ViTien
)
values (
@TaiKhoan,
@MatKhau,
@LevelCode,
@LaQuanLy,
@MaDaiLy,
@HoTen,
@ChietKhau,
@SoDienThoai,
@DiaChi,
@SoTaiKhoan,
@NganHang,
@KichHoat,
@ViTien
)
GO
/****** Object:  StoredProcedure [dbo].[sp_TaiKhoanHeThong_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_TaiKhoanHeThong_Update]
@IDTaiKhoan as int,
@TaiKhoan as nvarchar (100),
@MatKhau as nvarchar (100),
@LevelCode as nchar (20),
@LaQuanLy as bit,
@MaDaiLy as nchar (20),
@HoTen as nvarchar (max),
@ChietKhau as nvarchar (100),
@SoDienThoai as nvarchar (100),
@DiaChi as nvarchar (max),
@SoTaiKhoan as nvarchar (100),
@NganHang as nvarchar (max),
@KichHoat as bit,
@ViTien as float 
 as
update TaiKhoanHeThong set 
TaiKhoan = @TaiKhoan,
MatKhau = @MatKhau,
LevelCode = @LevelCode,
LaQuanLy = @LaQuanLy,
MaDaiLy = @MaDaiLy,
HoTen = @HoTen,
ChietKhau = @ChietKhau,
SoDienThoai = @SoDienThoai,
DiaChi = @DiaChi,
SoTaiKhoan = @SoTaiKhoan,
NganHang = @NganHang,
KichHoat = @KichHoat,
ViTien = @ViTien
where TaiKhoanHeThong.IDTaiKhoan =  @IDTaiKhoan


GO
/****** Object:  StoredProcedure [dbo].[sp_TraThuong_All]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_TraThuong_All]
as
Begin
select * from TraThuong
End

GO
/****** Object:  StoredProcedure [dbo].[sp_TraThuong_Delete]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[sp_TraThuong_Delete]
@IDTraThuong as int
 as
delete TraThuong
where (TraThuong.IDTraThuong=@IDTraThuong)

GO
/****** Object:  StoredProcedure [dbo].[sp_TraThuong_Insert]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_TraThuong_Insert]
@NgayTraThuong as int,
@IDPhieuDuThuong as int,
@SoPhieu as nvarchar (100),
@SoDuThuong as nvarchar (100),
@So as nchar (20),
@Lo as nchar (20),
@NguoiTra as nvarchar (100),
@IDTraThuong_Output int output 
 as
insert into TraThuong(
NgayTraThuong,
IDPhieuDuThuong,
SoPhieu,
SoDuThuong,
So,
Lo,
NguoiTra
)
values (
@NgayTraThuong,
@IDPhieuDuThuong,
@SoPhieu,
@SoDuThuong,
@So,
@Lo,
@NguoiTra
)
GO
/****** Object:  StoredProcedure [dbo].[sp_TraThuong_Update]    Script Date: 09/11/2023 12:16:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[sp_TraThuong_Update]
@IDTraThuong as int,
@NgayTraThuong as int,
@IDPhieuDuThuong as int,
@SoPhieu as nvarchar (100),
@SoDuThuong as nvarchar (100),
@So as nchar (20),
@Lo as nchar (20),
@NguoiTra as nvarchar (100)
 as
update TraThuong set 
NgayTraThuong = @NgayTraThuong,
IDPhieuDuThuong = @IDPhieuDuThuong,
SoPhieu = @SoPhieu,
SoDuThuong = @SoDuThuong,
So = @So,
Lo = @Lo,
NguoiTra = @NguoiTra
where TraThuong.IDTraThuong =  @IDTraThuong


GO
ALTER DATABASE [SoXoTuChon_BenTre] SET  READ_WRITE 
GO
