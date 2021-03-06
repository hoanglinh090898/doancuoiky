USE [ThuVien]
GO
/****** Object:  Table [dbo].[ChiTietMuon]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietMuon](
	[ID_Muon] [char](36) NULL,
	[ID_Sach] [char](36) NULL,
	[SoLuong] [int] NULL,
	[GiaTien] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietNhap]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietNhap](
	[ID_Nhap] [char](36) NULL,
	[ID_Sach] [char](36) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocGia](
	[ID_DocGia] [char](36) NOT NULL,
	[TenDocGia] [nvarchar](50) NULL,
	[CMND] [char](10) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](10) NULL,
 CONSTRAINT [PK__DocGia__47A256B9364E77F8] PRIMARY KEY CLUSTERED 
(
	[ID_DocGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[ID_Loai] [char](10) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Loai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MuonSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MuonSach](
	[ID_Muon] [char](36) NOT NULL,
	[NgayMuon] [date] NULL,
	[NgayTra] [date] NULL,
	[ID_DocGia] [char](36) NULL,
 CONSTRAINT [PK__MuonSach__7B2F391392F89028] PRIMARY KEY CLUSTERED 
(
	[ID_Muon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhapSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhapSach](
	[ID_Nhap] [char](36) NOT NULL,
	[NgayNhap] [date] NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK__NhapSach__A6D6EF818A7686EB] PRIMARY KEY CLUSTERED 
(
	[ID_Nhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sach](
	[ID_Sach] [char](36) NOT NULL,
	[ID_Loai] [char](10) NULL,
	[TenSach] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK__Sach__207105C7F853EEC1] PRIMARY KEY CLUSTERED 
(
	[ID_Sach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ChiTietMuon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietMu__ID_Mu__1DE57479] FOREIGN KEY([ID_Muon])
REFERENCES [dbo].[MuonSach] ([ID_Muon])
GO
ALTER TABLE [dbo].[ChiTietMuon] CHECK CONSTRAINT [FK__ChiTietMu__ID_Mu__1DE57479]
GO
ALTER TABLE [dbo].[ChiTietMuon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietMu__ID_Sa__1ED998B2] FOREIGN KEY([ID_Sach])
REFERENCES [dbo].[Sach] ([ID_Sach])
GO
ALTER TABLE [dbo].[ChiTietMuon] CHECK CONSTRAINT [FK__ChiTietMu__ID_Sa__1ED998B2]
GO
ALTER TABLE [dbo].[ChiTietNhap]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietNh__ID_Nh__164452B1] FOREIGN KEY([ID_Nhap])
REFERENCES [dbo].[NhapSach] ([ID_Nhap])
GO
ALTER TABLE [dbo].[ChiTietNhap] CHECK CONSTRAINT [FK__ChiTietNh__ID_Nh__164452B1]
GO
ALTER TABLE [dbo].[ChiTietNhap]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietNh__ID_Sa__173876EA] FOREIGN KEY([ID_Sach])
REFERENCES [dbo].[Sach] ([ID_Sach])
GO
ALTER TABLE [dbo].[ChiTietNhap] CHECK CONSTRAINT [FK__ChiTietNh__ID_Sa__173876EA]
GO
ALTER TABLE [dbo].[MuonSach]  WITH CHECK ADD  CONSTRAINT [FK__MuonSach__ID_Doc__1BFD2C07] FOREIGN KEY([ID_DocGia])
REFERENCES [dbo].[DocGia] ([ID_DocGia])
GO
ALTER TABLE [dbo].[MuonSach] CHECK CONSTRAINT [FK__MuonSach__ID_Doc__1BFD2C07]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK__Sach__ID_Loai__1273C1CD] FOREIGN KEY([ID_Loai])
REFERENCES [dbo].[LoaiSach] ([ID_Loai])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK__Sach__ID_Loai__1273C1CD]
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietMuon]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ChiTietMuon]
@ID_Muon char(36),
@ID_Sach char(10),
@SoLuong int,
@GiaTien float
as
begin
declare @SLHienTai int,@SLCheck int 
SET @SLHienTai = (select SoLuong from Sach where ID_Sach = @ID_Sach)
INSERT INTO ChiTietMuon VALUES(@ID_Muon,@ID_Sach,@SoLuong,@GiaTien)
UPDATE Sach SET SoLuong =(@SLHienTai-@SoLuong) where ID_Sach = @ID_Sach
SET @SLCheck = (select SoLuong from Sach where ID_Sach = @ID_Sach)
if @SLCheck =0
UPDATE Sach SET TinhTrang =N'Hết hàng' WHERE ID_Sach = @ID_Sach
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ChiTietNhap]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_ChiTietNhap]
@ID_Nhap char(36),
@ID_Sach char(10),
@SoLuong int,
@DonGia float
as
begin
declare @SLHienTai int
set @SLHienTai =(select SoLuong from Sach where ID_Sach=@ID_Sach)
INSERT INTO ChiTietNhap VALUES (@ID_Nhap,@ID_Sach,@SoLuong,@DonGia)
UPDATE Sach SET SoLuong =(@SLHienTai+@SoLuong),DonGia=@DonGia,TinhTrang=N'Còn hàng' WHERE ID_Sach=@ID_Sach
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDocGia]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteDocGia]
@ID_DocGia char(36)
as
DELETE FROM DocGia WHERE ID_DocGia=@ID_DocGia

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteLoai]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteLoai]
@ID_Loai char(10)
as
DELETE FROM LoaiSach WHERE ID_Loai=@ID_Loai

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteSach]
@ID_Sach char(10)
as
DELETE FROM Sach WHERE ID_Sach=@ID_Sach

GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuTheoThang]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DoanhThuTheoThang]
as
select s.TenSach, Sum(ct.SoLuong) as SoLuong, Sum(ct.GiaTien) as GiaTien from MuonSach ms, ChiTietMuon ct INNER JOIN Sach s on ct.ID_Sach = s.ID_Sach where ct.ID_Muon= ms.ID_Muon and MONTH(ms.NgayMuon)=MONTH(GETDATE()) group by s.TenSach,ct.GiaTien,ct.SoLuong
GO
/****** Object:  StoredProcedure [dbo].[sp_DocGiaInsert]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DocGiaInsert]
@ID_DocGia char(36),
@TenDocGia nvarchar(50),
@CMND char(10),
@DiaChi nvarchar(100),
@SDT char(10)
as
INSERT INTO DocGia VALUES (@ID_DocGia,@TenDocGia,@CMND,@DiaChi,@SDT)

GO
/****** Object:  StoredProcedure [dbo].[sp_DocGiaUpdate]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DocGiaUpdate]
@ID_DocGia char(36),
@TenDocGia nvarchar(50),
@CMND char(10),
@DiaChi nvarchar(100),
@SDT char(10)
as
UPDATE DocGia SET TenDocGia=@TenDocGia,CMND=@CMND,DiaChi=@DiaChi,SDT=@SDT WHERE ID_DocGia=@ID_DocGia

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLoai]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertLoai]
@ID_Loai char(10),
@TenLoai nvarchar(50)
as
INSERT INTO LoaiSach VALUES(@ID_Loai,@TenLoai)

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertSach]
@ID_Sach char(10),
@ID_Loai char(10),
@TenSach nvarchar(50),
@SoLuong int,
@DonGia float,
@TinhTrang nvarchar(50)
as
INSERT INTO Sach VALUES(@ID_Sach,@ID_Loai,@TenSach,@SoLuong,@DonGia,@TinhTrang)

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadDocGia]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoadDocGia]
as
SELECT * FROM DocGia

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadDocGiaByID]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoadDocGiaByID]
@ID_DocGia char(36)
as
SELECT * FROM DocGia WHERE ID_DocGia = @ID_DocGia

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadLoaiSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoadLoaiSach]
as
SELECT * FROM LoaiSach

GO
/****** Object:  StoredProcedure [dbo].[sp_LoadSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoadSach]
as
SELECT * FROM Sach WHERE TinhTrang =N'Còn hàng'
GO
/****** Object:  StoredProcedure [dbo].[sp_LoadSachByID]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_LoadSachByID]
@ID_Sach char(10)
as
SELECT * FROM Sach WHERE ID_Sach = @ID_Sach

GO
/****** Object:  StoredProcedure [dbo].[sp_MuonSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_MuonSach]
@ID_Muon char(36),
@NgayMuon date,
@NgayTra date,
@ID_DocGia char(36)
as
INSERT INTO MuonSach VALUES(@ID_Muon,@NgayMuon,@NgayTra,@ID_DocGia)

GO
/****** Object:  StoredProcedure [dbo].[sp_NhapSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_NhapSach]
@ID_Nhap char(36),
@NgayNhap date,
@GhiChu nvarchar(100)
as
INSERT INTO NhapSach VALUES(@ID_Nhap,@NgayNhap,@GhiChu)

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateLoai]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateLoai]
@ID_Loai char(10),
@TenLoai nvarchar(50)
as
UPDATE LoaiSach SET TenLoai=@TenLoai WHERE ID_Loai=@ID_Loai

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateSach]    Script Date: 6/5/2020 8:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateSach]
@ID_Sach char(10),
@ID_Loai char(10),
@TenSach nvarchar(50),
@SoLuong int,
@DonGia float,
@TinhTrang nvarchar(50)
as
UPDATE Sach SET ID_Loai=@ID_Loai,TenSach=@TenSach,SoLuong=@SoLuong,DonGia=@DonGia,TinhTrang=@TinhTrang WHERE ID_Sach=@ID_Sach

GO
