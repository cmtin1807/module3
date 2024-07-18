create database ung_dung_quan_ly_khu_nghi_duong_furama;
use ung_dung_quan_ly_khu_nghi_duong_furama;
create table vi_tri(
    ma_vi_tri INT primary key ,
    ten_vi_tri VARCHAR(45)
);
create table trinh_do(
    ma_trinh_do INT primary key ,
    ten_trinh_do VARCHAR(45)
);
create table bo_phan(
    ma_bo_phan INT primary key ,
    ten_bo_phan VARCHAR(45)
);
create table nhan_vien(
    ma_nhan_vien INT primary key ,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT,
    foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table loai_khach(
    ma_loai_khach INT primary key ,
    ten_loai_khach VARCHAR(45)
);
create table khach_hang(
    ma_khach_hang INT primary key ,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);
create table loai_dich_vu(
    ma_loai_dich_vu INT primary key ,
    ten_loai_dich_vu VARCHAR(45)
);
create table kieu_thue(
    ma_kieu_thue INT primary key ,
    ten_kieu_thue VARCHAR(45)
);
create table dich_vu(
    ma_dich_vu INT primary key ,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
create table dich_vu_di_kem (
    ma_dich_vu_di_kem INT primary key ,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
    trang_thai VARCHAR(45)
);
create table hop_dong(
    ma_hop_dong INT primary key ,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table hop_dong_chi_tiet(
    ma_hop_dong_chi_tiet INT primary key ,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);


