create database product;
use product;
create table customers(
    id int auto_increment primary key,
    name varchar(255),
    address varchar(255),
    email varchar(255)
);
create table orders(
    id int auto_increment primary key ,
    staff varchar(255),
    customer_id int, foreign key (customer_id) references customers(id)
);
insert into customers(id, name, address, email)
VALUES (1,'Quyet','a','b'),
       (0,'Nguyen','c','d');
insert into orders(id, staff, customer_id)
VALUES (1,'Cong',1),
       (2,'Hieu',2);

