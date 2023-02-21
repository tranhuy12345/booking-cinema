use dbTest
go

create table tbPhim
(
	[maPhim] varchar(20) constraint PK_maPhim primary key(maPhim),
	[tenPhim] varchar(20) unique,
	[theLoai] varchar(50),
	[doTuoi] int constraint CK_doTuoi check(doTuoi between 13 and 18),
	[ngayBatDau] date,
	[ngayKetThuc] date,
	[moTa] varchar(50),
	[tacGia] varchar(20)
)
go

create table tbKhachHang
(
	[userName] varchar(20) constraint PK_UserNameKH primary key(userName),
	[password] varchar(30) not null,
	[soDienThoai] varchar(20),
	[tongDiemTichLuy] float default(0) 
)
go
create table tbKhuyenMai
(
	[maKM] varchar(30) constraint PK_maKM primary key(maKM),
	[tenKM] varchar(30) not null unique,
	[ngayApDung] date,
	[ngayKetThuc] date
)
go

create table tbNhanVien
(
	[userName] varchar(20) constraint PK_userNameNV primary key(userName),
	[password] varchar(30) not null,
	[chucVu] varchar(20),
	[tenNhanVien] varchar(30) not null
)
go

create table tbPhongChieu
(
	[maPhongChieu] varchar(10) constraint PK_maPhongChieu primary key(maPhongChieu),
	[tenPhongChieu] varchar(20) not null,
	[soLuongGhe] int default(40),
)
go

create table tbGioChieu
(
	[maGioChieu] varchar(10) constraint PK_maGioChieu primary key(maGioChieu),
	[gioBatDau] time,
	[trangThai] bit
)
go

create table tbLichChieu
(
	[maLichChieu] varchar(10) constraint PK_maLichChieu primary key(maLichChieu),
	[ngayChieuPhim] date not null,
	[maPhim] varchar(20) constraint FK_maPhim foreign key(maPhim) references tbPhim(maPhim),
	[maPhongChieu] varchar(10) constraint FK_maPhongChieu foreign key(maPhongChieu) references tbPhongChieu(maPhongChieu),
	[userNameNV] varchar(20) constraint FK_userNameNV foreign key(userNameNV) references tbNhanVien(userName),
	[maGioChieu] varchar(10) constraint FK_maGioChieu foreign key(maGioChieu) references tbGioChieu(maGioChieu),
	[trangThai] bit

)
go

create table tbTrangThai
(
	[maTrangThai] varchar(10) constraint PK_maTrangThai primary key(maTrangThai),
	[tenTrangThai] varchar(20) not null
)
go

create table tbGhe
(
	[maGhe] varchar(10) constraint PK_maGhe primary key(maGhe),
	[chiSoHang] varchar(2) not null,
	[chiSoCot] int not null,
	[maTrangThai] varchar(10) constraint FK_maTrangThai foreign key(maTrangThai) references tbTrangThai(maTrangThai),
	[maPhongChieu] varchar(10) constraint FK_maPhongChieuGhe foreign key(maPhongChieu) references tbPhongChieu(maPhongChieu),
	[giaGhe] int,
	[loaiGhe] varchar(20)
)
go
create table tbVe
(
	[maVe] int identity(10000,1) constraint PK_maVe primary key(maVe),
	[maLichChieu] varchar(10) constraint FK_maLichChieu foreign key(maLichChieu) references tbLichChieu(maLichChieu),
	[maGhe] varchar(10) constraint FK_maGhe foreign key(maGhe) references tbGhe(maGhe),
)
go

create table tbHangHoa
(
	[maHangHoa] varchar(10) constraint PK_maHangHoa primary key(maHangHoa),
	[loaiHangHoa] varchar(10),
	[tenHangHoa] varchar(10),
	[giaTien] float,
)
go

create table tbHoaDon
(
	[maHoaDon] int identity(100000,100) constraint PK_maHoaDon primary key(maHoaDon),
	[soLuongVe] int default(0),
	[donGiaVe] float default(0),
	[userNameKH] varchar(20) constraint FK_userNameKH foreign key(userNameKH) references tbKhachHang(userName),
	[maKM] varchar(30) constraint FK_maKM foreign key(maKM) references tbKhuyenMai(maKM),
	[soLuongHangHoa] int default(0),
	[donGiaHangHoa] float default(0),
	[thanhTien] float default(0),
	[userNameNV] varchar(20) constraint FK_userNameNV1 foreign key(userNameNV) references tbNhanVien(userName),
	[diemTichLuy] float default(0),
	[trangThai] bit
)
go

create table tbChiTietHangHoaVaVe
(
	[maChiTiet] int identity(100,1) constraint PK_maChiTiet primary key(maChiTiet),
	[maVe] int constraint FK_maVe foreign key(maVe) references tbVe(maVe),
	[maHangHoa] varchar(10) constraint FK_maHangHoa foreign key(maHangHoa) references tbHangHoa(maHangHoa) null,
	[maHoaDon] int constraint FK_maHoaDon foreign key(maHoaDon) references tbHoaDon(maHoaDon)
)
go

insert into tbPhim
values
('P001','The avenger 3','Hang Dong',13,'02-21-2023','03-11-2023','Cuoc chien cuoi cung cua cac sieu anh hung','Kevin Figie'),
('P002','Ant-Man','Hang Dong',13,'02-11-2023','02-28-2023','Cuoc chien danh lai Kang','Kevin Figie')
go

insert into tbKhachHang(userName,password,soDienThoai)
values
('tranhuy','123456','0964782374'),
('phuocnguyen','1234','103232323')
go

insert into tbNhanVien
values
('admin','123','Quan Ly','Nguyen Viet Dong'),
('admin2','123','Thu Ngan','Tran Thu Huy')
go

insert into tbKhuyenMai
values
('KM01','Deal30','02-21-2023','03-21-2023')
go

insert into tbPhongChieu
values
('PC01','Rap 1',30),
('PC02','Rap 2',30),
('PC03','Rap 3',20),
('PC04','Rap 4',20)
go

insert into tbGioChieu
values
('G01','09:00:00',0),
('G02','13:00:00',0),
('G03','17:00:00',0),
('G04','20:00:00',0),
('G05','23:00:00',0)
go

insert into tbTrangThai
values
('T01','Chua chon'),
('T02','Dang chon'),
('T03','Da chon')
go

insert into tbGhe
values
('G01','A',1,'T01','PC01',45000,'Thuong'),
('G02','A',2,'T01','PC01',45000,'Thuong'),
('G03','A',3,'T01','PC01',45000,'Thuong'),
('G04','A',4,'T01','PC01',45000,'Thuong'),
('G05','A',5,'T01','PC01',45000,'Thuong'),
('G06','A',6,'T01','PC01',45000,'Thuong'),
('G07','A',7,'T01','PC01',45000,'Thuong')
go

insert into tbHangHoa
values
('H01','Nuoc','Pepsi',10000),
('H02','Nuoc','Coca',11000),
('H03','Banh','Bap Socola',15000),
('H04','Banh','Banh su',12000)
go