USE [master]
GO
/****** Object:  Database [colabnew]    Script Date: 08/31/2017 16:30:41 ******/
CREATE DATABASE [colabnew] ON  PRIMARY 
( NAME = N'colab_new', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\colabnew.mdf' , SIZE = 231424KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'colab_new_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\colabnew_log.LDF' , SIZE = 504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [colabnew] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [colabnew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [colabnew] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [colabnew] SET ANSI_NULLS OFF
GO
ALTER DATABASE [colabnew] SET ANSI_PADDING OFF
GO
ALTER DATABASE [colabnew] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [colabnew] SET ARITHABORT OFF
GO
ALTER DATABASE [colabnew] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [colabnew] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [colabnew] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [colabnew] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [colabnew] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [colabnew] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [colabnew] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [colabnew] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [colabnew] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [colabnew] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [colabnew] SET  DISABLE_BROKER
GO
ALTER DATABASE [colabnew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [colabnew] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [colabnew] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [colabnew] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [colabnew] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [colabnew] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [colabnew] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [colabnew] SET  READ_WRITE
GO
ALTER DATABASE [colabnew] SET RECOVERY SIMPLE
GO
ALTER DATABASE [colabnew] SET  MULTI_USER
GO
ALTER DATABASE [colabnew] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [colabnew] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'colabnew', N'ON'
GO
USE [colabnew]
GO
/****** Object:  User [colab_new_user_2015]    Script Date: 08/31/2017 16:30:41 ******/
CREATE USER [colab_new_user_2015] FOR LOGIN [colab_new_user_2015] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[PK_TAYNGHE] [int] NOT NULL,
	[C_HOTEN] [nvarchar](4000) NULL,
	[C_NGAYSINH] [datetime] NULL,
	[C_NGANH] [nvarchar](4000) NULL,
	[C_NGHE] [nvarchar](4000) NULL,
	[C_NGAYKT] [datetime] NULL,
	[C_DIEM_TAY_NGHE] [float] NULL,
	[C_DIEM_THE_LUC] [float] NULL,
	[C_DIEM_KN_PV] [float] NULL,
	[C_TONG] [float] NULL,
	[C_XEPLOAI] [nvarchar](4000) NULL,
	[C_SBD] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_ThongKe]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ThongKe](
	[MaTB] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[SoTruyCap] [bigint] NULL,
 CONSTRAINT [PK_TB_ThongKe] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_XC]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_XC](
	[PK_XC] [int] IDENTITY(1,1) NOT NULL,
	[C_HO_TEN] [nvarchar](500) NULL,
	[C_NGAY_SINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_DON_VI] [nvarchar](500) NULL,
	[C_KHOA_HOC] [nvarchar](50) NULL,
	[C_NGAY_TAP_TRUNG] [nvarchar](50) NULL,
	[C_DIA_DIEM] [nvarchar](500) NULL,
	[C_NGAY_XC] [nvarchar](50) NULL,
	[C_STATUS] [bit] NULL,
	[C_SBD] [nvarchar](50) NULL,
	[C_NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_XC] PRIMARY KEY CLUSTERED 
(
	[PK_XC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_USER_MODULE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USER_MODULE](
	[FK_MODULE] [int] NULL,
	[FK_USER] [int] NULL,
	[C_EDIT] [bit] NULL,
	[C_APPROVE] [bit] NULL,
	[C_VIEW] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_USER_MENU]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USER_MENU](
	[FK_MENU] [int] NULL,
	[FK_USER] [int] NULL,
	[C_EDIT] [bit] NULL,
	[C_APPROVE] [bit] NULL,
	[C_VIEW] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_USER_LOG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USER_LOG](
	[PK_USER_LOG] [int] IDENTITY(1,1) NOT NULL,
	[FK_USER] [int] NULL,
	[C_IP] [nvarchar](200) NULL,
	[C_DATE] [datetime] NULL,
 CONSTRAINT [PK_T_USER_LOG] PRIMARY KEY CLUSTERED 
(
	[PK_USER_LOG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_USER]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USER](
	[PK_USER] [int] IDENTITY(1,1) NOT NULL,
	[C_LOGIN_NAME] [nvarchar](300) NULL,
	[C_PASSWORD] [nvarchar](300) NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_ADDRESS] [nvarchar](300) NULL,
	[C_TEL] [nvarchar](50) NULL,
	[C_TEL_HOME] [nvarchar](50) NULL,
	[C_TEL_MOBILE] [nvarchar](50) NULL,
	[C_FAX] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](300) NULL,
	[C_BEGIN_DATE] [datetime] NULL,
	[C_END_DATE] [datetime] NULL,
	[C_CODE] [nvarchar](300) NULL,
	[C_CODE_DATE] [datetime] NULL,
	[C_IS_ADMIN] [bit] NULL,
	[C_IS_GUEST] [bit] NULL,
	[C_DELETE] [bit] NULL,
	[C_STATUS] [bit] NULL,
 CONSTRAINT [PK_T_USER] PRIMARY KEY CLUSTERED 
(
	[PK_USER] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TUYENDUNG_VIECLAM]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TUYENDUNG_VIECLAM](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_CTY] [nvarchar](50) NULL,
	[C_VITRI] [nvarchar](50) NULL,
	[C_MOTA] [nvarchar](500) NULL,
	[C_SOLUONGTUYEN] [nvarchar](50) NULL,
	[C_KYNANGGIAOTIEPTIENGHAN] [nvarchar](500) NULL,
	[C_NGHELAMVIEC] [nvarchar](500) NULL,
	[C_NAMLAMVIEC] [nvarchar](500) NULL,
	[C_BANGCAP] [nvarchar](50) NULL,
	[C_CHITIETBANGCAP] [nvarchar](50) NULL,
	[C_TUOITU] [nvarchar](50) NULL,
	[C_TUOIDEN] [nvarchar](50) NULL,
	[C_GIOITINH] [nvarchar](50) NULL,
	[C_NOICUTRU] [nvarchar](500) NULL,
	[C_MUCLUONGTOITHIEU] [nvarchar](500) NULL,
	[C_THUONG] [nvarchar](50) NULL,
	[C_THANGQUYNAM] [nvarchar](50) NULL,
	[C_CHEDOKHAC] [nvarchar](500) NULL,
	[C_HOSO] [nvarchar](500) NULL,
	[C_THOIGIANNHANTU] [datetime] NULL,
	[C_THOIGIANNHANDEN] [datetime] NULL,
	[C_THOIGIANTUYEN] [datetime] NULL,
	[C_NGAY] [datetime] NULL,
 CONSTRAINT [PK_T_TUYENDUNG_VIECLAM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TUYENDUNG_KR]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TUYENDUNG_KR](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[C_TENCTY] [nvarchar](100) NULL,
	[C_NGANHNGHE] [nvarchar](50) NULL,
	[C_MOTA] [nvarchar](200) NULL,
	[C_DIACHICTY] [nvarchar](500) NULL,
	[C_HUYEN] [nvarchar](50) NULL,
	[C_TINH] [nvarchar](50) NULL,
	[C_WEBSITE] [nchar](50) NULL,
	[C_MR] [nvarchar](50) NULL,
	[C_NGUOILIENHE] [nvarchar](50) NULL,
	[C_CHUCDANH] [nvarchar](50) NULL,
	[C_DTLIENHE] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_MATUYENDUNG] [nvarchar](50) NULL,
	[C_NGAYDK] [datetime] NULL,
 CONSTRAINT [PK_T_TUYENDUNG_KR] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TUYENDUNG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TUYENDUNG](
	[PK_TUYENDUNG] [bigint] IDENTITY(1,1) NOT NULL,
	[C_TENCTY] [nvarchar](500) NULL,
	[C_NGANHNGHE] [nvarchar](500) NULL,
	[C_DIACHI] [nvarchar](500) NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_VITRI] [nvarchar](500) NULL,
	[C_DIEUKIEN] [nvarchar](500) NULL,
	[C_YEUCAU] [nvarchar](500) NULL,
	[C_SOLUONG] [nvarchar](50) NULL,
	[C_THUNHAP] [nvarchar](50) NULL,
	[C_HOSO] [nvarchar](50) NULL,
	[C_THOIGIANNHAN] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
	[C_NHANHSDEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_TUYENDUNG] PRIMARY KEY CLUSTERED 
(
	[PK_TUYENDUNG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TUYEN_DUNG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TUYEN_DUNG](
	[PK_TUYEN_DUNG] [int] IDENTITY(1,1) NOT NULL,
	[C_TITLE] [nvarchar](500) NULL,
	[C_TEN_CONG_TY] [nvarchar](500) NULL,
	[C_DIA_CHI] [nvarchar](500) NULL,
	[C_MO_TA] [ntext] NULL,
	[C_PHONE] [nvarchar](500) NULL,
	[C_QUY_MO] [nvarchar](500) NULL,
	[C_TIEU_CHI] [ntext] NULL,
	[C_WEBSITE] [nvarchar](500) NULL,
	[C_VI_TRI] [nvarchar](500) NULL,
	[C_SL_TUYEN] [nvarchar](50) NULL,
	[C_LINH_VUC] [ntext] NULL,
	[C_DIA_DIEM_LAM_VIEC] [nvarchar](500) NULL,
	[C_MO_TA_VIEC_LAM] [ntext] NULL,
	[C_KY_NANG] [ntext] NULL,
	[C_TRINH_DO_TOI_THIEU] [nvarchar](500) NULL,
	[C_KINH_NGHIEM] [nvarchar](500) NULL,
	[C_YC_GIOI_TINH] [nvarchar](50) NULL,
	[C_HINH_THUC_LAM_VIEC] [nvarchar](500) NULL,
	[C_MUC_LUONG] [nvarchar](500) NULL,
	[C_THOI_GIAN_THU_VIEC] [nvarchar](500) NULL,
	[C_CAC_CHE_DO_KHAC] [ntext] NULL,
	[C_YEU_CAU_HO_SO] [ntext] NULL,
	[C_NGAY_DANG] [datetime] NULL,
	[C_HAN_NOP_HS] [datetime] NULL,
	[C_NGUOI_LIEN_HE] [nvarchar](500) NULL,
	[C_DIA_CHI_LIEN_HE] [nvarchar](500) NULL,
	[C_EMAIL_LIEN_HE] [nvarchar](500) NULL,
	[C_DIEN_THOAI_LIEN_HE] [nvarchar](500) NULL,
	[C_DI_DONG] [nvarchar](500) NULL,
	[C_HINH_THUC_LIEN_HE] [nvarchar](500) NULL,
	[C_STATUS] [bit] NULL,
 CONSTRAINT [PK_T_TUYEN_DUNG] PRIMARY KEY CLUSTERED 
(
	[PK_TUYEN_DUNG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TT]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TT](
	[PK_TT] [int] IDENTITY(1,1) NOT NULL,
	[C_MA] [nvarchar](50) NULL,
	[C_TEN] [nvarchar](50) NULL,
	[C_TEL] [nvarchar](50) NULL,
	[C_ADDRESS] [nvarchar](50) NULL,
	[C_STATUS] [bit] NULL,
	[C_PASS] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_TT] PRIMARY KEY CLUSTERED 
(
	[PK_TT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TNS]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TNS](
	[PK_TNS] [int] IDENTITY(1,1) NOT NULL,
	[C_HO_TEN] [ntext] NULL,
	[C_NGAY_SINH] [datetime] NULL,
	[C_GIOI_TINH] [ntext] NULL,
	[C_DIA_CHI] [ntext] NULL,
	[C_NGHE_NGHIEP] [ntext] NULL,
	[C_KINH_NGHIEM] [ntext] NULL,
	[C_BANG_CAP] [ntext] NULL,
	[C_TRINH_DO_NN] [ntext] NULL,
	[C_NGUYEN_VONG] [ntext] NULL,
	[C_THOI_GIAN_LV] [ntext] NULL,
	[C_MUC_LUONG_YC] [ntext] NULL,
	[C_STATUS] [bit] NULL,
 CONSTRAINT [PK_T_TNS] PRIMARY KEY CLUSTERED 
(
	[PK_TNS] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TINHTRANG_HS]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TINHTRANG_HS](
	[PK_TINHTRANG] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_HOCHIEU] [nvarchar](50) NULL,
	[C_SBD] [nvarchar](50) NULL,
	[C_TINHTRANG] [nvarchar](max) NULL,
	[C_ORDER] [bigint] NULL,
 CONSTRAINT [PK_T_TINHTRANG_HS] PRIMARY KEY CLUSTERED 
(
	[PK_TINHTRANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TIMVIEC]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TIMVIEC](
	[PK_TIMVIEC] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_GIOITINH] [nvarchar](50) NULL,
	[C_DIACHIGUITHU] [nvarchar](500) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_NGAYXUATCANH] [nvarchar](50) NULL,
	[C_NGAYVENUOC] [nvarchar](50) NULL,
	[C_TRINHDO] [nvarchar](500) NULL,
	[C_CONGVIECMONGMUON] [nvarchar](500) NULL,
	[C_MUCLUONG] [nvarchar](50) NULL,
	[C_DIACHILAMVIEC] [nvarchar](500) NULL,
	[C_CONGVIECCUTHE] [nvarchar](500) NULL,
	[C_THOIGIANLAMVIEC] [nvarchar](50) NULL,
	[C_TENNUOC] [nvarchar](50) NULL,
	[C_NGOAINGU] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
	[C_BANGCAP] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_TIMVIEC] PRIMARY KEY CLUSTERED 
