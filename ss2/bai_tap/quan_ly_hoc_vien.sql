create database quan_ly_hoc_vien;
use quan_ly_hoc_vien;
create table address(
    address_id int primary key ,
    address varchar(50)
);
create table classes(
    classes_id varchar(20) primary key ,
    classes_name varchar(20) not null ,
    language varchar(20) not null ,
    description varchar(250)
);
create table student(
    student_id int primary key ,
    full_name varchar(30) not null ,
    address_id int,
    age int,
    phone varchar(10) unique ,
    classes_id varchar(20),
    foreign key (address_id) references address(address_id),
    foreign key (classes_id) references classes(classes_id)
);
create table course(
    course_id int primary key ,
    course_name varchar(20),
    description varchar(250)
);
create table point(
    point_id varchar(20) primary key ,
    course_id int,
    student_id int,
    point float,
    foreign key (course_id) references course(course_id),
    foreign key (student_id) references student(student_id)
);
insert into address
values(1,'Da Nang') ,
      (2, 'Quang Nam'),
      (3, 'Sai Gon'),
      (4, 'Ha Noi'),
      (5, 'Quang Ngai');
insert into classes
values ('C01', 'Toan', 'English', 'Lop Toan Nang Cao '),
       ('C02', 'Ly', 'Vietnamese', 'Lop Ly Nang Cao '),
       ('C03', 'Hoa', 'English', 'Lop Hoa Nang Cao'),
       ('C04', 'Van Hoc', 'Vietnamese', 'Lop Chuyen Van'),
       ('C05', 'Lich Su', 'Vietnamese', 'Lop Lich Su The Gioi');
insert into student
values (1, 'Nguyen Van Anh', 1, 20, '0901234567', 'C01'),
       (2, 'Le Thi Anh', 2, 22, '0901234568', 'C02'),
       (3, 'Tran Van Nguyen', 3, 19, '0901234569', 'C03'),
       (4, 'Nguyen Thi Sang', 4, 23, '0901234570', 'C04'),
       (5, 'Pham Van Luyen', 5, 18, '0901234571', 'C05'),
       (6, 'Nguyen Van Trinh', 1, 21, '0901234572', 'C01'),
       (7, 'Le Thi Hong', 2, 20, '0901234573', 'C02'),
       (8, 'Tran Van Huyen', 3, 22, '0901234574', 'C03'),
       (9, 'Nguyen Thi Anh', 4, 19, '0901234575', 'C04'),
       (10, 'Pham Van Ngan', 5, 25, '0901234576', 'C05');
insert into course
values (1, '1991-1992','Khoa nhat'),
       (2, '1992-1993','Khoa hai'),
       (3, '1993-1994','Khoa ba'),
       (4, '1994-1992','Khoa bon'),
       (5, '1995-1992','Khoa nam'),
       (6, '1996-1992','Khoa sau'),
       (7, '1997-1992','Khoa bay'),
       (8, '1998-1992','Khoa tam'),
       (9, '1999-1992','Khoa chin'),
       (10, '2000-1992','Khoa muoi'),
       (11, '2001-1992','Khoa muoi mot'),
       (12, '2002-1992','Khoa muoi hai'),
       (13, '2003-1992','Khoa muoi ba'),
       (14, '2004-1992','Khoa muoi bon'),
       (15, '2005-1992','Khoa muoi nam'),
       (16, '2006-1992','Khoa muoi sau'),
       (17, '2007-1992','Khoa muoi bay'),
       (18, '2008-1992','Khoa muoi tam'),
       (19, '2009-1992','Khoa muoi chin'),
       (20, '2010-1992','Khoa hai muoi');
insert into point
values  ('P01', 1, 1, 85.5),
        ('P02', 2, 2, 78.0),
        ('P03', 3, 3, 88.0),
        ('P04', 4, 4, 92.0),
        ('P05', 5, 5, 74.5),
        ('P06', 1, 6, 90.0),
        ('P07', 2, 7, 80.5),
        ('P08', 3, 8, 85.0),
        ('P09', 4, 9, 79.0),
        ('P10', 5, 10, 95.0),
        ('P11', 1, 1, 88.0),
        ('P12', 2, 2, 82.0),
        ('P13', 3, 3, 91.0),
        ('P14', 4, 4, 93.0),
        ('P15', 5, 5, 76.0);
select * from student where full_name LIKE 'Nguyen%';
select * from student where full_name like '% Anh';
select * from student where age between 18 and 25;
select * from student where student_id in(9,13);
select classes_id, count(*) as student_count from student group by classes_id;
select ad.address, count(*) AS student_count
FROM student st
right join address ad on ad.address_id = st.address_id
group by ad.address
having student_count >2;

select course_id, avg(point) as avg_point
from point
group by course_id
order by avg_point desc,course_id desc;

select max(point) as max_point, min(point) as min_point
from point;

select upper(full_name) as full_name
from student;

select point.course_id,avg(point) as avg_max_point
from point
group by course_id
order by avg_max_point desc
limit 1;





