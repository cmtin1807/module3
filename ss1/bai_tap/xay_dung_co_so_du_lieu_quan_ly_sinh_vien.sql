create database manager_student;
use manager_student;
create table class(
    id int,
    name varchar(255)
);
create table teacher(
    id int,
    name varchar(255),
    age int,
    country varchar(255)
);
use manager_student;
insert into class (id, name)
VALUES (1,'Nguyen');
insert into class (id, name)
VALUES (2,'Quyet');
insert into teacher (id, name, age, country)
VALUES (1,'Chanh',40,'Quang Nam');
insert into teacher (id, name, age, country)
VALUES (1,'Phuong',25,'Hue');