(
	[PK_TIMVIEC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TIM_VIEC]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TIM_VIEC](
	[PK_TIM_VIEC] [int] IDENTITY(1,1) NOT NULL,
	[C_TITLE] [ntext] NULL,
	[C_HO_TEN] [ntext] NULL,
	[C_NGAY_SINH] [datetime] NULL,
	[C_GIOI_TINH] [ntext] NULL,
	[C_TINH_TRANG_HON_NHAN] [ntext] NULL,
	[C_DIA_CHI] [ntext] NULL,
	[C_DIEN_THOAI] [ntext] NULL,
	[C_DI_DONG] [ntext] NULL,
	[C_TRINH_DO] [ntext] NULL,
	[C_EMAIL] [ntext] NULL,
	[C_MONG_MUON] [ntext] NULL,
	[C_CHUC_DANH] [ntext] NULL,
	[C_MO_TA_CONG_VIEC] [ntext] NULL,
	[C_MUC_LUONG_HIEN_TAI] [ntext] NULL,
	[C_MUC_LUONG_MONG_MUON] [ntext] NULL,
	[C_LOAI_HINH_CV] [ntext] NULL,
	[C_NGANH_NGHE_MONG_MUON] [ntext] NULL,
	[C_DIA_DIEM] [ntext] NULL,
	[C_DI_CHUYEN] [ntext] NULL,
	[C_BANG_CAP] [ntext] NULL,
	[C_TRUONG_TN] [ntext] NULL,
	[C_NAM] [ntext] NULL,
	[C_NOI_DUNG_HOC] [ntext] NULL,
	[C_KINH_NGHIEM] [ntext] NULL,
	[C_KI_NANG] [ntext] NULL,
	[C_TU] [datetime] NULL,
	[C_DEN] [datetime] NULL,
	[C_LAM] [ntext] NULL,
	[C_STATUS] [bit] NULL,
	[C_NGAY_DANG] [datetime] NULL,
 CONSTRAINT [PK_T_TIM_VIEC] PRIMARY KEY CLUSTERED 
(
	[PK_TIM_VIEC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_TAYNGHE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TAYNGHE](
	[PK_TAYNGHE] [int] NOT NULL,
	[C_HOTEN] [nvarchar](4000) NULL,
	[C_NGAYSINH] [datetime] NULL,
	[C_NGANH] [nvarchar](4000) NULL,
	[C_NGHE] [nvarchar](4000) NULL,
	[C_NGAYKT] [datetime] NULL,
	[C_DIEM_TAY_NGHE] [float] NULL,
	[C_DIEM_THE_LUC] [float] NULL,
	[C_DIEM_KN_PV] [float] NULL,
	[C_TONG] [float] NULL,
	[C_XEPLOAI] [nvarchar](4000) NULL,
	[C_SBD] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SUPORT]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SUPORT](
	[PK_SUPORT] [int] IDENTITY(1,1) NOT NULL,
	[C_NAME] [nvarchar](50) NULL,
	[C_YAHOO] [nvarchar](50) NULL,
	[C_TEL] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_SUPORT] PRIMARY KEY CLUSTERED 
(
	[PK_SUPORT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_SETTING]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_SETTING](
	[PK_SETTING] [int] NOT NULL,
	[C_NAME] [nvarchar](100) NULL,
	[C_VALUE] [nvarchar](500) NULL,
	[C_CODE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_RESOURCESTRING]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_RESOURCESTRING](
	[ResourceID] [int] IDENTITY(1,1) NOT NULL,
	[ResourceKey] [nvarchar](100) NOT NULL,
	[LocaleID] [nvarchar](5) NOT NULL,
	[ResourceValue] [ntext] NULL,
	[VirtualPath] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_T_RESOURCESTRING] PRIMARY KEY CLUSTERED 
(
	[ResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_RECYCLEBIN]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RECYCLEBIN](
	[PK_RECYCLEBIN] [int] NOT NULL,
	[FK_ID] [int] NULL,
	[C_TABLE] [varchar](100) NULL,
	[C_MODULE] [nvarchar](100) NULL,
	[C_ENTRY_DATE] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PRODUCT]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PRODUCT](
	[PK_PRODUCT] [int] NOT NULL,
	[FK_MENU] [int] NULL,
	[C_TITLE] [nvarchar](300) NULL,
	[C_HEAD] [ntext] NULL,
	[C_CONTENT] [ntext] NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](300) NULL,
	[C_IMAGE_FILE_TITLE] [nvarchar](300) NULL,
	[C_ENTRY_DATE] [datetime] NULL,
	[C_BEGIN_DATE] [datetime] NULL,
	[C_END_DATE] [datetime] NULL,
	[C_MODIFY_DATE] [datetime] NULL,
	[C_HOT] [bit] NULL,
	[C_HITS] [int] NULL,
	[C_UNIT] [nvarchar](50) NULL,
	[C_PRICE] [float] NULL,
	[C_SALE] [float] NULL,
	[C_DELETE] [bit] NULL,
	[C_STATUS] [bit] NULL,
	[C_KHO] [bit] NULL,
	[C_BAO_HANH] [nvarchar](300) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PHIEN_GDVL_CHITIET]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PHIEN_GDVL_CHITIET](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_PHIEN] [bigint] NULL,
	[C_CTY] [nvarchar](500) NULL,
	[C_VITRI] [nvarchar](500) NULL,
	[C_DIACHI] [nvarchar](500) NULL,
	[C_TEL] [nvarchar](500) NULL,
 CONSTRAINT [PK_T_PHIEN_GDVL_CHITIET] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_PHIEN_GDVL]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_PHIEN_GDVL](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[C_PHIEN] [nvarchar](500) NULL,
	[C_NGAY] [datetime] NULL,
 CONSTRAINT [PK_T_PHIEN_GDVL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ONLINE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ONLINE](
	[PK_ONLINE] [uniqueidentifier] NOT NULL,
	[C_IP] [nvarchar](200) NULL,
	[C_TIME] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_NOP_HOSO]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_NOP_HOSO](
	[PK_HOSO] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_HOCHIEU] [nvarchar](50) NULL,
	[C_CMNDNN] [nvarchar](50) NULL,
	[C_DIACHI] [nvarchar](500) NULL,
	[C_HOIHUONG] [nvarchar](50) NULL,
	[C_HANXUATCANH] [nvarchar](50) NULL,
	[C_THOIGIANGUIHS] [nvarchar](50) NULL,
	[C_ORDER] [bigint] NULL,
 CONSTRAINT [PK_T_NOP_HOSO] PRIMARY KEY CLUSTERED 
(
	[PK_HOSO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_NGUOILAODONG_TV]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_NGUOILAODONG_TV](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FK_TUYENDUNGVL] [bigint] NULL,
	[FK_MATV] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
	[FK_PHIEN] [bigint] NULL,
 CONSTRAINT [PK_T_NGUOILAODONG_TV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_NGUOILAODONG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_NGUOILAODONG](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HODEM] [nvarchar](50) NULL,
	[C_TEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [datetime] NULL,
	[C_GIOITINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_NOICUTRU] [nvarchar](50) NULL,
	[C_HUYEN] [nvarchar](50) NULL,
	[C_TINH] [nvarchar](50) NULL,
	[C_CHUONGTRINH] [nvarchar](50) NULL,
	[C_SOID] [nvarchar](50) NULL,
	[C_NGAYXUATCANH] [datetime] NULL,
	[C_NGAYVENUOC] [datetime] NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_NGOAINGU] [nvarchar](50) NULL,
	[C_CHUNGCHI] [nvarchar](50) NULL,
	[C_DAOTAONGHE1] [nvarchar](50) NULL,
	[C_DAOTAOTU1] [datetime] NULL,
	[C_DAOTAODEN1] [datetime] NULL,
	[C_BANGCAP1] [nvarchar](50) NULL,
	[C_BANGCAPKHAC1] [nvarchar](50) NULL,
	[C_NGHELAMVIEC1] [nvarchar](50) NULL,
	[C_CVCUTHE1] [nvarchar](50) NULL,
	[C_CVCUTHETU1] [datetime] NULL,
	[C_CVCUTHEDEN1] [datetime] NULL,
	[C_DAOTAONGHE2] [nvarchar](50) NULL,
	[C_DAOTAOTU2] [datetime] NULL,
	[C_DAOTAODEN2] [datetime] NULL,
	[C_BANGCAP2] [nvarchar](50) NULL,
	[C_BANGCAPKHAC2] [nvarchar](50) NULL,
	[C_NGHELAMVIEC2] [nvarchar](50) NULL,
	[C_CVCUTHE2] [nvarchar](50) NULL,
	[C_CVCUTHETU2] [datetime] NULL,
	[C_CVCUTHEDEN2] [datetime] NULL,
	[C_DAOTAONGHE3] [nvarchar](50) NULL,
	[C_DAOTAOTU3] [datetime] NULL,
	[C_DAOTAODEN3] [datetime] NULL,
	[C_BANGCAP3] [nvarchar](50) NULL,
	[C_BANGCAPKHAC3] [nvarchar](50) NULL,
	[C_NGHELAMVIEC3] [nvarchar](50) NULL,
	[C_CVCUTHE3] [nvarchar](50) NULL,
	[C_CVCUTHETU3] [datetime] NULL,
	[C_CVCUTHEDEN3] [datetime] NULL,
	[C_NGANHNGHEDUKIENTIM] [nvarchar](50) NULL,
	[C_VITRIMONGMUON] [nvarchar](50) NULL,
	[C_MUCLUONGMONGMUON] [nvarchar](50) NULL,
	[C_DIADIEMMONGMUON] [nvarchar](50) NULL,
	[C_MATIMVIEC] [nvarchar](50) NULL,
	[C_NGAYDK] [datetime] NULL,
 CONSTRAINT [PK_T_NGUOILAODONG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_MODULE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MODULE](
	[PK_MODULE] [int] NOT NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_TYPE] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_MENU]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MENU](
	[PK_MENU] [int] IDENTITY(1,1) NOT NULL,
	[FK_BANNER] [int] NULL,
	[FK_LANG] [int] NULL,
	[C_TYPE] [nvarchar](100) NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_RSS] [bit] NULL,
	[C_PARENT] [int] NULL,
	[C_ORDER] [int] NULL,
	[FK_MENU] [int] NULL,
	[C_DELETE_MOVE] [bit] NULL,
	[C_DELETE] [bit] NULL,
	[C_STATUS] [bit] NULL,
	[C_MOTA] [nvarchar](500) NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](300) NULL,
	[C_LINK] [nvarchar](500) NULL,
 CONSTRAINT [PK_T_MENU] PRIMARY KEY CLUSTERED 
