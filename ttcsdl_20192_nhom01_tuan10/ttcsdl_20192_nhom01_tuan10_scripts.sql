USE [master]
GO
/****** Object:  Database [ttcsdl_nhom1]    Script Date: 4/22/2020 3:01:30 AM ******/
CREATE DATABASE [ttcsdl_nhom1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ttcsdl_nhom1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ttcsdl_nhom1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ttcsdl_nhom1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ttcsdl_nhom1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ttcsdl_nhom1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ttcsdl_nhom1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ttcsdl_nhom1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ttcsdl_nhom1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ttcsdl_nhom1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ttcsdl_nhom1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ttcsdl_nhom1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ttcsdl_nhom1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ttcsdl_nhom1] SET  MULTI_USER 
GO
ALTER DATABASE [ttcsdl_nhom1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ttcsdl_nhom1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ttcsdl_nhom1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ttcsdl_nhom1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ttcsdl_nhom1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ttcsdl_nhom1', N'ON'
GO
ALTER DATABASE [ttcsdl_nhom1] SET QUERY_STORE = OFF
GO
USE [ttcsdl_nhom1]
GO
/****** Object:  User [nmquan2711]    Script Date: 4/22/2020 3:01:31 AM ******/
CREATE USER [nmquan2711] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[BieuMau]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BieuMau](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenBieuMau] [nvarchar](20) NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[TenFile] [nchar](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BoMon]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaBM] [char](10) NOT NULL,
	[TenBM] [nvarchar](50) NOT NULL,
	[idChuNhiemBM] [int] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_Khoa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaBM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaCN] [char](10) NOT NULL,
	[TenCN] [nvarchar](50) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_BoMon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanToc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanToc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenDanToc] [nvarchar](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTuongUT]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTuongUT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenDTUT] [nvarchar](100) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoVien]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](30) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[CMT] [char](20) NOT NULL,
	[SDT] [char](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[Email] [char](50) NULL,
	[HocVi] [nvarchar](20) NULL,
	[BacHam] [nvarchar](20) NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgayCapNhat] [datetime] NOT NULL,
	[TrangThai] [int] NOT NULL,
	[id_BoMon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocBong]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocBong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenHocBong] [nvarchar](30) NULL,
	[NgayNhan] [date] NULL,
	[GiaTri] [float] NULL,
	[id_SV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocKi]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaHK] [char](10) NOT NULL,
	[NamHoc] [char](10) NULL,
	[TenKi] [nvarchar](50) NULL,
	[NgayBatDau] [date] NULL,
	[NgayKetThuc] [date] NULL,
	[HocPhi1TC] [float] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhenThuong]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhenThuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SoQuyetDinhKT] [char](20) NOT NULL,
	[HinhThucKT] [nvarchar](20) NULL,
	[NgayQuyetDinh] [date] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_DuocKT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SoQuyetDinhKT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhoa] [char](10) NOT NULL,
	[TenKhoa] [nvarchar](30) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoaHoc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoaHoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhoa] [char](20) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaKhuVuc] [char](2) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KiLuat]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KiLuat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SoQuyetDinhKL] [char](20) NOT NULL,
	[HinhThucKL] [nvarchar](20) NULL,
	[NgayQuyetDinh] [date] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_BiKL] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SoQuyetDinhKL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LHP_GV]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LHP_GV](
	[id_GV] [int] NULL,
	[id_LHP] [int] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LHP_SV]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LHP_SV](
	[DiemCC] [float] NOT NULL,
	[DiemTX] [float] NOT NULL,
	[DiemThi] [float] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_SV] [int] NULL,
	[id_LHP] [int] NULL,
	[DiemHe10] [int] NULL,
	[DiemChu] [nvarchar](20) NULL,
	[DiemHe4] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](20) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_SV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopHocPhan]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopHocPhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLHP] [char](10) NOT NULL,
	[Thu] [int] NOT NULL,
	[LichThi] [datetime] NOT NULL,
	[ToiDaSV] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_HocKi] [int] NULL,
	[id_PhongHoc] [int] NULL,
	[id_MonHoc] [int] NULL,
	[SiSo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaLHP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LopSV]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopSV](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLopSV] [char](10) NOT NULL,
	[TenLop] [nvarchar](30) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_KhoaHoc] [int] NULL,
	[SiSo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaLopSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaMH] [char](10) NOT NULL,
	[TenMH] [nvarchar](20) NOT NULL,
	[SoTin] [int] NOT NULL,
	[SoTiet] [int] NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_BoMon] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongHoc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongHoc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaPhong] [char](10) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_KhuVuc] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanHuyen]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanHuyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenQH] [nvarchar](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_ThanhPho] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuocGia]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuocGia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenQuocGia] [nvarchar](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenTruyCap]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTruyCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](5) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaSV] [char](8) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [char](10) NULL,
	[GioiTinh] [char](3) NULL,
	[BacDaoTao] [nvarchar](20) NOT NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_LopSV] [int] NULL,
	[id_CNganh] [int] NULL,
	[id_DTUT] [int] NULL,
	[id_DanToc] [int] NULL,
	[id_TonGiao] [int] NULL,
	[id_QuanHuyen] [int] NULL,
	[DiaChi] [nchar](50) NULL,
	[CMND] [nchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatKhauTK] [char](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_SV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPhanGiaDinh]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPhanGiaDinh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[HoTenBo] [nvarchar](50) NULL,
	[HoTenMe] [nvarchar](50) NULL,
	[SDTBo] [char](10) NULL,
	[SDTMe] [char](10) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_SV] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThanhPho]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThanhPho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenThanhPho] [nvarchar](50) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_QuocGia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TietHoc]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TietHoc](
	[TenTiet] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGianBatDau] [time](7) NULL,
	[ThoiGianKetThuc] [time](7) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TK_QuyenTC]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_QuyenTC](
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
	[id_TK] [int] NULL,
	[id_QuyenTC] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TonGiao]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TonGiao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TenTonGiao] [nvarchar](20) NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XepLoai]    Script Date: 4/22/2020 3:01:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XepLoai](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[KieuXepLoai] [nvarchar](20) NOT NULL,
	[Loai] [nvarchar](10) NULL,
	[DiemNhoNhat] [float] NULL,
	[DiemLonNhat] [float] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgaySua] [datetime] NULL,
	[NgayXoa] [datetime] NULL,
	[TrangThai] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD FOREIGN KEY([id_Khoa])
