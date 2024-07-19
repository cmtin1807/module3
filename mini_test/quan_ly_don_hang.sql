CREATE DATABASE quan_ly_don_hang;
USE quan_ly_don_hang;

CREATE TABLE phieu_xuat
(
    id_phieu_xuat  INT PRIMARY KEY,
    ngay_xuat      DATETIME,
    ten_khach_hang VARCHAR(50)
);
CREATE TABLE vat_tu
(
    id_vat_tu   INT PRIMARY KEY,
    ma_vat_tu   INT UNIQUE,
    ten_vat_tu  VARCHAR(50),
    don_vi_tinh VARCHAR(50),
    gia_tien    INT
);

CREATE TABLE ton_kho
(
    id_ton_kho INT PRIMARY KEY,
    id_vat_tu  INT,
    sl_dau     INT,
    tsl_nhap   INT,
    tsl_xuat   INT,
    FOREIGN KEY (id_vat_tu) REFERENCES vat_tu (id_vat_tu)
);
CREATE TABLE nha_cc
(
    id_nha_cc         INT PRIMARY KEY,
    ma_nha_cc         INT UNIQUE,
    dia_chi_nha_cc    VARCHAR(50),
    dien_thoai_nha_cc VARCHAR(50)
);
CREATE TABLE don_dat_hang
(
    id_don_hang   INT PRIMARY KEY,
    ma_don        INT UNIQUE,
    ngay_dat_hang DATETIME,
    id_nha_cc     INT,
    FOREIGN KEY (id_nha_cc) REFERENCES nha_cc (id_nha_cc)
);
CREATE TABLE phieu_nhap
(
    id_phieu_nhap INT PRIMARY KEY,
    so_phieu_nhap INT UNIQUE,
    ngay_nhap     DATETIME,
    id_don_hang   INT,
    FOREIGN KEY (id_don_hang) REFERENCES don_dat_hang (id_don_hang)

);
CREATE TABLE ct_don_hang
(
    id_ct_don_hang INT PRIMARY KEY,
    id_don_hang    INT,
    id_vat_tu      INT,
    sl_dat         INT,
    FOREIGN KEY (id_don_hang) REFERENCES don_dat_hang (id_don_hang),
    FOREIGN KEY (id_vat_tu) REFERENCES vat_tu (id_vat_tu)
);
CREATE TABLE ct_phieu_nhap
(
    id_ct_phieu_nhap INT PRIMARY KEY,
    id_phieu_nhap    INT,
    id_vat_tu        INT,
    sl_nhap          INT,
    dg_nhap          INT,
    ghi_chu          VARCHAR(50),
    FOREIGN KEY (id_phieu_nhap) REFERENCES phieu_nhap (id_phieu_nhap),
    FOREIGN KEY (id_vat_tu) REFERENCES vat_tu (id_vat_tu)

);

CREATE TABLE ct_phieu_xuat
(
    id_ctpx       INT PRIMARY KEY,
    id_phieu_xuat INT,
    id_vat_tu     INT,
    sl_xuat       INT,
    dg_xuat       INT,
    ghi_chu       VARCHAR(50),
    FOREIGN KEY (id_phieu_xuat) REFERENCES phieu_xuat (id_phieu_xuat),
    FOREIGN KEY (id_vat_tu) REFERENCES vat_tu (id_vat_tu)
);

INSERT INTO vat_tu (id_vat_tu, ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien)
VALUES (1, 101, 'Vật tư A', 'Chiếc', 10000),
       (2, 102, 'Vật tư B', 'Cái', 15000),
       (3, 103, 'Vật tư C', 'Bộ', 30000),
       (4, 104, 'Vật tư D', 'Cái', 20000),
       (5, 105, 'Vật tư E', 'Chiếc', 25000),
       (6, 106, 'Vật tư F', 'Bộ', 35000),
       (7, 107, 'Vật tư G', 'Cái', 18000),
       (8, 108, 'Vật tư H', 'Chiếc', 22000),
       (9, 109, 'Vật tư I', 'Bộ', 32000),
       (10, 110, 'Vật tư J', 'Cái', 24000);

