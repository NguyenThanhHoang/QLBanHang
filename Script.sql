-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-01-20 15:32:50.112


d

-- tables
-- Table: Chitiethoadon
Create database QLBanHang
use QLBanHang

CREATE TABLE ChiTietHoaDon (
    MaSP char(5)  NOT NULL,
    MaHD char(5)  NOT NULL,
    SoLuongMua char(10)  NOT NULL,
    DonGiaban money  NOT NULL,
    HoaDon_MaHD char(5)  NOT NULL,
    SanPham_MaSP char(5)  NOT NULL,
    CONSTRAINT Chitiethoadon_pk PRIMARY KEY  (MaSP,MaHD)
)
;





-- Table: Hoadon
CREATE TABLE HoaDon (
    MaHD char(5)  NOT NULL,
    MaKH char(5)  NOT NULL,
    NgayLap datetime  NOT NULL,
    KhachHang_MaKH char(5)  NOT NULL,
    CONSTRAINT HoaDon_pk PRIMARY KEY  (MaHD)
)
;





-- Table: Khachhang
CREATE TABLE KhachHang (
    MaKH char(5)  NOT NULL,
    TenKH nvarchar(50)  NOT NULL,
    DiaChi nvarchar(50)  NOT NULL,
    SDT varchar(15) unique  NOT NULL,
    CONSTRAINT KhachHang_pk PRIMARY KEY  (MaKH)
)
;





-- Table: Loaisanpham
CREATE TABLE LoaiSanPham (
    MaloaiSP char(5)  NOT NULL,
    TenloaiSP nvarchar(30)  NOT NULL,
    CONSTRAINT LoaiSanPham_pk PRIMARY KEY  (MaloaiSP)
)
;

-- Table: Sanpham
CREATE TABLE SanPham (
    MaSP char(5)  NOT NULL,
    MaLoaiSP char(5)  NOT NULL,
    TenSP nvarchar(30)  NOT NULL,
    SoLuong char(10)  NOT NULL,
    MoTa nvarchar(100)  NOT NULL,
    LoaiSanPham_MaLoaiSP char(5)  NOT NULL,
    CONSTRAINT SanPham_pk PRIMARY KEY  (MaSP)
)
;









-- foreign keys
-- Reference:  Chitiethoadon_Hoadon (table: Chitiethoadon)

ALTER TABLE ChiTietHoadon ADD CONSTRAINT ChiTietHoadon_HoaDon 
    FOREIGN KEY (HoaDon_MaHD)
    REFERENCES HoaDon (MaHD)
;

-- Reference:  Chitiethoadon_Sanpham (table: Chitiethoadon)

ALTER TABLE ChiTietHoadon ADD CONSTRAINT ChiTietHoaDon_SanPham 
    FOREIGN KEY (SanPham_MaSP)
    REFERENCES SanPham (MaSP)
;

-- Reference:  Hoadon_Khachhang (table: Hoadon)

ALTER TABLE HoaDon ADD CONSTRAINT HoaDon_KhachHang 
    FOREIGN KEY (KhachHang_MaKH)
    REFERENCES KhachHang (MaKH)
;

-- Reference:  Sanpham_Loaisanpham (table: Sanpham)

ALTER TABLE SanPham ADD CONSTRAINT SanPham_LoaiSanPham 
    FOREIGN KEY (Loaisanpham_MaLoaiSP)
    REFERENCES LoaiSanPham (MaloaiSP)
;





-- End of file.
--THêm dữ liệu khách hàng
insert into Khachhang values ('KH001',N'Nguyễn Thanh Hoàng',N'Đà Nẵng','01667858771')
insert into Khachhang values ('KH002',N'Nguyễn Văn Nam',N'Đà Nẵng','01667858772')
insert into Khachhang values ('KH003',N'Hoàng Tuấn',N'Đà Nẵng','01667858773')
insert into Khachhang values ('KH004',N'Nguyễn Anh Tài',N'Đà Nẵng','01667858774')
insert into Khachhang values ('KH005',N'Lê Văn Linh',N'Đà Nẵng','01667858775')
-- Thêm dữ liệu loại sản phẩm
insert into Loaisanpham values ('LSP01',N'Bánh Sinh Nhật')
insert into Loaisanpham values ('LSP02',N'Bánh Cưới')
insert into Loaisanpham values ('LSP03',N'Bánh bao tasty')
insert into Loaisanpham values ('LSP04',N'Chocolate')
insert into Loaisanpham values ('LSP05',N'Bánh mỳ pháp')
-- Thêm dữ liệu sản phẩm
Insert into Sanpham values ('SP001','LSP01',N'Green tea','10',N'Đường kính 21.5 cm','LSP01')
Insert into Sanpham values ('SP002','LSP02',N'Wedding Pink Cake','10',N'Bạt gateau, kem bơ, rượu Rum, mầu thực phẩm (đảm bảo VSATTP) KT: T1-18cm, T2-28cm, T3-38cm
','LSP02')
Insert into Sanpham values ('SP003','LSP03',N'Bánh bao nhân thịt bò','10',N'1 túi có 6 chiếc bánh bao','LSP03')
Insert into Sanpham values ('SP004','LSP04',N'Chocolate Almond','10',N'','LSP04')
Insert into Sanpham values ('SP005','LSP05',N'Bánh mỳ gối L','10',N'','LSP05')
-- thêm dữ liệu hóa đơn
insert into Hoadon values ('HD002','KH002','12/01/2014','KH002')
insert into Hoadon values ('HD001','KH001','12/01/2014','KH001')
insert into Hoadon values ('HD003','KH003','12/01/2014','KH003')
insert into Hoadon values ('HD004','KH004','12/01/2014','KH004')
insert into Hoadon values ('HD005','KH005','12/01/2014','KH005')
-- thêm dữ liệu chi tiết hóa đơn
insert into ChiTietHoaDon values ('SP001','HD001','2','50000','HD001','SP001')
insert into ChiTietHoaDon values ('SP002','HD002','2','1000000','HD002','SP002')
insert into ChiTietHoaDon values ('SP003','HD003','2','30000','HD003','SP003')
insert into ChiTietHoaDon values ('SP004','HD004','2','20000','HD004','SP004')
insert into ChiTietHoaDon values ('SP005','HD005','2','20000','HD005','SP005')