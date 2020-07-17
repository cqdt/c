-- im_japan_____________________________________
ALTER TABLE T_IM
ADD C_GioiTinh NVARCHAR(500);

ALTER TABLE T_IM
ADD C_ChieuCao NVARCHAR(500);

/****** Object:  StoredProcedure [dbo].[sp_IM_Insert]    Script Date: 3/8/2020 7:32:30 AM ******/
DROP PROCEDURE [dbo].[sp_IM_Insert]
GO

/****** Object:  StoredProcedure [dbo].[sp_IM_Insert]    Script Date: 3/8/2020 7:32:30 AM ******/
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
	@Dienthoai nvarchar(500),
	@GioiTinh nvarchar(500),
	@ChieuCao nvarchar(500)
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
	  ,[C_GioiTinh]
	  ,[C_ChieuCao]

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
	  ,@GioiTinh
	  ,@ChieuCao
)

GO
-- HoLy________________________________________________

ALTER TABLE T_HOLY
ADD C_TenTruongDaoTao NVARCHAR(500);

ALTER TABLE T_HOLY
ADD C_ChuyenNganhDaoTao NVARCHAR(500);

ALTER TABLE T_HOLY
ADD C_SinhVienNamThu NVARCHAR(500);

ALTER TABLE T_HOLY
ADD C_CongViecHienTai NVARCHAR(500);

ALTER TABLE T_HOLY
ADD C_DIENTHOAI2 NVARCHAR(500);

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[sp_HoLy_NhatBan_Insert]
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

	@Dienthoailienhe2 nvarchar(500),

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
	@Dienthoainguoithan nvarchar(500),

	@TenTruongDaoTao nvarchar(500),
	@ChuyenNganhDaoTao nvarchar(500),
	@SinhVienNamThu nvarchar(500),
	@CongViecHienTai nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_HOLY] (
		C_HOTEN, C_NGAYSINH, C_CMND, C_GIOITINH, C_HONNHAN, C_HKTT, C_SONHA, C_PHUONG, C_QUAN, C_TINH, C_DIENTHOAI, C_DIENTHOAI2,  
                      C_HOCTAP, C_NAMHOC, C_XEPLOAI, C_CONGVIECLAM, C_NOILAMVIEC, C_TRUONGHOC, C_HEDAOTAO, C_NGUOILIENHE, C_QUANHE, C_DC_NGUOITHAN, 
                      C_TEL_NGUOITHAN,C_NGAYGUI,
                      C_TENTRUONGDAOTAO,C_CHUYENNGANHDAOTAO,C_SINHVIENNAMTHU,C_CONGVIECHIENTAI
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
	@Dienthoailienhe2,

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

  ,@TenTruongDaoTao
  ,@ChuyenNganhDaoTao
  ,@SinhVienNamThu
  ,@CongViecHienTai
)

GO
-- CHLB Duc_________________________________________________
ALTER TABLE T_DIEUDUONG
ADD C_TenTruongDaoTao NVARCHAR(500);

ALTER TABLE T_DIEUDUONG
ADD C_ChuyenNganhDaoTao NVARCHAR(500);

ALTER TABLE T_DIEUDUONG
ADD C_SinhVienNamThu NVARCHAR(500);

ALTER TABLE T_DIEUDUONG
ADD C_CongViecHienTai NVARCHAR(500);

ALTER TABLE T_DIEUDUONG
ADD C_DIENTHOAI2 NVARCHAR(500);

/****** Object:  StoredProcedure [dbo].[sp_CHLB_Duc_Insert]    Script Date: 3/9/2020 7:51:53 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_CHLB_Duc_Insert]
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
	@Dienthoailienhe2 nvarchar(500),

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
	@Dienthoainguoithan nvarchar(500),

	@TenTruongDaoTao nvarchar(500),
	@ChuyenNganhDaoTao nvarchar(500),
	@SinhVienNamThu nvarchar(500),
	@CongViecHienTai nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_DIEUDUONG] (
		C_HOTEN, C_NGAYSINH, C_CMND, C_GIOITINH, C_HONNHAN, C_HKTT, C_SONHA, C_PHUONG, C_QUAN, C_TINH, C_DIENTHOAI, C_DIENTHOAI2,
                      C_HOCTAP, C_NAMHOC, C_XEPLOAI, C_CONGVIECLAM, C_NOILAMVIEC, C_TRUONGHOC, C_HEDAOTAO, C_NGUOILIENHE, C_QUANHE, C_DC_NGUOITHAN, 
                      C_TEL_NGUOITHAN,C_NGAYGUI,
                      C_TENTRUONGDAOTAO,C_CHUYENNGANHDAOTAO,C_SINHVIENNAMTHU,C_CONGVIECHIENTAI
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
	@Dienthoailienhe2,

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

  ,@TenTruongDaoTao
  ,@ChuyenNganhDaoTao
  ,@SinhVienNamThu
  ,@CongViecHienTai
)

GO
-- DaiLoan __________________________________________________
ALTER TABLE T_LV_DAILOAN
ADD C_ChieuCao NVARCHAR(500);

/****** Object:  StoredProcedure [dbo].[sp_LV_DaiLoan_Insert]    Script Date: 3/9/2020 8:02:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[sp_LV_DaiLoan_Insert]
	@Hoten nvarchar(500),
	@Ngaysinh nvarchar(500),
	@Trinhdotiengtrung nvarchar(500),
	@Dalamviectaidailoan nvarchar(500),
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
	@Dienthoai nvarchar(500),
	@ChieuCao nvarchar(500)
	
AS

SET NOCOUNT ON


INSERT INTO [dbo].[T_LV_DAILOAN] (
		[C_HOTEN]
      ,[C_NGAYSINH]
	  ,[C_TRINHDOTIENGTRUNG]
	  ,[C_DALAMVIECTAIDAILOAN]
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
	  ,[C_CHIEUCAO]

) VALUES (
	  @Hoten
      ,@Ngaysinh
	  ,@Trinhdotiengtrung
	  ,@Dalamviectaidailoan
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
	  ,@ChieuCao
)
--endregion
GO

-- KhaiBao lao dong HanQuoc
ALTER TABLE T_KHAIBAO_THONGTIN
ADD C_DIENTHOAI1 NVARCHAR(500);

DROP PROCEDURE [dbo].[sp_EPS_Khaibaolandau_Insert]
GO

/****** Object:  StoredProcedure [dbo].[sp_EPS_Khaibaolandau_Insert]    Script Date: 4/11/2020 5:26:15 PM ******/
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
	@C_DIENTHOAI nvarchar(500),

	@C_DIENTHOAIDN2 nvarchar(500),
	@C_DIENTHOAIDN3 nvarchar(500),
	@C_DIENTHOAI1 nvarchar(500)