INSERT INTO ton_kho (id_ton_kho, id_vat_tu, sl_dau, tsl_nhap, tsl_xuat)
VALUES (1, 1, 50, 10, 20),
       (2, 2, 30, 5, 7),
       (3, 3, 40, 8, 9),
       (4, 4, 25, 11, 22),
       (5, 5, 35, 2, 23);

INSERT INTO nha_cc (id_nha_cc, ma_nha_cc, dia_chi_nha_cc, dien_thoai_nha_cc)
VALUES (1, 201, 'Địa chỉ nhà cung cấp A', '123456789'),
       (2, 202, 'Địa chỉ nhà cung cấp B', '987654321'),
       (3, 203, 'Địa chỉ nhà cung cấp C', '456123789');

INSERT INTO don_dat_hang (id_don_hang, ma_don, ngay_dat_hang, id_nha_cc)
VALUES (1, 301, '2024-07-01', 1),
       (2, 302, '2024-07-02', 2),
       (3, 303, '2024-07-03', 3);

INSERT INTO phieu_nhap (id_phieu_nhap, so_phieu_nhap, ngay_nhap, id_don_hang)
VALUES (1, 401, '2024-07-05', 1),
       (2, 402, '2024-07-06', 2),
       (3, 403, '2024-07-07', 3);

INSERT INTO phieu_xuat (id_phieu_xuat, ngay_xuat, ten_khach_hang)
VALUES (1, '2024-07-10', 'Khách hàng A'),
       (2, '2024-07-11', 'Khách hàng B'),
       (3, '2024-07-12', 'Khách hàng C');

INSERT INTO ct_don_hang (id_ct_don_hang, id_don_hang, id_vat_tu, sl_dat)
VALUES (1, 1, 1, 10),
       (2, 1, 2, 15),
       (3, 2, 3, 20),
       (4, 2, 4, 25),
       (5, 3, 5, 18),
       (6, 3, 1, 12);

INSERT INTO ct_phieu_nhap (id_ct_phieu_nhap, id_phieu_nhap, id_vat_tu, sl_nhap, dg_nhap, ghi_chu)
VALUES (1, 1, 1, 15, 9000, 'Chi tiết phiếu nhập 1'),
       (2, 1, 2, 20, 12000, 'Chi tiết phiếu nhập 2'),
       (3, 2, 3, 25, 28000, 'Chi tiết phiếu nhập 3'),
       (4, 2, 4, 18, 18000, 'Chi tiết phiếu nhập 4'),
       (5, 3, 5, 30, 22000, 'Chi tiết phiếu nhập 5'),
       (6, 3, 1, 22, 9500, 'Chi tiết phiếu nhập 6');

INSERT INTO ct_phieu_xuat (id_ctpx, id_phieu_xuat, id_vat_tu, sl_xuat, dg_xuat, ghi_chu)
VALUES (1, 1, 1, 8, 12000, 'Chi tiết phiếu xuất 1'),
       (2, 1, 2, 12, 15000, 'Chi tiết phiếu xuất 2'),
       (3, 2, 3, 18, 30000, 'Chi tiết phiếu xuất 3'),
       (4, 2, 4, 15, 22000, 'Chi tiết phiếu xuất 4'),
       (5, 3, 5, 10, 25000, 'Chi tiết phiếu xuất 5'),
       (6, 3, 1, 6, 13000, 'Chi tiết phiếu xuất 6');

CREATE VIEW vw_CTPNHAP AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    ctn.id_vat_tu AS 'Mã vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
         JOIN phieu_nhap pn ON ctn.id_phieu_nhap = pn.id_phieu_nhap;