(
	[PK_MENU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_LINK]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LINK](
	[PK_LINK] [int] IDENTITY(1,1) NOT NULL,
	[FK_LANG] [int] NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_LINK] [nvarchar](300) NULL,
	[C_ORDER] [int] NULL,
	[C_STATUS] [bit] NULL,
	[C_HEAD] [ntext] NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](500) NULL,
 CONSTRAINT [PK_T_LINK] PRIMARY KEY CLUSTERED 
(
	[PK_LINK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_LD_KYHD]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LD_KYHD](
	[PK_LD] [int] IDENTITY(1,1) NOT NULL,
	[C_HO_TEN] [nvarchar](500) NULL,
	[C_NGAY_SINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](500) NULL,
	[C_DON_VI] [nvarchar](500) NULL,
	[C_KHOA_HOC] [nvarchar](500) NULL,
	[C_NGAY_TAP_TRUNG] [nvarchar](50) NULL,
	[C_DIA_DIEM] [nvarchar](500) NULL,
	[C_STATUS] [bit] NULL,
	[C_SBD] [nvarchar](50) NULL,
	[C_NAME] [nvarchar](500) NULL,
 CONSTRAINT [PK_T_LD_KYHD] PRIMARY KEY CLUSTERED 
(
	[PK_LD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_LANG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LANG](
	[PK_LANG] [int] NOT NULL,
	[C_NAME] [nvarchar](50) NULL,
	[C_TITLE] [nvarchar](300) NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](300) NULL,
	[C_IMAGE_FILE_TITLE] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_KHAIBAO_THONGTIN]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_KHAIBAO_THONGTIN](
	[PK_KHAIBAO] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_HOCHIEU] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_MUCDICH] [nvarchar](50) NULL,
	[C_TENDN] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG] [nvarchar](50) NULL,
	[C_DIENTHOAIDN] [nvarchar](50) NULL,
	[C_DIACHIDN] [nvarchar](50) NULL,
	[C_SOTHE] [nvarchar](50) NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_HOPDONGTU] [nvarchar](50) NULL,
	[C_HOPDONGDEN] [nvarchar](50) NULL,
	[C_LYDO] [nvarchar](50) NULL,
	[C_NGAYHETHAN] [nvarchar](50) NULL,
	[C_NGAYDANGKYVENUOC] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
	[C_NAME] [nvarchar](50) NULL,
	[C_NGAYNHAPCANH] [nvarchar](50) NULL,
	[C_TENDN1] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG1] [nvarchar](50) NULL,
	[C_DIENTHOAIDN1] [nvarchar](50) NULL,
	[C_DIACHIDN1] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN1] [nvarchar](50) NULL,
	[C_TENDN2] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG2] [nvarchar](50) NULL,
	[C_DIENTHOAIDN2] [nvarchar](50) NULL,
	[C_DIACHIDN2] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN2] [nvarchar](50) NULL,
	[C_TENDN3] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG3] [nvarchar](50) NULL,
	[C_DIENTHOAIDN3] [nvarchar](50) NULL,
	[C_DIACHIDN3] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN3] [nvarchar](50) NULL,
	[C_TENDN4] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG4] [nvarchar](50) NULL,
	[C_DIENTHOAIDN4] [nvarchar](50) NULL,
	[C_DIACHIDN4] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN4] [nvarchar](50) NULL,
	[C_TENDN5] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG5] [nvarchar](50) NULL,
	[C_DIENTHOAIDN5] [nvarchar](50) NULL,
	[C_DIACHIDN5] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN5] [nvarchar](50) NULL,
	[C_TENDN_HIENTAI] [nvarchar](50) NULL,
	[C_NGUOISUDUNGLAODONG_HIENTAI] [nvarchar](50) NULL,
	[C_DIENTHOAIDN_HIENTAI] [nvarchar](50) NULL,
	[C_DIACHIDN_HIENTAI] [nvarchar](50) NULL,
	[C_NGAYLAMVIECDN_HIENTAI] [nvarchar](50) NULL,
	[C_NGAYKHAIBAOCUOI] [date] NULL,
	[C_NGAYKHAIBAODAU] [date] NULL,
 CONSTRAINT [PK_T_KHAIBAO_THONGTIN] PRIMARY KEY CLUSTERED 
(
	[PK_KHAIBAO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_IM]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_IM](
	[PK_IM] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](500) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_TRINHDO] [nvarchar](50) NULL,
	[C_HONNHAN] [nvarchar](50) NULL,
	[C_HOKHAU] [nvarchar](50) NULL,
	[C_SONHA] [nvarchar](50) NULL,
	[C_PHUONGXA] [nvarchar](50) NULL,
	[C_QUANHUYEN] [nvarchar](50) NULL,
	[C_THANHPHO] [nvarchar](50) NULL,
	[C_DIENTHOAI1] [nvarchar](50) NULL,
	[C_DIENTHOAI2] [nvarchar](50) NULL,
	[C_NGUOILIENHE] [nvarchar](500) NULL,
	[C_QUANHE] [nvarchar](50) NULL,
	[C_DIACHI] [nvarchar](500) NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_NGAYDANGKY] [datetime] NULL,
 CONSTRAINT [PK_T_IM] PRIMARY KEY CLUSTERED 
(
	[PK_IM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_HOSO]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_HOSO](
	[PK_HOSO] [int] IDENTITY(1,1) NOT NULL,
	[C_MASO] [nvarchar](50) NULL,
	[C_HOTEN] [ntext] NULL,
	[C_NGAYSINH] [datetime] NULL,
	[C_DONVI] [ntext] NULL,
	[C_TINHTRANG] [ntext] NULL,
	[C_GHICHU] [ntext] NULL,
 CONSTRAINT [PK_T_HOSO] PRIMARY KEY CLUSTERED 
(
	[PK_HOSO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_GALLERY]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_GALLERY](
	[PK_GALLERY] [int] IDENTITY(1,1) NOT NULL,
	[FK_MENU] [int] NULL,
	[C_NAME] [nvarchar](200) NULL,
	[C_FILE] [nvarchar](200) NULL,
	[C_LINK] [nvarchar](200) NULL,
	[C_ENTRY_DATE] [datetime] NULL,
	[C_MODIFY_DATE] [datetime] NULL,
	[C_HOT] [bit] NULL,
	[C_ORDER] [int] NOT NULL,
	[C_STATUS] [bit] NULL,
 CONSTRAINT [PK_T_GALLERY] PRIMARY KEY CLUSTERED 
(
	[PK_GALLERY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_FEEDBACK_USER]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_FEEDBACK_USER](
	[FK_FEEDBACK] [int] NULL,
	[FK_USER] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_FEEDBACK]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_FEEDBACK](
	[PK_FEEDBACK] [int] IDENTITY(1,1) NOT NULL,
	[C_SENDER_NAME] [nvarchar](300) NULL,
	[C_SENDER_ADDRESS] [nvarchar](300) NULL,
	[C_SENDER_TEL] [nvarchar](50) NULL,
	[C_SENDER_WEBSITE] [nvarchar](300) NULL,
	[C_SENDER_EMAIL] [nvarchar](300) NULL,
	[C_TITLE] [nvarchar](300) NULL,
	[C_CONTENT] [ntext] NULL,
	[C_FILE_CONTENT] [nvarchar](300) NULL,
	[C_FILE_NAME] [nvarchar](300) NULL,
	[C_SENDER_DATE] [datetime] NULL,
	[C_DELETE] [bit] NULL,
 CONSTRAINT [PK_T_FEEDBACK] PRIMARY KEY CLUSTERED 
(
	[PK_FEEDBACK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_FAQ]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_FAQ](
	[PK_FAQ] [int] IDENTITY(1,1) NOT NULL,
	[FK_LANG] [int] NULL,
	[C_TITLE] [ntext] NULL,
	[C_CONTENT] [ntext] NULL,
	[C_ORDER] [int] NULL,
	[C_DELETE] [bit] NULL,
	[C_SENDER_NAME] [nvarchar](4000) NULL,
	[C_SENDER_EMAIL] [nvarchar](4000) NULL,
	[C_SENDER_DATE] [datetime] NULL,
	[C_ADDRESS] [nvarchar](4000) NULL,
	[C_STATUS] [bit] NULL,
	[C_TYPE] [nvarchar](4000) NULL,
	[FK_MENU] [int] NULL,
 CONSTRAINT [PK_T_FAQ] PRIMARY KEY CLUSTERED 
(
	[PK_FAQ] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DM_VITRI]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DM_VITRI](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[C_MAVT] [nvarchar](50) NOT NULL,
	[C_VITRI_KR] [nvarchar](50) NULL,
	[C_VITRI] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_DM_VITRI] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DM_NGHE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DM_NGHE](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[C_MA] [nvarchar](50) NOT NULL,
	[C_NGHE_KR] [nvarchar](50) NULL,
	[C_NGHE] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_DM_NGHE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DK]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DK](
	[PK_DK] [int] IDENTITY(1,1) NOT NULL,
	[C_HO_TEN] [nvarchar](50) NULL,
	[C_NGAY_SINH] [datetime] NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_TINH] [nvarchar](50) NULL,
	[C_HUYEN] [nvarchar](50) NULL,
	[C_DIA_CHI_HIEN_TAI] [nvarchar](50) NULL,
	[C_THOI_GIAN_HOC] [nvarchar](50) NULL,
	[C_CO_SO_DAO_TAO] [nvarchar](50) NULL,
	[C_PHONE] [nvarchar](50) NULL,
	[C_MOBILE] [nvarchar](50) NULL,
	[C_DIA_CHI_BAO_TIN] [nvarchar](4000) NULL,
	[C_STATUS] [bit] NULL,
	[FK_NGANH] [int] NULL,
	[FK_DON_VI] [int] NULL,
	[C_NGAY_DK] [datetime] NULL,
 CONSTRAINT [PK_T_DK] PRIMARY KEY CLUSTERED 
(
	[PK_DK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DIEUDUONG]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DIEUDUONG](
	[PK_DIEUDUONG] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](50) NULL,
	[C_GIOITINH] [nvarchar](50) NULL,
	[C_HONNHAN] [nvarchar](50) NULL,
	[C_HKTT] [nvarchar](500) NULL,
	[C_SONHA] [nvarchar](50) NULL,
	[C_PHUONG] [nvarchar](50) NULL,
	[C_QUAN] [nvarchar](50) NULL,
	[C_TINH] [nvarchar](50) NULL,
	[C_DIENTHOAI] [nvarchar](50) NULL,
	[C_HOCTAP] [nvarchar](50) NULL,
	[C_NAMHOC] [nvarchar](50) NULL,
	[C_XEPLOAI] [nvarchar](50) NULL,
	[C_CONGVIECLAM] [nvarchar](500) NULL,
	[C_NOILAMVIEC] [nvarchar](500) NULL,
	[C_TRUONGHOC] [nvarchar](500) NULL,
	[C_HEDAOTAO] [nvarchar](50) NULL,
	[C_NGUOILIENHE] [nvarchar](50) NULL,
	[C_QUANHE] [nvarchar](50) NULL,
	[C_DC_NGUOITHAN] [nvarchar](500) NULL,
	[C_TEL_NGUOITHAN] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
 CONSTRAINT [PK_T_DIEUDUONG] PRIMARY KEY CLUSTERED 
