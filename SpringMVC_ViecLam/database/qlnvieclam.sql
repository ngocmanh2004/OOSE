-- Tạo database
CREATE DATABASE IF NOT EXISTS qlnvieclam;
USE qlnvieclam;

-- Bảng TRUONG
CREATE TABLE IF NOT EXISTS TRUONG (
    MaTruong VARCHAR(10) PRIMARY KEY,
    TenTruong VARCHAR(200) NOT NULL,
    DiaChi VARCHAR(300),
    SoDT VARCHAR(15)
);

-- Bảng NGANH
CREATE TABLE IF NOT EXISTS NGANH (
    MaNganh VARCHAR(10) PRIMARY KEY,
    TenNganh VARCHAR(200) NOT NULL,
    LoaiNganh VARCHAR(100)
);

-- Bảng SINHVIEN
CREATE TABLE IF NOT EXISTS SINHVIEN (
    SoCMND VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    SoDT VARCHAR(15),
    DiaChi VARCHAR(300)
);

-- Bảng TOT_NGHIEP
CREATE TABLE IF NOT EXISTS TOT_NGHIEP (
    SoCMND VARCHAR(20),
    MaTruong VARCHAR(10),
    MaNganh VARCHAR(10),
    HeTN VARCHAR(50),
    NgayTN DATE,
    LoaiTN VARCHAR(50),
    PRIMARY KEY (SoCMND, MaTruong, MaNganh),
    FOREIGN KEY (SoCMND) REFERENCES SINHVIEN(SoCMND),
    FOREIGN KEY (MaTruong) REFERENCES TRUONG(MaTruong),
    FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
);

-- Bảng CONG_VIEC
CREATE TABLE IF NOT EXISTS CONG_VIEC (
    SoCMND VARCHAR(20),
    NgayVaoCongTy DATE,
    MaNganh VARCHAR(10),
    TenCongViec VARCHAR(200),
    TenCongTy VARCHAR(200),
    DiaChiCongTy VARCHAR(300),
    ThoiGianLamViec INT,
    PRIMARY KEY (SoCMND, NgayVaoCongTy),
    FOREIGN KEY (SoCMND) REFERENCES SINHVIEN(SoCMND),
    FOREIGN KEY (MaNganh) REFERENCES NGANH(MaNganh)
);

-- Thêm dữ liệu mẫu cho TRUONG
INSERT INTO TRUONG (MaTruong, TenTruong, DiaChi, SoDT) VALUES
('DH01', 'Đại học Bách Khoa Hà Nội', 'Số 1 Đại Cồ Việt, Hà Nội', '0243868xxxx'),
('DH02', 'Đại học Quốc Gia Hà Nội', 'Xuân Thủy, Cầu Giấy, Hà Nội', '0243754xxxx'),
('DH03', 'Đại học Công nghệ', 'Xuân Thủy, Cầu Giấy, Hà Nội', '0243754xxxx'),
('CD01', 'Cao đẳng Công nghệ Thông tin', 'Hà Nội', '024xxxxxxx'),
('TC01', 'Trung cấp Kỹ thuật', 'Hà Nội', '024xxxxxxx');

-- Thêm dữ liệu mẫu cho NGANH
INSERT INTO NGANH (MaNganh, TenNganh, LoaiNganh) VALUES
('CNTT', 'Công nghệ thông tin', 'Kỹ thuật'),
('KTPM', 'Kỹ thuật phần mềm', 'Kỹ thuật'),
('KHMT', 'Khoa học máy tính', 'Kỹ thuật'),
('KTDT', 'Kỹ thuật điện tử', 'Kỹ thuật'),
('QTKD', 'Quản trị kinh doanh', 'Kinh tế'),
('KTOAN', 'Kế toán', 'Kinh tế'),
('NNANH', 'Ngôn ngữ Anh', 'Xã hội'),
('LUẬT', 'Luật', 'Xã hội');