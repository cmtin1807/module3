/*
 Bảng
 1. phieu_xuat
 - so_px (int , primary key)
 - ngay_xuat (datetime)
 2. phieu_nhap
 - so_pn (int , primary key)
 - ngay_nhap (datetime)
 3. nha_cc
 - ma_ncc (int, primary key)
 - ten_ncc (varchar)
 - dia_chi_ncc (varchar)
4. don_dh
 - so_dh (int, primary key)
 - ngay_dh (datetime)
 - ma_ncc (foreign key)
 5. vat_tu
 - ma_vt (int, primary key)
 - ten_vt varchar
 6. chi_tiet_phieu_xuat
 - id_chi_tiet_phieu_xuat (int, primary key)
 - dg_xuat int
 - sl_xuat int
 - ma_vt (foreign key)
 - so_px (foreign key)
 - primary key (id_chi_tiet_phieu_xuat, so_px)
 7. chi_tiet_phieu_nhap
 - id_chi_tiet_phieu_nhap (int, primary key)
 - dg_nhap int
 - sl_nhap int
 - ma_vt (foreign key)
 - so_pn (foreign key)
 - primary key (id_chi_tiet_phieu_nhap, so_pn)
 8. chi_tiet_don_dat_hang
 - ma_chi_tiet_don_dat_hang
 - so_dh (foreign key)
 - ma_vt (foreign key)
 9. sdt_ncc
 - id_sdt_ncc (int,primary key)
 - sdt varchar
 - ma_ncc(foreign key)
 */
CREATE DATABASE chuyen_doi_ERD;
use chuyen_doi_ERD;
CREATE TABLE phieu_xuat (
                            so_px INT PRIMARY KEY,
                            ngay_xuat DATETIME
);

CREATE TABLE phieu_nhap (
                            so_pn INT PRIMARY KEY,
                            ngay_nhap DATETIME
);

CREATE TABLE nha_cc (
                        ma_ncc INT PRIMARY KEY,
                        ten_ncc VARCHAR(255),
                        dia_chi_ncc VARCHAR(255)
);

CREATE TABLE don_dh (
                        so_dh INT PRIMARY KEY,
                        ngay_dh DATETIME,
                        ma_ncc INT,
                        FOREIGN KEY (ma_ncc) REFERENCES nha_cc(ma_ncc)
);

CREATE TABLE vat_tu (
                        ma_vt INT PRIMARY KEY,
                        ten_vt VARCHAR(255)
);

CREATE TABLE chi_tiet_phieu_xuat (
                                     id_chi_tiet_phieu_xuat INT ,
                                     dg_xuat INT,
                                     sl_xuat INT,
                                     ma_vt INT,
                                     so_px INT,
                                     PRIMARY KEY (id_chi_tiet_phieu_xuat, so_px),
                                     FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt),
                                     FOREIGN KEY (so_px) REFERENCES phieu_xuat(so_px)
);

CREATE TABLE chi_tiet_phieu_nhap (
                                     id_chi_tiet_phieu_nhap INT ,
                                     dg_nhap INT,
                                     sl_nhap INT,
                                     ma_vt INT,
                                     so_pn INT,
                                     PRIMARY KEY (id_chi_tiet_phieu_nhap, so_pn ),
                                     FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt),
                                     FOREIGN KEY (so_pn) REFERENCES phieu_nhap(so_pn)
);

CREATE TABLE chi_tiet_don_dat_hang (
                                       ma_chi_tiet_don_dat_hang INT PRIMARY KEY,
                                       so_dh INT,
                                       ma_vt INT,
                                       FOREIGN KEY (so_dh) REFERENCES don_dh(so_dh),
                                       FOREIGN KEY (ma_vt) REFERENCES vat_tu(ma_vt)
);

CREATE TABLE sdt_ncc (
                         id_sdt_ncc INT PRIMARY KEY,
                         sdt VARCHAR(20),
                         ma_ncc INT,
                         FOREIGN KEY (ma_ncc) REFERENCES nha_cc(ma_ncc)
);