(
	[PK_DIEUDUONG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN](
	[PK_DANG_KY] [int] IDENTITY(1,1) NOT NULL,
	[C_HO_TEN] [nvarchar](500) NULL,
	[C_NGAY_SINH] [nvarchar](50) NULL,
	[C_CMND] [nvarchar](500) NULL,
	[C_TINH] [nvarchar](50) NULL,
	[C_HUYEN] [nvarchar](50) NULL,
	[C_DIA_CHI_HIEN_TAI] [nvarchar](500) NULL,
	[C_THOI_GIAN_HOC] [nvarchar](50) NULL,
	[C_CO_SO_DAO_TAO] [nvarchar](500) NULL,
	[C_PHONE] [nvarchar](50) NULL,
	[C_MOBILE] [nvarchar](50) NULL,
	[C_DIA_CHI_BAO_TIN] [nvarchar](500) NULL,
	[C_STATUS] [bit] NULL,
	[C_NGANH] [nvarchar](500) NULL,
	[C_DON_VI] [nvarchar](500) NULL,
	[C_NGAY_DK] [nvarchar](50) NULL,
	[C_SBD] [nvarchar](50) NULL,
	[C_DIEM_DOC] [float] NULL,
	[C_DIEM_NGHE] [float] NULL,
	[C_TRANGTHAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_DIEM_DANG_KY_KIEM_TRA_TIENG_HAN] PRIMARY KEY CLUSTERED 
(
	[PK_DANG_KY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_DANGKY_DAOTAONGHE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_DANGKY_DAOTAONGHE](
	[PK_KHOAHOC] [bigint] IDENTITY(1,1) NOT NULL,
	[C_DONVI] [nvarchar](500) NULL,
	[C_NGANHDAOTAO] [nvarchar](50) NULL,
	[C_THOIGIANDAOTAO] [nvarchar](50) NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_GIOITINH] [nvarchar](50) NULL,
	[C_HOCHIEUCU] [nvarchar](50) NULL,
	[C_HOCHIEUMOI] [nvarchar](50) NULL,
	[C_DIENTHOAI1] [nvarchar](50) NULL,
	[C_DIENTHOAI2] [nvarchar](50) NULL,
	[C_CMNDVN] [nvarchar](50) NULL,
	[C_CMNDNN] [nvarchar](50) NULL,
	[C_NGAYNHAPHQ] [nvarchar](50) NULL,
	[C_NGAYVEVN] [nvarchar](50) NULL,
	[C_HANCUOICMNDNN] [nvarchar](50) NULL,
	[C_EMAIL] [nvarchar](50) NULL,
	[C_QUEQUAN] [nvarchar](50) NULL,
	[C_THUONGTRU] [nvarchar](50) NULL,
	[C_TRINHDO] [nvarchar](50) NULL,
	[C_CTYCUOI] [nvarchar](50) NULL,
	[C_DIENTHOAICTYCUOI] [nvarchar](50) NULL,
	[C_THOIGIANLAMVIEC] [nvarchar](50) NULL,
	[C_QUAYLAIHQ] [nvarchar](50) NULL,
	[C_THI_EPS_TOPIK] [nvarchar](50) NULL,
	[C_NGAYTHI] [nvarchar](50) NULL,
	[C_DIEMTHI] [nvarchar](50) NULL,
	[C_NGAYGUI] [datetime] NULL,
 CONSTRAINT [PK_T_DANGKY_DAOTAONGHE] PRIMARY KEY CLUSTERED 
(
	[PK_KHOAHOC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_CAP_CE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CAP_CE](
	[PK_CE] [int] IDENTITY(1,1) NOT NULL,
	[C_MA_SO_LAO_DONG] [nvarchar](50) NULL,
	[C_HO_TEN] [nvarchar](50) NULL,
	[C_NGAY_SINH] [datetime] NULL,
	[C_DIA_CHI] [nvarchar](50) NULL,
	[C_SO_HO_CHIEU] [nvarchar](50) NULL,
	[C_TRUNG_TAM_DT] [nvarchar](50) NULL,
	[C_MA_TRUNG_TAM] [nvarchar](50) NULL,
	[C_SO_CHUNG_CHI] [nvarchar](50) NULL,
	[C_NGAY_CAP] [datetime] NULL,
 CONSTRAINT [PK_T_CAP_CE] PRIMARY KEY CLUSTERED 
(
	[PK_CE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BOTUC]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BOTUC](
	[PK_BOTUC] [bigint] IDENTITY(1,1) NOT NULL,
	[C_HOTEN] [nvarchar](500) NULL,
	[C_NGAYSINH] [nvarchar](500) NULL,
	[C_GIOITINH] [nvarchar](500) NULL,
	[C_THUONGTRU] [nvarchar](500) NULL,
	[C_NGAYVENUOC] [nvarchar](500) NULL,
	[C_THANGHOC] [nvarchar](500) NULL,
	[C_DIENTHOAI] [nvarchar](500) NULL,
	[C_NGAYDANGKY] [datetime] NULL,
 CONSTRAINT [PK_T_BOTUC] PRIMARY KEY CLUSTERED 
(
	[PK_BOTUC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BAOHIEM]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_BAOHIEM](
	[PK_BAOHIEM] [bigint] IDENTITY(1,1) NOT NULL,
	[C_CMNDNN] [nvarchar](50) NULL,
	[C_HOTEN] [nvarchar](50) NULL,
	[C_NGAYSINH] [nvarchar](50) NULL,
	[C_HOCHIEU] [nvarchar](50) NULL,
	[C_LOAIBH] [nvarchar](50) NULL,
	[C_SOXACNHAN] [nvarchar](50) NULL,
	[C_THOIGIANTHAMGIA] [nvarchar](50) NULL,
	[C_THOIHANKETTHUC] [nvarchar](50) NULL,
	[C_SOTIEN] [nvarchar](50) NULL,
	[C_NGAYVENUOC] [nvarchar](50) NULL,
	[C_DIACHI] [nvarchar](500) NULL,
	[C_ORDER] [bigint] NULL,
 CONSTRAINT [PK_T_BAOHIEM] PRIMARY KEY CLUSTERED 
(
	[PK_BAOHIEM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_BANNER]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BANNER](
	[PK_BANNER] [int] IDENTITY(1,1) NOT NULL,
	[FK_LANG] [int] NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](500) NULL,
	[C_LINK] [nvarchar](300) NULL,
	[C_TYPE] [varchar](50) NULL,
	[C_HITS] [int] NULL,
	[C_SIZE] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_BANNER] PRIMARY KEY CLUSTERED 
(
	[PK_BANNER] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ARTICLE_REPLY]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ARTICLE_REPLY](
	[PK_ARTICLE_REPLY] [int] NOT NULL,
	[FK_ARTICLE] [int] NULL,
	[C_TITLE] [nvarchar](300) NULL,
	[C_CONTENT] [ntext] NULL,
	[C_SENDER_NAME] [nvarchar](300) NULL,
	[C_SENDER_ADDRESS] [nvarchar](300) NULL,
	[C_SENDER_TEL] [nvarchar](50) NULL,
	[C_SENDER_EMAIL] [nvarchar](300) NULL,
	[C_SENDER_DATE] [datetime] NULL,
	[C_ORDER] [tinyint] NULL,
	[C_DELETE] [bit] NULL,
	[C_STATUS] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ARTICLE_FILE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ARTICLE_FILE](
	[PK_ARTICLE_FILE] [int] NOT NULL,
	[FK_ARTICLE] [int] NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_TYPE] [nvarchar](50) NULL,
	[C_CONTENT] [ntext] NULL,
	[C_DELETE] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ARTICLE]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ARTICLE](
	[PK_ARTICLE] [int] IDENTITY(1,1) NOT NULL,
	[FK_MENU] [int] NULL,
	[FK_USER] [int] NULL,
	[FK_USER_EDIT] [int] NULL,
	[C_TITLE] [nvarchar](300) NULL,
	[C_HEAD] [ntext] NULL,
	[C_CONTENT] [ntext] NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](300) NULL,
	[C_IMAGE_FILE_TITLE] [nvarchar](300) NULL,
	[C_FILE_NAME] [nvarchar](300) NULL,
	[C_ENTRY_DATE] [datetime] NULL,
	[C_BEGIN_DATE] [datetime] NULL,
	[C_END_DATE] [datetime] NULL,
	[C_MODIFY_DATE] [datetime] NULL,
	[C_HOT] [bit] NULL,
	[C_ALLOW_REPLY] [bit] NULL,
	[C_HITS] [tinyint] NULL,
	[C_HIT] [int] NULL,
	[FK_ARTICLE] [int] NULL,
	[C_DELETE_MOVE] [bit] NULL,
	[C_DELETE] [bit] NULL,
	[C_ORDER] [int] NULL,
	[C_STATUS] [bit] NULL,
	[C_IS_TITLE] [bit] NULL,
	[C_IS_HEAD] [bit] NULL,
	[C_IS_IMAGE] [bit] NULL,
	[C_IMAGE_WIDTH] [int] NULL,
	[C_IMAGE_HEIGTH] [int] NULL,
	[C_VIP] [bit] NULL,
	[C_MOI] [bit] NULL,
 CONSTRAINT [PK_T_ARTICLE] PRIMARY KEY CLUSTERED 
(
	[PK_ARTICLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ADV]    Script Date: 08/31/2017 16:30:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ADV](
	[PK_ADV] [int] IDENTITY(1,1) NOT NULL,
	[FK_LANG] [int] NULL,
	[C_TYPE] [nvarchar](50) NULL,
	[C_NAME] [nvarchar](300) NULL,
	[C_LINK] [nvarchar](300) NULL,
	[C_IMAGE_FILE_NAME] [nvarchar](300) NULL,
	[C_ORDER] [int] NULL,
	[C_STATUS] [bit] NULL,
	[C_HITS] [int] NULL,
 CONSTRAINT [PK_T_ADV] PRIMARY KEY CLUSTERED 
(
	[PK_ADV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spThongKe_Edit]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spThongKe_Edit]
	AS
	BEGIN
	    DECLARE @SoTruyCapGanNhat bigint
	    DECLARE @Count int
	    SELECT @Count=Count(*) FROM TB_ThongKe ttk
	    IF @Count IS NULL SET @Count=0
	    IF @Count=0
	        INSERT INTO TB_ThongKe(ThoiGian, SoTruyCap)
	        VALUES (GetDate(),1)
	    ELSE
	        BEGIN
	             
	            DECLARE @ThoiGianGanNhat datetime
	            SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
	              FROM TB_ThongKe ttk WHERE ttk.MaTB=(SELECT Max(ttk2.MaTB) FROM TB_ThongKe ttk2)
	            IF @SoTruyCapGanNhat IS NULL SET @SoTruyCapGanNhat=0
	            IF @ThoiGianGanNhat IS NULL SET @ThoiGianGanNhat=getdate()
	            -- Kiểm tra xem lần truy cập này có phải đã sang ngày mới không (Qua thời điểm 12h00)
	            -- Nếu chưa sang ngày mới thì cập nhật lại SoTruyCap
	            IF Day(@ThoiGianGanNhat)=Day(GETDATE())
	                BEGIN
	                    UPDATE TB_ThongKe
	                    SET
	                        SoTruyCap = @SoTruyCapGanNhat+1,
                       ThoiGian = GetDate()
                         
	                    WHERE MaTB=(SELECT Max(ttk2.MaTB) FROM TB_ThongKe ttk2)
	                END
                -- Nếu đã sang ngày mới thì thêm mới bản ghi, SoTruyCap bắt đầu lại là 1
	            ELSE
	                BEGIN
	                    INSERT INTO TB_ThongKe(ThoiGian, SoTruyCap)
	                    VALUES (GetDate(),1)
	                END
	        END
	  
	        -- Thống kê Hom nay, Hom qua, Tuan nay, Tuan Truoc, Thang nay, Thang Truoc
	        DECLARE @HomNay INT
	        SET @HomNay = datepart(dw, GetDate())
	        SELECT @SoTruyCapGanNhat=ttk.SoTruyCap, @ThoiGianGanNhat=ttk.ThoiGian
              FROM TB_ThongKe ttk WHERE ttk.MaTB=(SELECT Max(ttk2.MaTB) FROM TB_ThongKe ttk2)
	        --Tính SoTruyCapHomQua
	        DECLARE @SoTruyCapHomQua bigint
	        SELECT @SoTruyCapHomQua=isnull(SoTruyCap,0) FROM TB_ThongKe 
	            WHERE CONVERT(nvarchar(20),ThoiGian,103)=CONVERT(nvarchar(20),GETDATE()-1,103)
	        IF @SoTruyCapHomQua IS null SET @SoTruyCapHomQua=0
	        -- Tính Ngày đầu tuần này
	        DECLARE @DauTuanNay datetime
	        SET @DauTuanNay= DATEADD(wk, DATEDIFF(wk, 6, GetDate()), 6)
	        -- Tính Ngày đầu của tuần trước Tính từ thời điểm 00:00:))
	        DECLARE @NgayDauTuanTruoc datetime
	        SET @NgayDauTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -(@HomNay+6), GetDate()),101) AS datetime)
	        -- Tính ngày cuối tuần trước tính đến 24h ngày cuối tuần
	        DECLARE @NgayCuoiTuanTruoc datetime
	        SET @NgayCuoiTuanTruoc = Cast(CONVERT(nvarchar(30),DATEADD(dd, -@HomNay, GetDate()),101) +' 23:59:59' AS datetime)
	         
	        -- Tính số truy cập tuần này
	        DECLARE @SoTruyCapTuanNay bigint
        SELECT @SoTruyCapTuanNay=isnull(Sum(SoTruyCap),0) FROM TB_ThongKe ttk
	            WHERE ttk.ThoiGian BETWEEN @DauTuanNay AND getdate()
	          
	        -- Tính số truy cập tuần trước
	        DECLARE @SoLanTruyCapTuanTruoc bigint
	        SELECT @SoLanTruyCapTuanTruoc=isnull(sum(SoTruyCap),0)  FROM TB_ThongKe ttk
	            WHERE ttk.ThoiGian BETWEEN @NgayDauTuanTruoc AND @NgayCuoiTuanTruoc
	         
	        -- Tính số truy cập tháng này
	        DECLARE @SoTruyCapThangNay bigint
	        SELECT @SoTruyCapThangNay=isnull(Sum(SoTruyCap),0)
	            FROM TB_ThongKe ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())
	         
	        -- Tính số truy cập tháng trước
	        DECLARE @SoTruyCapThangTruoc bigint
	        SELECT @SoTruyCapThangTruoc=isnull(Sum(SoTruyCap),0)
	            FROM TB_ThongKe ttk WHERE MONTH(ttk.ThoiGian)=MONTH(GETDATE())-1
	         
	        -- Tính tổng số
	        DECLARE @TongSo bigint
	        SELECT  @TongSo=isnull(Sum(SoTruyCap),0) FROM TB_ThongKe ttk
	         
	        SELECT @SoTruyCapGanNhat AS HomNay,
	        @SoTruyCapHomQua AS HomQua,
	        @SoTruyCapTuanNay AS TuanNay,
	        @SoLanTruyCapTuanTruoc AS TuanTruoc,
	        @SoTruyCapThangNay AS ThangNay,
	        @SoTruyCapThangTruoc AS ThangTruoc,
	        @TongSo AS TatCa
	END
