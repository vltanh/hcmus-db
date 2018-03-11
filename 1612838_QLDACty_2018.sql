-- 1612838_QLDACty_2018.sql
-- 09/03/2018

create database [1612838_QLDACty_2018]

go
use [1612838_QLDACty_2018]

go
create table NHANVIEN (
	HoNV nvarchar(15),
	TenLot nvarchar(15),
	TenNV nvarchar(15),
	MaNV varchar(9),
	NgSinh date,
	DChi nvarchar(30),
	Phai nvarchar(3),
	Luong real,
	MaNQL varchar(9),
	PHG int,
	primary key (MaNV),
	foreign key (MaNQL) references NHANVIEN(MaNV),
	check (Phai in (N'Nam', N'Nữ'))
)

go
create table PHONGBAN (
	TenPHG nvarchar(15),
	MaPHG int,
	TrPHG varchar(9),
	NgayNhamChuc date,
	primary key (MaPHG),
	foreign key (TrPHG) references NHANVIEN(MaNV)
)

create table THANNHAN (
	MaNVien varchar(9),
	TenTN nvarchar(15),
	Phai varchar(3),
	NgSinh date,
	QuanHe nvarchar(15),
	primary key (MaNVien, TenTN),
	foreign key (MaNVien) references NHANVIEN(MaNV),
	check (Phai in (N'Nam', N'Nữ'))
)

go
create table DIADIEM_PHG (
	MaPHG int,
	DiaDiem nvarchar(15),
	primary key (MaPHG, DiaDiem),
	foreign key (MaPHG) references PHONGBAN(MaPHG)
)

create table DEAN (
	TenDA nvarchar(15),
	MaDA varchar(8),
	DDiemDA nvarchar(15),
	Phong int,
	primary key (MaDA),
	foreign key (Phong) references PHONGBAN(MaPHG)
)

go 
create table CONGVIEC (
	MaDA varchar(8),
	STT int,
	TenCongViec nvarchar(50),
	primary key (MaDA, STT),
	foreign key (MaDA) references DEAN(MaDA)
)

go
create table PHANCONG (
	MaNVien varchar(9),
	MaDA varchar(8),
	STT int,
	ThoiGian decimal(5,2),
	primary key (MaNVien, MaDA, STT),
	foreign key (MaDA, STT) references CONGVIEC(MaDA, STT),
	foreign key (MaNVien) references NHANVIEN(MaNV)
)

go
alter table NHANVIEN
add constraint FK_NHANVIEN_PHONGBAN
foreign key (PHG) references PHONGBAN(MaPHG)

go
insert into PHONGBAN(TenPHG, MaPHG, NgayNhamChuc)
values
(N'Nghiên cứu', 5, '19780522'),
(N'Điều hành', 4, '19850101'),
(N'Quản lý', 1, '19710619')

go 
insert into DIADIEM_PHG(MaPHG, DiaDiem)
values
(1, N'Tp.HCM'),
(4, N'Hà Nội'),
(5, N'Vũng Tàu'),
(5, N'Nha Trang'),
(5, N'Tp.HCM')

insert into DEAN(TenDA, MaDA, DDiemDA, Phong)
values
(N'Sản phẩm X', 1, N'Vũng Tàu', 5),
(N'Sản phẩm Y', 2, N'Nha Trang', 5),
(N'Sản phẩm Z', 3, N'Tp.HCM', 5),
(N'Tin học hóa', 10, N'Hà Nội', 4),
(N'Cáp quang', 20, N'Tp.HCM', 1),
(N'Đào tạo', 30, N'Hà Nội', 4)

insert into NHANVIEN(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, PHG)
values
(N'Nguyễn', N'Thanh', N'Tùng', '005', '19620820', N'222 Nguyễn Văn Cừ, Tp.HCM', N'Nam', 40000, 5),
(N'Lê', N'Thị', N'Nhàn', '001', '19670201', N'291 Hồ Văn Huê, Tp.HCM', N'Nữ', 43000, 4)

insert into NHANVIEN(HoNV, TenLot, TenNV, MaNV, NgSinh, DChi, Phai, Luong, MaNQL, PHG)
values
(N'Đinh', N'Bá', N'Tiến', '009', '19600211', N'119 Cống Quỳnh, Tp.HCM', N'Nam', 30000, '005', 5),
(N'Bùi', N'Thủy', N'Bưng', '007', '19540311', N'332 Nguyễn Thái Học, Tp.HCM', N'Nam', 25000, '001', 4),
(N'Nguyễn', N'Mạnh', N'Hùng', '004', '19670304', N'95 Bà Rịa, Vũng Tàu', N'Nam', 38000, '005', 5),
(N'Trần', N'Thanh', N'Tâm', '003', '19570504', N'34 Mai Thị Lựu, Tp.HCM', N'Nam', 25000, '005', 5),
(N'Trần', N'Hồng', N'Quang', '008', '19670901', N'80 Lê Hồng Phong, Tp.HCM', N'Nam', 25000, '001', 4),
(N'Vương', N'Ngọc', N'Quyền', '006', '19650101', N'45 Trưng Vương, Hà Nội', N'Nữ', 55000, NULL, 1)

update NHANVIEN
set MaNQL = '006'
where MaNV in ('001', '005')

go
insert into CONGVIEC(MaDA, STT, TenCongViec)
values
(1, 1, N'Thiết kế sản phẩm X'),
(1, 2, N'Thử nghiệm sản phẩm X'),
(2, 1, N'Sản xuất sản phẩm Y'),
(2, 2, N'Quảng cáo sản phẩm Y'),
(3, 1, N'Khuyến mã sản phẩm Z'),
(10, 1, N'Tin hõc hóa nhân sự tiền lương'),
(10, 2, N'Tin học hóa phòng kinh doanh'),
(20, 1, N'Lắp đặt cáp quang 12B'),
(30, 1, N'Đào tạo nhân viên Marketing'),
(30, 2, N'Đào tạo nhân viên thiết kế')

insert into PHANCONG(MaNVien, MaDA, STT, ThoiGian)
values
('009', 1, 1, 32),
('009', 2, 2, 8),
('004', 3, 1, 40),
('003', 1, 2, 20.0),
('003', 2, 1, 20.0),
('008', 10, 1, 35),
('008', 30, 2, 5),
('001', 30, 1, 20),
('001', 20, 1, 15),
('006', 20, 1, 30),
('005', 3, 1, 10),
('005', 10, 2, 10),
('005', 20, 1, 10),
('007', 30, 2, 30),
('007', 10, 2, 10)