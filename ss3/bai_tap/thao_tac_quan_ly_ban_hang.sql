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
SELECT order_id AS oID, order_date AS oDate, order_total_price AS oPrice
FROM orders;

SELECT c.customer_id, c.customer_name, p.product_id, p.product_name
FROM customer c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
         LEFT JOIN order_detail od ON o.order_id = od.order_id
         LEFT JOIN product p ON od.product_id = p.product_id;

SELECT c.customer_id, c.customer_name
FROM customer c
         LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT o.order_id AS MaHoaDon, o.order_date AS NgayBan,
       SUM(od.order_detail_qty * p.product_price) AS GiaTien
FROM orders o
         JOIN order_detail od ON o.order_id = od.order_id
         JOIN product p ON od.product_id = p.product_id
GROUP BY o.order_id, o.order_date;
