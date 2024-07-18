use quan_ly_ban_hang;
insert into customer
VALUES (1,'Minh Quan', 10),
       (2,'Ngoc Oanh', 20),
       (3,'Hong Ha', 50);
insert into orders(order_id, customer_id, order_date)
VALUE (1,1,'2006-03-21'),
    (2,2,'20060323'),
      (3,1,'20060316');
insert into product
VALUES (1,'May Giat',3),
       (2,'Tu Lanh',5),
       (3,'Dieu Hoa',7),
       (4,'Quat',1),
       (5,'Bep Dien',2);
insert into order_detail
VALUES (1,1,3),
       (1,3,7),
       (1,4,2),
       (2,1,1),
       (3,1,8),
       (2,5,4),
       (2,3,3);