CREATE VIEW vw_CTPNHAP_VT AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    vt.id_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
JOIN phieu_nhap pn on ctn.id_phieu_nhap = pn.id_phieu_nhap
JOIN vat_tu vt on ctn.id_vat_tu = vt.id_vat_tu;

CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    pn.ngay_nhap AS 'Ngày nhập hàng',
    pn.id_don_hang AS 'Số đơn đặt hàng',
    vt.id_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
JOIN phieu_nhap pn on pn.id_phieu_nhap = ctn.id_phieu_nhap
JOIN vat_tu vt on vt.id_vat_tu = ctn.id_vat_tu;

CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    pn.ngay_nhap AS 'Ngày nhập hàng',
    pn.id_don_hang AS 'Số đơn đặt hàng',
    ddh.id_nha_cc AS 'Mã nhà cung cấp',
    vt.id_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
         JOIN phieu_nhap pn on pn.id_phieu_nhap = ctn.id_phieu_nhap
         JOIN vat_tu vt on vt.id_vat_tu = ctn.id_vat_tu
JOIN don_dat_hang ddh on ddh.id_don_hang = pn.id_don_hang;

CREATE VIEW vw_CTPNHAP_loc AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    vt.id_vat_tu AS 'Mã vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
         JOIN phieu_nhap pn on pn.id_phieu_nhap = ctn.id_phieu_nhap
         JOIN vat_tu vt on vt.id_vat_tu = ctn.id_vat_tu
WHERE ctn.sl_nhap > 5;

CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT
    pn.so_phieu_nhap AS 'Số phiếu nhập hàng',
    vt.id_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctn.sl_nhap AS 'Số lượng nhập',
    ctn.dg_nhap AS 'Đơn giá nhập',
    ctn.sl_nhap * ctn.dg_nhap AS 'Thành tiền nhập'
FROM ct_phieu_nhap ctn
         JOIN phieu_nhap pn on ctn.id_phieu_nhap = pn.id_phieu_nhap
         JOIN vat_tu vt on ctn.id_vat_tu = vt.id_vat_tu
WHERE vt.don_vi_tinh LIKE 'Bộ';

CREATE VIEW vw_CTPXUAT AS
SELECT
    px.id_phieu_xuat AS 'Số phiếu xuất hàng',
    ctpx.id_vat_tu AS 'Mã vật tư',
    ctpx.sl_xuat AS 'Số lượng xuất',
    ctpx.dg_xuat AS 'Đơn giá xuất',
    ctpx.sl_xuat * ctpx.dg_xuat AS 'Thành tiền xuất'
FROM ct_phieu_xuat ctpx
         JOIN phieu_xuat px ON ctpx.id_phieu_xuat = px.id_phieu_xuat;

CREATE VIEW vw_CTPXUAT_VT AS
SELECT
    px.id_phieu_xuat AS 'Số phiếu xuất hàng',
    vt.ma_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctpx.sl_xuat AS 'Số lượng xuất',
    ctpx.dg_xuat AS 'Đơn giá xuất'
FROM ct_phieu_xuat ctpx
         JOIN phieu_xuat px ON ctpx.id_phieu_xuat = px.id_phieu_xuat
         JOIN vat_tu vt ON ctpx.id_vat_tu = vt.id_vat_tu;

CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT
    px.id_phieu_xuat AS 'Số phiếu xuất hàng',
    px.ten_khach_hang AS 'Tên khách hàng',
    vt.ma_vat_tu AS 'Mã vật tư',
    vt.ten_vat_tu AS 'Tên vật tư',
    ctpx.sl_xuat AS 'Số lượng xuất',
    ctpx.dg_xuat AS 'Đơn giá xuất'
FROM ct_phieu_xuat ctpx
         JOIN phieu_xuat px ON ctpx.id_phieu_xuat = px.id_phieu_xuat
         JOIN vat_tu vt ON ctpx.id_vat_tu = vt.id_vat_tu;
