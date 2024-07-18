create database manager_tour;
use manager_tour;
create table category_tour(
    category_id INT PRIMARY KEY ,
    category_code VARCHAR(255) not null ,
    category_name VARCHAR(255) not null
);
create table city(
    city_id INT primary key ,
    city_name VARCHAR(255) not null
);
create table clients (
    clients_id INT primary key ,
    clients_name VARCHAR(255) not null ,
    id_number VARCHAR(255) not null ,
    date_birth DATE NOT NULL ,
    city_id INT NOT NULL ,
    foreign key (city_id) references city(city_id)

);
create table destination(
    destination_id INT PRIMARY KEY ,
    destination_name VARCHAR(255) not null ,
    describes VARCHAR(255),
    cost INT NOT NULL ,
    city_id INT NOT NULL ,
    foreign key (city_id) references city(city_id)
);
create table tour(
    tour_id INT PRIMARY KEY ,
    tour_code VARCHAR(255) not null ,
    category_id INT not null ,
    destination_id INT NOT NULL ,
    date_start DATE NOT NULL ,
    date_end DATE NOT NULL ,
    FOREIGN KEY (category_id) references category_tour(category_id),
    FOREIGN KEY (destination_id) REFERENCES destination(destination_id)
);
create table order_tour(
    order_id INT PRIMARY KEY ,
    tour_id INT NOT NULL ,
    clients_id INT NOT NULL ,
    statuss VARCHAR(255) NOT NULL ,
    FOREIGN KEY (tour_id) REFERENCES tour(tour_id),
    FOREIGN KEY (clients_id) REFERENCES clients(clients_id)
);
INSERT INTO city
VALUES (1,'Quang Nam') ,
       (2,'Da Nang'),
       (3,'Quang Ninh'),
       (4,'Ba Ria Vung Tau'),
       (5,'Lam Dong');
INSERT INTO destination
VALUES (1,'Hoi An','1 trong 7 ky quan the gioi',7000000,1),
       (2,'Nui ngu hang son','Co 5 ngon nui', 5000000, 2),
       (3,'Vinh ha long','tung la ky quan dep thu 2 the gioi',20000000,3),
       (4,'Bai Bien Vung Tau','Mot trong nhung bai bien dep nhat the gioi',15000000,4),
       (5,'Da Lat','Chill chill de chua lanh', 10000000,5);
INSERT INTO clients
VALUES (1,'Dang Le Thanh Cong','012345678','20041205',1),
       (2,'Nguyen Duc Thao Nguyen','000000001','20041206',5),
       (3,'Nguyen Duc Thao Nguyen','000000002','20041207',4),
       (4,'Hoang Ngoc Hieu','000000003','20041209',2),
       (5,'Do Trung Quyet','000000004','20041213',2),
       (6,'Nguyen Trung Quyet','000000005','20041211',5),
       (7,'Do Trung Danh','000000006','20041217',2),
       (8,'Do Hoang Quyet','000000007','20041208',2),
       (9,'Nguyen Trung Anh','000000008','20041216',3),
       (10,'Pham Nhat Vuong','000000009','20041226',2);
INSERT INTO category_tour (category_id, category_code, category_name)
VALUES
    (1, 'VIP', 'Tour VIP'),
    (2, 'STANDARD', 'Tour tiêu chuẩn');
INSERT INTO tour
VALUES
    (1, 'TOUR001', 1, 1, '2020-03-01', '2020-04-05'),
    (2, 'TOUR002', 2, 2, '2020-03-10', '2024-08-15'),
    (3, 'TOUR003', 1, 3, '2020-03-05', '2020-04-08'),
    (4, 'TOUR004', 1, 4, '2024-03-12', '2024-04-18'),
    (5, 'TOUR005', 2, 1, '2024-08-20', '2020-04-25'),
    (6, 'TOUR006', 1, 1, '2024-09-01', '2024-09-05'),
    (7, 'TOUR007', 2, 2, '2024-09-10', '2020-04-15'),
    (8, 'TOUR008', 1, 3, '2024-09-05', '2024-09-08'),
    (9, 'TOUR009', 1, 2, '2024-09-12', '2024-09-18'),
    (10, 'TOUR010', 2, 5, '2024-09-20', '2024-09-25'),
    (11, 'TOUR011', 1, 1, '2024-10-01', '2024-10-05'),
    (12, 'TOUR012', 2, 2, '2024-10-10', '2024-10-15'),
    (13, 'TOUR013', 1, 1, '2024-10-05', '2024-10-08'),
    (14, 'TOUR014', 2, 2, '2024-10-12', '2024-10-18'),
    (15, 'TOUR015', 2, 5, '2024-10-20', '2024-10-25');

INSERT INTO order_tour (order_id, tour_id, clients_id, statuss)
VALUES
    (1, 1, 1, 'Đang xử lý'),
    (2, 2, 2, 'Đã xác nhận'),
    (3, 3, 3, 'Đã thanh toán'),
    (4, 4, 4, 'Đã xác nhận'),
    (5, 5, 5, 'Đã thanh toán'),
    (6, 6, 6, 'Đang xử lý'),
    (7, 7, 7, 'Đang xử lý'),
    (8, 8, 8, 'Đã xác nhận'),
    (9, 9, 9, 'Đã thanh toán'),
    (10, 10, 10, 'Đang xử lý');
SELECT city_name,count(*) as so_luong_tour
From city
JOIN destination on destination.city_id = city.city_id
JOIN tour on destination.destination_id = tour.destination_id
GROUP BY city_name
ORDER BY so_luong_tour DESC ;

SELECT COUNT(*) AS so_luong
from tour
WHERE MONTH(date_start) = 3 AND YEAR(date_start) = 2020;

SELECT COUNT(*) AS so_luong
from tour
WHERE MONTH(date_end) = 4 AND YEAR(date_end) = 2020;
