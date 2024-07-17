create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh(
    ma_hs varchar(20) primary key ,
    ten_hs varchar(50),
    ngay_sinh DATETIME,
    lop varchar(20),
    gt varchar(20)
);
create table mon_hoc(
    ma_mh varchar(20) primary key,
    ten_mh varchar(50),
    ma_gv varchar(20)
);
create table bang_diem(
    ma_hs varchar(20),
    ma_mh varchar(50),
    diem_thi int,
    ngay_kt datetime,
    primary key (ma_hs,ma_mh),
    foreign key (ma_hs) references hoc_sinh(ma_hs),
    foreign key (ma_mh) references mon_hoc(ma_mh)
);
create table giao_vien(
    ma_gv varchar(20) primary key ,
    ten_gv varchar(50),
    sdt varchar(10)
);
alter table mon_hoc
add CONSTRAINT FK_MaGV foreign key (ma_gv) references giao_vien(ma_gv);
insert into hoc_sinh values (1,'cong','20041205','c05','nam');
insert into hoc_sinh values (2,'hieu','20011104','c05','nam');
insert into giao_vien values ('GV1','Chanh','0909090909'),
                             ('GV2','Phuong','0900090909');
insert into mon_hoc values ('mon1','java','GV1'),
                           ('mon2','javacore','GV2');
insert into bang_diem values (1,'mon1',10,'2024-5-12'),
                             (2,'mon2',10,'2024-5-12');
select * from bang_diem;
select bd.ma_hs, hs.ten_hs, ma_mh, diem_thi from bang_diem bd join hoc_sinh hs on hs.ma_hs = bd.ma_hs


