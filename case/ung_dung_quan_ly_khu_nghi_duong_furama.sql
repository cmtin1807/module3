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
    ma_khach_hang
)