REFERENCES [dbo].[Khoa] ([id])
GO
ALTER TABLE [dbo].[ChuyenNganh]  WITH CHECK ADD FOREIGN KEY([id_BoMon])
REFERENCES [dbo].[BoMon] ([id])
GO
ALTER TABLE [dbo].[GiaoVien]  WITH CHECK ADD FOREIGN KEY([id_BoMon])
REFERENCES [dbo].[BoMon] ([id])
GO
ALTER TABLE [dbo].[HocBong]  WITH CHECK ADD FOREIGN KEY([id_SV])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH CHECK ADD FOREIGN KEY([id_DuocKT])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[KhenThuong]  WITH CHECK ADD  CONSTRAINT [FK_KhenThuong_GiaoVien] FOREIGN KEY([id_DuocKT])
REFERENCES [dbo].[GiaoVien] ([id])
GO
ALTER TABLE [dbo].[KhenThuong] CHECK CONSTRAINT [FK_KhenThuong_GiaoVien]
GO
ALTER TABLE [dbo].[KiLuat]  WITH CHECK ADD FOREIGN KEY([id_BiKL])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[LHP_GV]  WITH CHECK ADD FOREIGN KEY([id_GV])
REFERENCES [dbo].[GiaoVien] ([id])
GO
ALTER TABLE [dbo].[LHP_GV]  WITH CHECK ADD FOREIGN KEY([id_LHP])
REFERENCES [dbo].[LopHocPhan] ([id])
GO
ALTER TABLE [dbo].[LHP_SV]  WITH CHECK ADD FOREIGN KEY([id_LHP])
REFERENCES [dbo].[LopHocPhan] ([id])
GO
ALTER TABLE [dbo].[LHP_SV]  WITH CHECK ADD FOREIGN KEY([id_SV])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[LienHe]  WITH CHECK ADD FOREIGN KEY([id_SV])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD FOREIGN KEY([id_HocKi])
REFERENCES [dbo].[HocKi] ([id])
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD FOREIGN KEY([id_MonHoc])
REFERENCES [dbo].[MonHoc] ([id])
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD FOREIGN KEY([id_PhongHoc])
REFERENCES [dbo].[PhongHoc] ([id])
GO
ALTER TABLE [dbo].[LopSV]  WITH CHECK ADD FOREIGN KEY([id_KhoaHoc])
REFERENCES [dbo].[KhoaHoc] ([id])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([id_BoMon])
REFERENCES [dbo].[BoMon] ([id])
GO
ALTER TABLE [dbo].[PhongHoc]  WITH CHECK ADD FOREIGN KEY([id_KhuVuc])
REFERENCES [dbo].[KhuVuc] ([id])
GO
ALTER TABLE [dbo].[QuanHuyen]  WITH CHECK ADD FOREIGN KEY([id_ThanhPho])
REFERENCES [dbo].[ThanhPho] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([id_CNganh])
REFERENCES [dbo].[ChuyenNganh] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([id_DanToc])
REFERENCES [dbo].[DanToc] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([id_DTUT])
REFERENCES [dbo].[DoiTuongUT] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([id_LopSV])
REFERENCES [dbo].[LopSV] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([id_TonGiao])
REFERENCES [dbo].[TonGiao] ([id])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_SinhVien_QuanHuyen] FOREIGN KEY([id_QuanHuyen])
REFERENCES [dbo].[QuanHuyen] ([id])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_SinhVien_QuanHuyen]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([id_SV])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[ThanhPhanGiaDinh]  WITH CHECK ADD  CONSTRAINT [FK_ThanhPhanGiaDinh_SinhVien] FOREIGN KEY([id_SV])
REFERENCES [dbo].[SinhVien] ([id])
GO
ALTER TABLE [dbo].[ThanhPhanGiaDinh] CHECK CONSTRAINT [FK_ThanhPhanGiaDinh_SinhVien]
GO
ALTER TABLE [dbo].[ThanhPho]  WITH CHECK ADD FOREIGN KEY([id_QuocGia])
REFERENCES [dbo].[QuocGia] ([id])
GO
ALTER TABLE [dbo].[TK_QuyenTC]  WITH CHECK ADD FOREIGN KEY([id_QuyenTC])
REFERENCES [dbo].[QuyenTruyCap] ([id])
GO
ALTER TABLE [dbo].[TK_QuyenTC]  WITH CHECK ADD FOREIGN KEY([id_TK])
REFERENCES [dbo].[TaiKhoan] ([id])
GO
ALTER TABLE [dbo].[LHP_SV]  WITH CHECK ADD CHECK  (([DiemCC]>=(0.0) AND [DiemCC]<=(10.0)))
GO
ALTER TABLE [dbo].[LHP_SV]  WITH CHECK ADD CHECK  (([DiemThi]>=(0.0) AND [DiemThi]<=(10.0)))
GO
ALTER TABLE [dbo].[LHP_SV]  WITH CHECK ADD CHECK  (([DiemTX]>=(0.0) AND [DiemTX]<=(10.0)))
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD CHECK  (([ToiDaSV]>=(0) AND [ToiDaSV]<=(100)))
GO
ALTER TABLE [dbo].[LopHocPhan]  WITH CHECK ADD CHECK  (([Thu]>=(1) AND [Thu]<=(7)))
GO
ALTER TABLE [dbo].[XepLoai]  WITH CHECK ADD CHECK  (([DiemLonNhat]>=(0.0) AND [DiemLonNhat]<=(10.0)))
GO
ALTER TABLE [dbo].[XepLoai]  WITH CHECK ADD CHECK  (([DiemNhoNhat]>=(0.0) AND [DiemNhoNhat]<=(10.0)))
GO
USE [master]
GO
ALTER DATABASE [ttcsdl_nhom1] SET  READ_WRITE 
GO
