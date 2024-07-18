create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
    customer_id int auto_increment primary key ,
    customer_name varchar(50) not null ,
    customer_age int
);
create table orders(
    order_id varchar(20) primary key ,
    customer_id int ,
    order_date datetime not null ,
    order_total_price double,
    foreign key (customer_id) references customer (customer_id)
);
create table product(
    product_id varchar(20) primary key ,
    product_name varchar(50) not null ,
    product_price double not null
);
create table order_detail(
    order_id varchar(20),
    product_id varchar(20),
    order_detail_qty varchar(50),
    primary key (order_id,product_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references product(product_id)
)