GO
/****** Object:  StoredProcedure [dbo].[sp_Update_EPS]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Update_EPS]
	@C_HOTEN nvarchar(50),
	@C_CMND nvarchar(50),
	@C_NGAYSINH nvarchar(50),
	@C_HOCHIEU nvarchar(50),
	@C_SBD nvarchar(50),
	@C_TINHTRANG nvarchar(MAX),	
	@C_ORDER int
AS

SET NOCOUNT ON
IF NOT EXISTS(SELECT [C_HOTEN] FROM [dbo].[T_TINHTRANG_HS] WHERE [C_HOTEN] = @C_HOTEN and [C_CMND]=@C_CMND)

BEGIN


INSERT INTO [dbo].[T_TINHTRANG_HS] (
	   [C_HOTEN]
      ,[C_CMND]
      ,[C_NGAYSINH]
      ,[C_HOCHIEU]
      ,[C_SBD]
      ,[C_TINHTRANG]
      ,[C_ORDER]

) VALUES (
	@C_HOTEN,
	@C_CMND,
	@C_NGAYSINH,
	@C_HOCHIEU,	
	@C_SBD,
	@C_TINHTRANG,
	@C_ORDER
)

END

ELSE

UPDATE [dbo].[T_TINHTRANG_HS] 
SET 
[C_TINHTRANG]=[C_TINHTRANG] + '<br />' + @C_TINHTRANG
WHERE [C_HOTEN] = @C_HOTEN and [C_CMND]=@C_CMND


--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_TuyendungKR_Update]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_TuyendungKR_Update]
	@Tencongty nvarchar(500),
	@Nganhnghe nvarchar(500),
	@Mota nvarchar(500),
	@Diachi nvarchar(500),
	@huyen nvarchar(500),
	@tinh nvarchar(500),
	@Website nvarchar(500),
	@Mr nvarchar(500),
	@Nguoilienhe nvarchar(500),
	@Chucdanh nvarchar(500),
	@DTlienhe nvarchar(500),
	@Email nvarchar(500),
	@MaTuyendung nvarchar(500)		
AS

SET NOCOUNT ON

update [dbo].[T_TUYENDUNG_KR] set	  
	 [C_TENCTY]=@Tencongty
      ,[C_NGANHNGHE]=@Nganhnghe
      ,[C_MOTA]=@Mota
      ,[C_DIACHICTY]=@Diachi
	  ,C_HUYEN=@huyen
	  ,C_TINH=@tinh
      ,[C_WEBSITE]=@Website
	  ,C_MR=@Mr
      ,[C_NGUOILIENHE]=@Nguoilienhe
      ,[C_CHUCDANH]=@Chucdanh
      ,[C_DTLIENHE]=@DTlienhe
      ,[C_EMAIL]=@Email
where [C_MATUYENDUNG]=@MaTuyendung 



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_TuyendungKR_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_TuyendungKR_Insert]
	@Tencongty nvarchar(500),
	@Nganhnghe nvarchar(500),
	@Mota nvarchar(500),
	@Diachi nvarchar(500),
	@huyen nvarchar(500),
	@tinh nvarchar(500),
	@Website nvarchar(500),
	@Mr nvarchar(500),
	@Nguoilienhe nvarchar(500),
	@Chucdanh nvarchar(500),
	@DTlienhe nvarchar(500),
	@Email nvarchar(500),
	@MaTuyendung nvarchar(500)	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_TUYENDUNG_KR] (
	   [C_TENCTY]
      ,[C_NGANHNGHE]
      ,[C_MOTA]
      ,[C_DIACHICTY]
	  ,C_HUYEN
	  ,C_TINH
      ,[C_WEBSITE]
	  ,C_MR
      ,[C_NGUOILIENHE]
      ,[C_CHUCDANH]
      ,[C_DTLIENHE]
      ,[C_EMAIL]
      ,[C_MATUYENDUNG]
	  ,[C_NGAYDK]

) VALUES (
	    @Tencongty,
		@Nganhnghe,
		@Mota,
		@Diachi,
		@huyen,
		@tinh,
		@Website,
		@Mr,
		@Nguoilienhe,
		@Chucdanh,
		@DTlienhe,
		@Email,
		@MaTuyendung
	    ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Tuyendung_Vieclam_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Tuyendung_Vieclam_Insert]
	@FK_CTY nvarchar(500),
	@C_VITRI nvarchar(500),
	@C_MOTA nvarchar(500),
	@C_SOLUONGTUYEN nvarchar(500),
	@C_KYNANGGIAOTIEPTIENGHAN nvarchar(500),
	@C_NGHELAMVIEC nvarchar(500),
	@C_NAMLAMVIEC nvarchar(500),
	@C_BANGCAP nvarchar(500),
	@C_CHITIETBANGCAP nvarchar(500),
	@C_TUOITU nvarchar(500),
	@C_TUOIDEN nvarchar(500),
	@C_GIOITINH nvarchar(500),
	@C_NOICUTRU nvarchar(500),
	@C_MUCLUONGTOITHIEU nvarchar(500),
	@C_THUONG nvarchar(500),
	@C_THANGQUYNAM nvarchar(500),
	@C_CHEDOKHAC nvarchar(500),
	@C_HOSO nvarchar(500),
	@C_THOIGIANNHANTU nvarchar(500),
	@C_THOIGIANNHANDEN nvarchar(500),
	@C_THOIGIANTUYEN nvarchar(500)
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_TUYENDUNG_VIECLAM] (
	   [FK_CTY]
      ,[C_VITRI]
      ,[C_MOTA]
      ,[C_SOLUONGTUYEN]
      ,[C_KYNANGGIAOTIEPTIENGHAN]
      ,[C_NGHELAMVIEC]
      ,[C_NAMLAMVIEC]
      ,[C_BANGCAP]
      ,[C_CHITIETBANGCAP]
      ,[C_TUOITU]
      ,[C_TUOIDEN]
      ,[C_GIOITINH]
      ,[C_NOICUTRU]
      ,[C_MUCLUONGTOITHIEU]
      ,[C_THUONG]
      ,[C_THANGQUYNAM]
      ,[C_CHEDOKHAC]
      ,[C_HOSO]
      ,[C_THOIGIANNHANTU]
      ,[C_THOIGIANNHANDEN]
      ,[C_THOIGIANTUYEN]
	  ,C_NGAY

) VALUES (
	   @FK_CTY
      ,@C_VITRI
      ,@C_MOTA
      ,@C_SOLUONGTUYEN
      ,@C_KYNANGGIAOTIEPTIENGHAN
      ,@C_NGHELAMVIEC
      ,@C_NAMLAMVIEC
      ,@C_BANGCAP
      ,@C_CHITIETBANGCAP
      ,@C_TUOITU
      ,@C_TUOIDEN
      ,@C_GIOITINH
      ,@C_NOICUTRU
      ,@C_MUCLUONGTOITHIEU
      ,@C_THUONG
      ,@C_THANGQUYNAM
      ,@C_CHEDOKHAC
      ,@C_HOSO
      ,@C_THOIGIANNHANTU
      ,@C_THOIGIANNHANDEN
      ,@C_THOIGIANTUYEN
	  ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Tuyendung_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Tuyendung_Insert]
	@Tencongty nvarchar(500),
	@Nganhnghe nvarchar(500),
	@Diachi nvarchar(500),
	@Dienthoai nvarchar(500),
	@Email nvarchar(500),
	@Vitri nvarchar(500),
	@Dieukien nvarchar(500),
	@Yeucau nvarchar(500),
	@Soluong nvarchar(500),
	@Thunhap nvarchar(500),
	@Hoso nvarchar(500),
	@Thoigiannhanhs nvarchar(500),
	@Thoigiannhanhsden nvarchar(500)	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_TUYENDUNG] (
		[C_TENCTY]
      ,[C_NGANHNGHE]
      ,[C_DIACHI]
      ,[C_DIENTHOAI]
      ,[C_EMAIL]
      ,[C_VITRI]
      ,[C_DIEUKIEN]
      ,[C_YEUCAU]
      ,[C_SOLUONG]
      ,[C_THUNHAP]
      ,[C_HOSO]
      ,[C_THOIGIANNHAN],C_NHANHSDEN
      ,[C_NGAYGUI]

) VALUES (
	    @Tencongty,
		@Nganhnghe,
		@Diachi,
		@Dienthoai,
		@Email,
		@Vitri,
		@Dieukien,
		@Yeucau,
		@Soluong,
		@Thunhap,
		@Hoso,
		@Thoigiannhanhs	,@Thoigiannhanhsden	 
	    ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Timviec_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Timviec_Insert]
	@Hoten nvarchar(500),
	@Ngaysinh nvarchar(500),
	@Gioitinh nvarchar(500),
	@Diachiguithu nvarchar(500),
	@Email nvarchar(500),
	@Dienthoai nvarchar(500),
	@Ngayxuatcanh nvarchar(500),
	@Ngayvenuoc nvarchar(500),
	@Trinhdo nvarchar(500),
	@Congviecmongmuon nvarchar(500),
	@Mucluong nvarchar(500),
	@Diachilamviec nvarchar(500),
	@Congvieccuthe nvarchar(500),
	@Thoigianlamviec nvarchar(500),
	@Tennuoc nvarchar(500),
	@Ngoaingu nvarchar(500),
	@Bangcap nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_TIMVIEC] (
		[C_HOTEN]
      ,[C_NGAYSINH]
      ,[C_GIOITINH]
      ,[C_DIACHIGUITHU]
      ,[C_EMAIL]
      ,[C_DIENTHOAI]
      ,[C_NGAYXUATCANH]
      ,[C_NGAYVENUOC]
      ,[C_TRINHDO]
      ,[C_CONGVIECMONGMUON]
      ,[C_MUCLUONG]
      ,[C_DIACHILAMVIEC]
      ,[C_CONGVIECCUTHE]
      ,[C_THOIGIANLAMVIEC]
      ,[C_TENNUOC]
      ,[C_NGOAINGU]
      ,[C_NGAYGUI],C_BANGCAP

) VALUES (
	    @Hoten,
		@Ngaysinh,
		@Gioitinh,
		@Diachiguithu,
		@Email,
		@Dienthoai,
		@Ngayxuatcanh,
		@Ngayvenuoc,
		@Trinhdo,
		@Congviecmongmuon,
		@Mucluong,
		@Diachilamviec,
		@Congvieccuthe,
		@Thoigianlamviec,
		@Tennuoc,
		@Ngoaingu   
	  ,getdate(),@Bangcap
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_danop_hoso]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_NLD_danop_hoso]
	@Hoten as nvarchar(250),
	@Ngaysinh as nvarchar(250)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT * from T_NOP_HOSO where 1=1
   and C_HOTEN like '%'+@Hoten+'%'
   and C_NGAYSINH like '%'+@Ngaysinh+'%'


END
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_dangky_timviec_tai_Phien_KR_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_NLD_dangky_timviec_tai_Phien_KR_Insert]
	@FK_PHIEN int,
	@FK_MATV nvarchar(500)

AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_NGUOILAODONG_TV] (
	   [FK_PHIEN]     
      ,[FK_MATV]
	  ,C_NGAYGUI

) VALUES (
	   @FK_PHIEN
      ,@FK_MATV     
	  ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_dangky_timviec_KR_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_NLD_dangky_timviec_KR_Insert]
	@FK_TUYENDUNGVL int,
	@FK_MATV nvarchar(500)

AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_NGUOILAODONG_TV] (
	   [FK_TUYENDUNGVL]     
      ,[FK_MATV]
	  ,C_NGAYGUI

) VALUES (
	   @FK_TUYENDUNGVL
      ,@FK_MATV     
	  ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_dangky_timviec]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_NLD_dangky_timviec]
	@Hoten as nvarchar(250),
	@Ngaysinh as nvarchar(250)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT * from T_TIMVIEC where 1=1
   and C_HOTEN like '%'+@Hoten+'%'
   and C_NGAYSINH like '%'+@Ngaysinh+'%'


END
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_dangky_KR_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_NLD_dangky_KR_Insert]
	  @C_HODEM nvarchar(500),
      @C_TEN nvarchar(500),
      @C_NGAYSINH datetime,
      @C_GIOITINH nvarchar(500),
      @C_CMND nvarchar(500),
      @C_NOICUTRU nvarchar(500),
      @C_HUYEN nvarchar(500),
      @C_TINH nvarchar(500),
      @C_CHUONGTRINH nvarchar(500),
      @C_SOID nvarchar(500),
      @C_NGAYXUATCANH datetime,
      @C_NGAYVENUOC datetime,
      @C_DIENTHOAI nvarchar(500),
      @C_EMAIL nvarchar(500),
      @C_NGOAINGU nvarchar(500),
      @C_CHUNGCHI nvarchar(500),
      @C_DAOTAONGHE1 nvarchar(500),
      @C_DAOTAOTU1 nvarchar(500),
      @C_DAOTAODEN1 nvarchar(500),
      @C_BANGCAP1 nvarchar(500),
      @C_BANGCAPKHAC1 nvarchar(500),
      @C_NGHELAMVIEC1 nvarchar(500),
      @C_CVCUTHE1 nvarchar(500),
      @C_CVCUTHETU1 nvarchar(500),
      @C_CVCUTHEDEN1 nvarchar(500),
     -- @C_DAOTAONGHE2 nvarchar(500),
     --- @C_DAOTAOTU2 datetime,
     -- @C_DAOTAODEN2 datetime,
     -- @C_BANGCAP2 nvarchar(500),
     -- @C_BANGCAPKHAC2 nvarchar(500), 
      @C_NGHELAMVIEC2 nvarchar(500),
      @C_CVCUTHE2 nvarchar(500),
      @C_CVCUTHETU2 datetime,
      @C_CVCUTHEDEN2 datetime,
     -- @C_DAOTAONGHE3 nvarchar(500),
    --  @C_DAOTAOTU3 nvarchar(500),
    --  @C_DAOTAODEN3 nvarchar(500),
     -- @C_BANGCAP3 nvarchar(500),
     -- @C_BANGCAPKHAC3 nvarchar(500),
      @C_NGHELAMVIEC3 nvarchar(500),
      @C_CVCUTHE3 nvarchar(500),
      @C_CVCUTHETU3 datetime,
      @C_CVCUTHEDEN3 datetime,
      @C_NGANHNGHEDUKIENTIM nvarchar(500),
      @C_VITRIMONGMUON nvarchar(500),
      @C_MUCLUONGMONGMUON nvarchar(500),
      @C_DIADIEMMONGMUON nvarchar(500),
      @C_MATIMVIEC nvarchar(500)     
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_NGUOILAODONG] (
	  [C_HODEM]
      ,[C_TEN]
      ,[C_NGAYSINH]
      ,[C_GIOITINH]
      ,[C_CMND]
      ,[C_NOICUTRU]
      ,[C_HUYEN]
      ,[C_TINH]
      ,[C_CHUONGTRINH]
      ,[C_SOID]
      ,[C_NGAYXUATCANH]
      ,[C_NGAYVENUOC]
      ,[C_DIENTHOAI]
      ,[C_EMAIL]
      ,[C_NGOAINGU]
      ,[C_CHUNGCHI]
      ,[C_DAOTAONGHE1]
      ,[C_DAOTAOTU1]
      ,[C_DAOTAODEN1]
      ,[C_BANGCAP1]
      ,[C_BANGCAPKHAC1]
      ,[C_NGHELAMVIEC1]
      ,[C_CVCUTHE1]
      ,[C_CVCUTHETU1]
      ,[C_CVCUTHEDEN1]
     -- ,[C_DAOTAONGHE2]
    --  ,[C_DAOTAOTU2]
    --  ,[C_DAOTAODEN2]
     -- ,[C_BANGCAP2]
     -- ,[C_BANGCAPKHAC2]
      ,[C_NGHELAMVIEC2]
      ,[C_CVCUTHE2]
      ,[C_CVCUTHETU2]
      ,[C_CVCUTHEDEN2]
    --  ,[C_DAOTAONGHE3]
    --  ,[C_DAOTAOTU3]
    --  ,[C_DAOTAODEN3]
     -- ,[C_BANGCAP3]
     -- ,[C_BANGCAPKHAC3]
      ,[C_NGHELAMVIEC3]
      ,[C_CVCUTHE3]
      ,[C_CVCUTHETU3]
      ,[C_CVCUTHEDEN3]
      ,[C_NGANHNGHEDUKIENTIM]
      ,[C_VITRIMONGMUON]
      ,[C_MUCLUONGMONGMUON]
      ,[C_DIADIEMMONGMUON]
      ,[C_MATIMVIEC]
      ,[C_NGAYDK]

) VALUES (
	  @C_HODEM,
      @C_TEN,
      @C_NGAYSINH,
      @C_GIOITINH,
      @C_CMND,
      @C_NOICUTRU,
      @C_HUYEN,
      @C_TINH,
      @C_CHUONGTRINH,
      @C_SOID,
      @C_NGAYXUATCANH,
      @C_NGAYVENUOC,
      @C_DIENTHOAI,
      @C_EMAIL,
      @C_NGOAINGU,
      @C_CHUNGCHI,
      @C_DAOTAONGHE1,
      @C_DAOTAOTU1,
      @C_DAOTAODEN1,
      @C_BANGCAP1,
      @C_BANGCAPKHAC1,
      @C_NGHELAMVIEC1,
      @C_CVCUTHE1,
      @C_CVCUTHETU1,
      @C_CVCUTHEDEN1,
   --   @C_DAOTAONGHE2,
   --   @C_DAOTAOTU2,
   --   @C_DAOTAODEN2,
    --  @C_BANGCAP2,
    --  @C_BANGCAPKHAC2,
      @C_NGHELAMVIEC2,
      @C_CVCUTHE2,
      @C_CVCUTHETU2,
      @C_CVCUTHEDEN2,
    --  @C_DAOTAONGHE3,
    --  @C_DAOTAOTU3,
    --  @C_DAOTAODEN3,
     -- @C_BANGCAP3,
    --  @C_BANGCAPKHAC3,
      @C_NGHELAMVIEC3,
      @C_CVCUTHE3,
      @C_CVCUTHETU3,
      @C_CVCUTHEDEN3,
      @C_NGANHNGHEDUKIENTIM,
      @C_VITRIMONGMUON,
      @C_MUCLUONGMONGMUON,
      @C_DIADIEMMONGMUON,
      @C_MATIMVIEC,
	   getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_NLD_chuanhantienbaohiem]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_NLD_chuanhantienbaohiem]
	@Hoten as nvarchar(250),
	@Ngaysinh as nvarchar(250)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT * from T_BAOHIEM where 1=1
   and C_HOTEN like '%'+@Hoten+'%'
   and C_NGAYSINH like '%'+@Ngaysinh+'%'


END
GO
/****** Object:  StoredProcedure [dbo].[sp_Khaibaothongtin_HQ_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Khaibaothongtin_HQ_Insert]
	@C_HOTEN nvarchar(500),
	@C_HOCHIEU nvarchar(500),
	@C_CMND nvarchar(500),
	@C_EMAIL nvarchar(500),
	@C_MUCDICH nvarchar(500),
	@C_TENDN nvarchar(500),
	@C_NGUOISUDUNGLAODONG nvarchar(500),
	@C_DIENTHOAIDN nvarchar(500),
	@C_DIACHIDN nvarchar(500),
	@C_SOTHE nvarchar(500),
	@C_DIENTHOAI nvarchar(500),
	@C_HOPDONGTU nvarchar(500),
	@C_HOPDONGDEN nvarchar(500),
	@C_LYDO nvarchar(500),
	@C_NGAYHETHAN nvarchar(500),
	@C_NGAYDANGKYVENUOC nvarchar(500)
AS
SET NOCOUNT ON
INSERT INTO [dbo].[T_KHAIBAO_THONGTIN] (
	   [C_HOTEN],[C_HOCHIEU],[C_CMND],[C_EMAIL],[C_MUCDICH],[C_TENDN],[C_NGUOISUDUNGLAODONG],[C_DIENTHOAIDN]
      ,[C_DIACHIDN]
      ,[C_SOTHE]
      ,[C_DIENTHOAI]
      ,[C_HOPDONGTU]
      ,[C_HOPDONGDEN]
      ,[C_LYDO]
      ,[C_NGAYHETHAN]
      ,[C_NGAYDANGKYVENUOC]
      ,[C_NGAYGUI]

) VALUES (
	@C_HOTEN,
	@C_HOCHIEU,
	@C_CMND,
	@C_EMAIL,	
	@C_MUCDICH,
	@C_TENDN,
	@C_NGUOISUDUNGLAODONG,	@C_DIENTHOAIDN,@C_DIACHIDN,@C_SOTHE,@C_DIENTHOAI,@C_HOPDONGTU,@C_HOPDONGDEN,@C_LYDO,@C_NGAYHETHAN,@C_NGAYDANGKYVENUOC,
	getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Import_khaibaothongtin]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Import_khaibaothongtin]
	@C_MUCDICH nvarchar(500),
	@C_HOTEN nvarchar(500),
	@C_HOCHIEU nvarchar(500),
	@C_NGAYNHAPCANH nvarchar(500),
	@C_CMND nvarchar(500),
	@C_SOTHE nvarchar(500),
	@C_DIENTHOAI nvarchar(500),
	@C_EMAIL nvarchar(500),
	
	@C_TENDN1 nvarchar(500),
	@C_NGUOISUDUNGLAODONG1 nvarchar(500),
	@C_DIENTHOAIDN1 nvarchar(500),
	@C_DIACHIDN1 nvarchar(500),
	@C_NGAYLAMVIECDN1 nvarchar(500), 

	@C_TENDN2 nvarchar(500),
	@C_NGUOISUDUNGLAODONG2 nvarchar(500),
	@C_DIENTHOAIDN2 nvarchar(500),
	@C_DIACHIDN2 nvarchar(500),
	@C_NGAYLAMVIECDN2 nvarchar(500), 

	  @C_TENDN3 nvarchar(500),
	@C_NGUOISUDUNGLAODONG3 nvarchar(500),
	@C_DIENTHOAIDN3 nvarchar(500),
	@C_DIACHIDN3 nvarchar(500),
	@C_NGAYLAMVIECDN3 nvarchar(500), 

	  @C_TENDN4 nvarchar(500),
	@C_NGUOISUDUNGLAODONG4 nvarchar(500),
	@C_DIENTHOAIDN4 nvarchar(500),
	@C_DIACHIDN4 nvarchar(500),
	@C_NGAYLAMVIECDN4 nvarchar(500), 

	  @C_TENDN5 nvarchar(500),
	@C_NGUOISUDUNGLAODONG5 nvarchar(500),
	@C_DIENTHOAIDN5 nvarchar(500),
	@C_DIACHIDN5 nvarchar(500),
	@C_NGAYLAMVIECDN5 nvarchar(500), 


	@C_HOPDONGDEN nvarchar(500), 
	@C_LYDO nvarchar(500), 
	@C_NGAYHETHAN nvarchar(500), 
	@C_NGAYDANGKYVENUOC nvarchar(500)
	
	
AS

SET NOCOUNT ON
INSERT INTO [dbo].[T_KHAIBAO_THONGTIN] (
	   [C_HOTEN],[C_HOCHIEU],C_NGAYNHAPCANH,[C_CMND],[C_SOTHE],[C_DIENTHOAI],[C_EMAIL],[C_MUCDICH],
	   [C_TENDN1],[C_NGUOISUDUNGLAODONG1],[C_DIENTHOAIDN1],[C_DIACHIDN1],C_NGAYLAMVIECDN1,
	   [C_TENDN2],[C_NGUOISUDUNGLAODONG2],[C_DIENTHOAIDN2],[C_DIACHIDN2],C_NGAYLAMVIECDN2,
	   [C_TENDN3],[C_NGUOISUDUNGLAODONG3],[C_DIENTHOAIDN3],[C_DIACHIDN3],C_NGAYLAMVIECDN3,
	   [C_TENDN4],[C_NGUOISUDUNGLAODONG4],[C_DIENTHOAIDN4],[C_DIACHIDN4],C_NGAYLAMVIECDN4,
	   [C_TENDN5],[C_NGUOISUDUNGLAODONG5],[C_DIENTHOAIDN5],[C_DIACHIDN5],C_NGAYLAMVIECDN5,
	   C_HOPDONGDEN,C_LYDO,C_NGAYHETHAN,C_NGAYDANGKYVENUOC, [C_NGAYGUI],C_NGAYKHAIBAOCUOI,C_NGAYKHAIBAODAU
) VALUES (
	   @C_HOTEN, @C_HOCHIEU, @C_NGAYNHAPCANH, @C_CMND, @C_SOTHE, @C_DIENTHOAI, @C_EMAIL, @C_MUCDICH, 
	   @C_TENDN1, @C_NGUOISUDUNGLAODONG1, @C_DIENTHOAIDN1, @C_DIACHIDN1, @C_NGAYLAMVIECDN1, 
	   @C_TENDN2, @C_NGUOISUDUNGLAODONG2, @C_DIENTHOAIDN2, @C_DIACHIDN2, @C_NGAYLAMVIECDN2, 
	   @C_TENDN3, @C_NGUOISUDUNGLAODONG3, @C_DIENTHOAIDN3, @C_DIACHIDN3, @C_NGAYLAMVIECDN3, 
	   @C_TENDN4, @C_NGUOISUDUNGLAODONG4, @C_DIENTHOAIDN4, @C_DIACHIDN4, @C_NGAYLAMVIECDN4, 
	   @C_TENDN5, @C_NGUOISUDUNGLAODONG5, @C_DIENTHOAIDN5, @C_DIACHIDN5, @C_NGAYLAMVIECDN5, 
	   @C_HOPDONGDEN, @C_LYDO, @C_NGAYHETHAN, @C_NGAYDANGKYVENUOC,getdate(),getdate(),getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Import_GDVL]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Import_GDVL]
	@FK_PHIEN int,
	@C_CTY nvarchar(500),
	@C_VITRI nvarchar(500),
	@C_DIACHI nvarchar(500),
	@C_TEL nvarchar(500)
		
AS

SET NOCOUNT ON
INSERT INTO [dbo].[T_PHIEN_GDVL_CHITIET] (
	   [FK_PHIEN],[C_CTY],[C_VITRI],[C_DIACHI],[C_TEL]
) VALUES (
	   @FK_PHIEN, @C_CTY, @C_VITRI, @C_DIACHI, @C_TEL
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_IM_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_IM_Insert]
	@Hoten nvarchar(500),
	@Ngaysinh nvarchar(500),
	@CMND nvarchar(500),
	@Trinhdo nvarchar(500),
	@Honnhan nvarchar(500),
	@Hokhau nvarchar(500),
	@Sonhan nvarchar(500),
	@Phuongxa nvarchar(500),
	@Quanhuyen nvarchar(500),
	@Thanhpho nvarchar(500),
	@Dienthoai1 nvarchar(500),
	@Dienthoai2 nvarchar(500),
	@Nguoilienhe nvarchar(500),
	@Quanhe nvarchar(500),
	@Diachi nvarchar(500),
	@Dienthoai nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_IM] (
		[C_HOTEN]
      ,[C_NGAYSINH]
      ,[C_CMND]
      ,[C_TRINHDO]
      ,[C_HONNHAN]
      ,[C_HOKHAU]
      ,[C_SONHA]
      ,[C_PHUONGXA]
      ,[C_QUANHUYEN]
      ,[C_THANHPHO]
      ,[C_DIENTHOAI1]
      ,[C_DIENTHOAI2]
      ,[C_NGUOILIENHE]
      ,[C_QUANHE]
      ,[C_DIACHI]
      ,[C_DIENTHOAI]
      ,[C_NGAYDANGKY]

) VALUES (
	  @Hoten
      ,@Ngaysinh
      ,@CMND
      ,@Trinhdo
      ,@Honnhan
      ,@Hokhau
      ,@Sonhan
      ,@Phuongxa
      ,@Quanhuyen
      ,@Thanhpho
      ,@Dienthoai1
      ,@Dienthoai2
      ,@Nguoilienhe
      ,@Quanhe
      ,@Diachi
      ,@Dienthoai      
	  ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Getinfo_EPS]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Getinfo_EPS]
	@Hoten as nvarchar(250),
	@sbd as nvarchar(250),
	@cmnd as nvarchar(250),
	@hc as nvarchar(250)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT * from T_TINHTRANG_HS where 1=1
   and C_HOTEN like '%'+@Hoten+'%'
   and (([C_SBD] like '%'+@sbd+'%') or ([C_CMND] like '%' + @cmnd + '%') or ([C_HOCHIEU] like '%' + @hc + '%'))


END
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_searching_by_Hochieu_Hoten_Sothe]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_searching_by_Hochieu_Hoten_Sothe]
	@C_HOCHIEU as nvarchar(250),
	@C_HOTEN as nvarchar(250),
	@C_SOTHE as nvarchar(250)
AS
BEGIN
	
   SET NOCOUNT ON;


   

   SELECT * from T_KHAIBAO_THONGTIN where 1=1
   and C_HOCHIEU =@C_HOCHIEU
   and C_HOTEN=@C_HOTEN
   and C_SOTHE=@C_SOTHE

   


END
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_searching_by_Hochieu_Hoten]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_searching_by_Hochieu_Hoten]
	@C_HOCHIEU as nvarchar(250),
	@C_HOTEN as nvarchar(250)
	
AS
BEGIN
	
   SET NOCOUNT ON;
     

   SELECT * from T_KHAIBAO_THONGTIN where 1=1
   and C_HOCHIEU = @C_HOCHIEU
   and C_HOTEN = @C_HOTEN
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaothaydoisodienthoai_Update]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoisodienthoai_Update]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),
	@C_DIENTHOAI nvarchar(50)	
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,
      C_DIENTHOAI=@C_DIENTHOAI,
	  C_NGAYGUI=getdate()
where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_5]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_5]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),

	@C_TENDN5 nvarchar(500),	
	@C_NGUOISUDUNGLAODONG5 nvarchar(500),
	@C_DIENTHOAIDN5 nvarchar(50),
	@C_DIACHIDN5 nvarchar(500),
	@C_NGAYLAMVIECDN5 nvarchar(500)
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,

      C_TENDN5=@C_TENDN5,
	  C_NGUOISUDUNGLAODONG5=@C_NGUOISUDUNGLAODONG5,
	  C_DIENTHOAIDN5=@C_DIENTHOAIDN5,
	  C_DIACHIDN5=@C_DIACHIDN5,
	  C_NGAYLAMVIECDN5=@C_NGAYLAMVIECDN5,

	  C_TENDN_HIENTAI=@C_TENDN5,
	  C_NGUOISUDUNGLAODONG_HIENTAI=@C_NGUOISUDUNGLAODONG5,
	  C_DIENTHOAIDN_HIENTAI=@C_DIENTHOAIDN5,
	  C_DIACHIDN_HIENTAI=@C_DIACHIDN5,
	  C_NGAYLAMVIECDN_HIENTAI=@C_NGAYLAMVIECDN5,


	  C_NGAYGUI=getdate()

where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_4]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_4]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),

	@C_TENDN4 nvarchar(500),	
	@C_NGUOISUDUNGLAODONG4 nvarchar(500),
	@C_DIENTHOAIDN4 nvarchar(50),
	@C_DIACHIDN4 nvarchar(500),
	@C_NGAYLAMVIECDN4 nvarchar(500)
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,

      C_TENDN4=@C_TENDN4,
	  C_NGUOISUDUNGLAODONG4=@C_NGUOISUDUNGLAODONG4,
	  C_DIENTHOAIDN4=@C_DIENTHOAIDN4,
	  C_DIACHIDN4=@C_DIACHIDN4,
	  C_NGAYLAMVIECDN4=@C_NGAYLAMVIECDN4,

	  C_TENDN_HIENTAI=@C_TENDN4,
	  C_NGUOISUDUNGLAODONG_HIENTAI=@C_NGUOISUDUNGLAODONG4,
	  C_DIENTHOAIDN_HIENTAI=@C_DIENTHOAIDN4,
	  C_DIACHIDN_HIENTAI=@C_DIACHIDN4,
	  C_NGAYLAMVIECDN_HIENTAI=@C_NGAYLAMVIECDN4,


	  C_NGAYGUI=getdate()

where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_3]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_3]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),

	@C_TENDN3 nvarchar(500),	
	@C_NGUOISUDUNGLAODONG3 nvarchar(500),
	@C_DIENTHOAIDN3 nvarchar(50),
	@C_DIACHIDN3 nvarchar(500),
	@C_NGAYLAMVIECDN3 nvarchar(500)
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,

      C_TENDN3=@C_TENDN3,
	  C_NGUOISUDUNGLAODONG3=@C_NGUOISUDUNGLAODONG3,
	  C_DIENTHOAIDN3=@C_DIENTHOAIDN3,
	  C_DIACHIDN3=@C_DIACHIDN3,
	  C_NGAYLAMVIECDN3=@C_NGAYLAMVIECDN3,

	  C_TENDN_HIENTAI=@C_TENDN3,
	  C_NGUOISUDUNGLAODONG_HIENTAI=@C_NGUOISUDUNGLAODONG3,
	  C_DIENTHOAIDN_HIENTAI=@C_DIENTHOAIDN3,
	  C_DIACHIDN_HIENTAI=@C_DIACHIDN3,
	  C_NGAYLAMVIECDN_HIENTAI=@C_NGAYLAMVIECDN3,


	  C_NGAYGUI=getdate()

where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_2]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoinoilamvie_Update_Lan_2]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),

	@C_TENDN2 nvarchar(500),	
	@C_NGUOISUDUNGLAODONG2 nvarchar(500),
	@C_DIENTHOAIDN2 nvarchar(50),
	@C_DIACHIDN2 nvarchar(500),
	@C_NGAYLAMVIECDN2 nvarchar(500)
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,

      C_TENDN2=@C_TENDN2,
	  C_NGUOISUDUNGLAODONG2=@C_NGUOISUDUNGLAODONG2,
	  C_DIENTHOAIDN2=@C_DIENTHOAIDN2,
	  C_DIACHIDN2=@C_DIACHIDN2,
	  C_NGAYLAMVIECDN2=@C_NGAYLAMVIECDN2,
	  C_NGAYGUI=getdate(),


	  C_TENDN_HIENTAI=@C_TENDN2,
	  C_NGUOISUDUNGLAODONG_HIENTAI=@C_NGUOISUDUNGLAODONG2,
	  C_DIENTHOAIDN_HIENTAI=@C_DIENTHOAIDN2,
	  C_DIACHIDN_HIENTAI=@C_DIACHIDN2,
	  C_NGAYLAMVIECDN_HIENTAI=@C_NGAYLAMVIECDN2

where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaolandau_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaolandau_Insert]
	@C_NAME nvarchar(500),
	@C_HOTEN nvarchar(500),
	@C_HOCHIEU nvarchar(500),
	@C_NGAYNHAPCANH nvarchar(500),
	@C_CMND nvarchar(500),
	@C_EMAIL nvarchar(500),
	@C_MUCDICH nvarchar(500),
	
	@C_TENDN1 nvarchar(500),
	@C_NGUOISUDUNGLAODONG1 nvarchar(500),
	@C_DIENTHOAIDN1 nvarchar(500),
	@C_DIACHIDN1 nvarchar(500),
	@C_NGAYLAMVIECDN1 nvarchar(500), 
	@C_SOTHE nvarchar(500),
	@C_DIENTHOAI nvarchar(500)
AS

SET NOCOUNT ON
INSERT INTO [dbo].[T_KHAIBAO_THONGTIN] (C_NAME,
	   [C_HOTEN],[C_HOCHIEU],[C_CMND],[C_EMAIL],[C_MUCDICH],[C_TENDN1],[C_NGUOISUDUNGLAODONG1],[C_DIENTHOAIDN1],[C_DIACHIDN1],C_NGAYLAMVIECDN1,[C_SOTHE],[C_DIENTHOAI],[C_NGAYGUI],C_NGAYNHAPCANH,C_NGAYKHAIBAODAU,

	   C_TENDN_HIENTAI, C_NGUOISUDUNGLAODONG_HIENTAI, C_DIENTHOAIDN_HIENTAI, C_DIACHIDN_HIENTAI, C_NGAYLAMVIECDN_HIENTAI

) VALUES (@C_NAME,
	   @C_HOTEN,@C_HOCHIEU,@C_CMND,@C_EMAIL,@C_MUCDICH,@C_TENDN1,@C_NGUOISUDUNGLAODONG1,@C_DIENTHOAIDN1,@C_DIACHIDN1,@C_NGAYLAMVIECDN1,@C_SOTHE,@C_DIENTHOAI,getdate(),@C_NGAYNHAPCANH,getdate(),
	   @C_TENDN1,@C_NGUOISUDUNGLAODONG1,@C_DIENTHOAIDN1,@C_DIACHIDN1,@C_NGAYLAMVIECDN1
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaolancuoidehoihuong_Update]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_EPS_Khaibaolancuoidehoihuong_Update]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),
	@C_HOPDONGDEN nvarchar(50),	
	@C_LYDO nvarchar(500),
	@C_NGAYHETHAN nvarchar(50),
	@C_NGAYDANGKYVENUOC nvarchar(50)
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,
      C_HOPDONGDEN=@C_HOPDONGDEN,
	  C_LYDO=@C_LYDO,
	  C_NGAYHETHAN=@C_NGAYHETHAN,
	  C_NGAYDANGKYVENUOC=@C_NGAYDANGKYVENUOC,
	  C_NGAYGUI=getdate(),
	  C_NGAYKHAIBAOCUOI=getdate()

where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU



--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_DangkyKhoahoc_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DangkyKhoahoc_Insert]


	--@Donvi nvarchar(500),
	--@Nganhdaotao nvarchar(500),
	@Thoigiandaotao nvarchar(500),
	@Hoten nvarchar(500),	
	@Ngaysinh nvarchar(500),
	@Gioitinh nvarchar(500),
	@Hochieucu nvarchar(500),
	@Hochieumoi nvarchar(500),
	@Dienthoai1 nvarchar(500),
	@Dienthoai2 nvarchar(500),
	@CMDNVN nvarchar(500),
	@CMNDNN nvarchar(500),
	@NgaynhapHQ nvarchar(500),
	@NgayveVN nvarchar(500),
	@HancuoiCMNDNN nvarchar(500),
	@Email nvarchar(500),
	@Quequan nvarchar(500),
	@Thuongtru nvarchar(500),
	@Trinhdo nvarchar(500), 
	@Ctycuoi nvarchar(500),
	@Dienthoaictycuoi nvarchar(500),
	@Thoigianlamviec nvarchar(500),
	@QuaylaiHQ nvarchar(500),
	@ThiEPS nvarchar(500),
	@Ngaythi nvarchar(500),
	@Diemthi nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_DANGKY_DAOTAONGHE] (
	   --[C_DONVI]
      --,[C_NGANHDAOTAO]
      [C_THOIGIANDAOTAO]
      ,[C_HOTEN]
      ,[C_NGAYSINH]
      ,[C_GIOITINH]
      ,[C_HOCHIEUCU]
      ,[C_HOCHIEUMOI]
      ,[C_DIENTHOAI1]
      ,[C_DIENTHOAI2]
      ,[C_CMNDVN]
      ,[C_CMNDNN]
      ,[C_NGAYNHAPHQ]
      ,[C_NGAYVEVN]
      ,[C_HANCUOICMNDNN]
      ,[C_EMAIL]
      ,[C_QUEQUAN]
      ,[C_THUONGTRU]
      ,[C_TRINHDO]
      ,[C_CTYCUOI]
      ,[C_DIENTHOAICTYCUOI]
      ,[C_THOIGIANLAMVIEC]
      ,[C_QUAYLAIHQ]
      ,[C_THI_EPS_TOPIK]
      ,[C_NGAYTHI]
      ,[C_DIEMTHI]
	  ,[C_NGAYGUI]

) VALUES (
	--@Donvi,
	--@Nganhdaotao,
	@Thoigiandaotao,
	@Hoten,	
	@Ngaysinh,
	@Gioitinh,
	@Hochieucu,
	@Hochieumoi,
	@Dienthoai1,
	@Dienthoai2,
	@CMDNVN,
	@CMNDNN,
	@NgaynhapHQ,
	@NgayveVN,
	@HancuoiCMNDNN,
	@Email,
	@Quequan,
	@Thuongtru,
	@Trinhdo,
	@Ctycuoi,
	@Dienthoaictycuoi,
	@Thoigianlamviec,
	@QuaylaiHQ,
	@ThiEPS,
	@Ngaythi,
	@Diemthi,	
	getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Cty_tuyendung_laodong]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Cty_tuyendung_laodong]
	@cty as nvarchar(250),
	@dienthoai as nvarchar(250)
AS
BEGIN
	
	SET NOCOUNT ON;

   SELECT * from T_TUYENDUNG where 1=1
   and C_TENCTY like '%'+@cty+'%'
   and C_DIENTHOAI like '%'+@dienthoai+'%'


END
GO
/****** Object:  StoredProcedure [dbo].[sp_CHLB_Duc_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_CHLB_Duc_Insert]
	@Hoten nvarchar(500),
	@Ngaysinh nvarchar(500),
	@CMND nvarchar(500),
	@Gioitinh nvarchar(500),
	@Honnhan nvarchar(500),

	@Hokhau nvarchar(500),
	@Sonhan nvarchar(500),
	@Phuongxa nvarchar(500),
	@Quanhuyen nvarchar(500),
	@Thanhpho nvarchar(500),
	@Dienthoailienhe nvarchar(500),

	@Tinhtranghoc nvarchar(500),
	@Namhoc nvarchar(500),
	@Xeploai nvarchar(500),
	@Congviec nvarchar(500),
	@Noilamviec nvarchar(500),
	@Truonghoc nvarchar(500),
	@Hedaotao nvarchar(500),

	@Nguoilienhe nvarchar(500),
	@Quanhe nvarchar(500),
	@Diachinguoithan nvarchar(500),
	@Dienthoainguoithan nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_DIEUDUONG] (
		C_HOTEN, C_NGAYSINH, C_CMND, C_GIOITINH, C_HONNHAN, C_HKTT, C_SONHA, C_PHUONG, C_QUAN, C_TINH, C_DIENTHOAI, 
                      C_HOCTAP, C_NAMHOC, C_XEPLOAI, C_CONGVIECLAM, C_NOILAMVIEC, C_TRUONGHOC, C_HEDAOTAO, C_NGUOILIENHE, C_QUANHE, C_DC_NGUOITHAN, 
                      C_TEL_NGUOITHAN,C_NGAYGUI


) VALUES (
	@Hoten,
	@Ngaysinh,
	@CMND,
	@Gioitinh,
	@Honnhan,

	@Hokhau,
	@Sonhan,
	@Phuongxa,
	@Quanhuyen,
	@Thanhpho,
	@Dienthoailienhe,

	@Tinhtranghoc,
	@Namhoc,
	@Xeploai,
	@Congviec,
	@Noilamviec,
	@Truonghoc,
	@Hedaotao,

	@Nguoilienhe,
	@Quanhe,
	@Diachinguoithan,
	@Dienthoainguoithan
	  ,getdate()
)




--endregion
GO
/****** Object:  StoredProcedure [dbo].[sp_Botuc_Insert]    Script Date: 08/31/2017 16:30:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Botuc_Insert]
	@Hoten nvarchar(500),
	@Ngaysinh nvarchar(500),
	@Gioitinh nvarchar(500),
	@Thuongtru nvarchar(500),
	@Ngayvenuoc nvarchar(500),
	@Thanghoc nvarchar(500),
	@Dienthoai nvarchar(500)
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_BOTUC] (
	C_HOTEN,
	C_NGAYSINH,
	C_GIOITINH,
	C_THUONGTRU,
	C_NGAYVENUOC,
	C_THANGHOC,
	C_DIENTHOAI,
	C_NGAYDANGKY

) VALUES (
	@Hoten,
	@Ngaysinh,
	@Gioitinh,
	@Thuongtru,	
	@Ngayvenuoc,
	@Thanghoc,
	@Dienthoai,	
	getdate()
)




--endregion
GO
/****** Object:  Default [DF_T_ONLINE_PK_ONLINE]    Script Date: 08/31/2017 16:30:44 ******/
ALTER TABLE [dbo].[T_ONLINE] ADD  CONSTRAINT [DF_T_ONLINE_PK_ONLINE]  DEFAULT (newid()) FOR [PK_ONLINE]
GO
