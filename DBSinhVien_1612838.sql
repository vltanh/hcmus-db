/*
1. Tạo Database
2. Kích hoạt sử dụng DB
3. Tạo Table và Primary Key
4. Foreign Key và Checks
5. Nhập Data
6. Bổ sung Data
7. Kiểm tra DB
8. Kiểm tra Script
*/

-- 1. Tạo Database
create database [DBSinhVien_1612838]

-- 2. Kích hoạt DB
go -- Ngăn giữa 2 lệnh tránh chạy song son
use [DBSinhVien_1612838]

-- 3. Tạo Table và khóa chính
go
create table [SINHVIEN] (
	MSSV char(1),
	Ten nvarchar(50),
	ThuocLop char(1)
	primary key (MSSV)
)

create table [LOPHOC] (
	MaLop char(1),
	Ten varchar(20),
	MaLT char(1)
	primary key (MaLop)
)

-- 4. Tạo khóa ngoài
go
alter table [SINHVIEN]
add constraint [FK_SINHVIEN_LOPHOC]
foreign key ([ThuocLop]) references [LOPHOC]([MaLop])

alter table [LOPHOC]
add constraint [FK_LOPHOC_SINHVIEN]
foreign key ([MaLT]) references [SINHVIEN]([MSSV])

-- 5. Nhập data
go
insert into [LOPHOC]([MaLop], [Ten])
values
('A', 'CNTN2015'),
('B', 'CNTN2016')

insert into [SINHVIEN]([MSSV], [Ten], [ThuocLop])
values
('1', N'Triều', 'A'),
('2', N'Hiếu', 'A'),
('3', N'Mẫn', 'A'),
('4', N'Nhi', 'B')

-- 6. Bổ sung data
update [LOPHOC]
set [MaLT] = '1' where [MaLop] = 'A'

update [LOPHOC]
set [MaLT] = '4' where [MaLop] = 'B'

-- 7. Kiểm tra Database
select * from [LOPHOC]
select * from [SINHVIEN]

-- use master
-- drop database [DBSinhVien_1612838]