AS

SET NOCOUNT ON
INSERT INTO [dbo].[T_KHAIBAO_THONGTIN] (C_NAME,
	   [C_HOTEN],[C_HOCHIEU],[C_CMND],[C_EMAIL],[C_MUCDICH],[C_TENDN1],[C_NGUOISUDUNGLAODONG1],[C_DIENTHOAIDN1],[C_DIENTHOAIDN2],[C_DIENTHOAIDN3],[C_DIACHIDN1],C_NGAYLAMVIECDN1,[C_SOTHE],[C_DIENTHOAI],[C_DIENTHOAI1],[C_NGAYGUI],C_NGAYNHAPCANH,C_NGAYKHAIBAODAU,

	   C_TENDN_HIENTAI, C_NGUOISUDUNGLAODONG_HIENTAI, C_DIENTHOAIDN_HIENTAI, C_DIACHIDN_HIENTAI, C_NGAYLAMVIECDN_HIENTAI

) VALUES (@C_NAME,
	   @C_HOTEN,@C_HOCHIEU,@C_CMND,@C_EMAIL,@C_MUCDICH,@C_TENDN1,@C_NGUOISUDUNGLAODONG1,@C_DIENTHOAIDN1,@C_DIENTHOAIDN2,@C_DIENTHOAIDN3,@C_DIACHIDN1,@C_NGAYLAMVIECDN1,@C_SOTHE,@C_DIENTHOAI,@C_DIENTHOAI1,getdate(),@C_NGAYNHAPCANH,getdate(),
	   @C_TENDN1,@C_NGUOISUDUNGLAODONG1,@C_DIENTHOAIDN1,@C_DIACHIDN1,@C_NGAYLAMVIECDN1
)

create PROCEDURE [dbo].[sp_EPS_Khaibaothaydoitucachluutru_Update]
	@C_MUCDICH nvarchar(50),
	@C_HOTEN nvarchar(50),
	@C_HOCHIEU nvarchar(50),
	@C_TUCACHLUUTRU nvarchar(50)	
AS

SET NOCOUNT ON

update [dbo].[T_KHAIBAO_THONGTIN] set	  
	  C_MUCDICH=@C_MUCDICH,
      C_DOITUCACHLUUTRU=@C_TUCACHLUUTRU,
	  C_NGAYGUI=getdate()
where C_HOTEN=@C_HOTEN and C_HOCHIEU=@C_HOCHIEU

ALTER TABLE T_KHAIBAO_THONGTIN
ADD C_DOITUCACHLUUTRU NVARCHAR(500);


DROP FUNCTION [dbo].[getdiachi_hanquoc]
GO


CREATE FUNCTION getdiachi_hanquoc 
(	
	-- Add the parameters for the function here
	@diachi5 nvarchar(100),
	@diachi4 nvarchar(100),
	@diachi3 nvarchar(100),
	@diachi2 nvarchar(100),
	@diachi1 nvarchar(100)
)
RETURNS nvarchar(200)
AS
BEGIN 
	
	DECLARE @pk nvarchar(200)
	DECLARE @result nvarchar(200) = @diachi4
	DECLARE @ii int = 0
	if @diachi5 is not null 
		select @pk = SUBSTRING(@diachi5,0, CHARINDEX('|',@diachi5)), @result = SUBSTRING(@diachi5, CHARINDEX('|',@diachi5)+1,len(@diachi5))
	else if @diachi4 is not null 
		select @pk = SUBSTRING(@diachi4,0, CHARINDEX('|',@diachi4)), @result = SUBSTRING(@diachi4, CHARINDEX('|',@diachi4)+1,len(@diachi4))
	else if @diachi3 is not null 
		select @pk = SUBSTRING(@diachi3,0, CHARINDEX('|',@diachi3)), @result = SUBSTRING(@diachi3, CHARINDEX('|',@diachi3)+1,len(@diachi3))
	else if @diachi2 is not null 
		select @pk = SUBSTRING(@diachi2,0, CHARINDEX('|',@diachi2)), @result = SUBSTRING(@diachi2, CHARINDEX('|',@diachi2)+1,len(@diachi2))
	else if @diachi1 is not null 
		select @pk = SUBSTRING(@diachi1,0, CHARINDEX('|',@diachi1)), @result = SUBSTRING(@diachi1, CHARINDEX('|',@diachi1)+1,len(@diachi1))
	if ISNUMERIC(@pk) = 0
		return @result;

 	while @ii < 3
	begin
		SELECT @result = concat(C_TEN,', ',@result), @pk = C_CHA FROM T_DIAGIOIHANHCHINH_HANQUOC where PK_DIAGIOIHANHCHINH_HANQUOC=@pk;
		SET @ii = @ii+1;
	end 
	RETURN @result
END





GO
