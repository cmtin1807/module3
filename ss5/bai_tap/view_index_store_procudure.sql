CREATE database demo;
use demo;
CREATE TABLE product(
    product_id INT AUTO_INCREMENT PRIMARY KEY ,
    product_code VARCHAR(255),
    product_name VARCHAR(255),
    product_price INT,
    product_amount INT,
    product_description VARCHAR(255),
    product_status BIT
);
INSERT INTO product(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES ('IP6','Iphone 6', 2000, 1, 'San Pham cua Iphone', 1 ),
       ('IP15','Iphone 15', 4000, 2, 'San Pham cua Iphone', 1 );
INSERT INTO product(product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES ('IP9','Iphone 9', 2500, 1, 'San Pham cua Iphone', 1 ),
       ('IP10','Iphone 10', 3000, 2, 'San Pham cua Iphone', 1 );
ALTER table product ADD UNIQUE INDEX product_codes(product_code);
ALTER table product drop index product_codes;
ALTER table product ADD INDEX product_code_name(product_name,product_price);
ALTER table product drop index product_code_name;
EXPLAIN SELECT * FROM product WHERE product_name = 'Iphone 6' AND product_price = 2000;


CREATE VIEW data_product AS
    SELECT product.product_code, product.product_name, product.product_price,product.product_status
FROM product;

CREATE OR REPLACE VIEW  data_product AS
SELECT product.product_code, product.product_name, product.product_price,product_description, product.product_status
FROM product;

drop view data_product;

DELIMITER //
CREATE procedure all_info()
BEGIN
    SELECT * FROM product;
end //

DELIMITER ;
call all_info();

DELIMITER //

CREATE PROCEDURE add_product(
    IN p_product_code VARCHAR(255),
    IN p_product_name VARCHAR(255),
    IN p_product_price INT,
    IN p_product_amount INT,
    IN p_product_description VARCHAR(255),
    IN p_product_status BIT
)
BEGIN
    INSERT INTO product(product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE update_product(
    IN p_product_id INT,
    IN p_product_code VARCHAR(255),
    IN p_product_name VARCHAR(255),
    IN p_product_price INT,
    IN p_product_amount INT,
    IN p_product_description VARCHAR(255),
    IN p_product_status BIT
)
BEGIN
    UPDATE product
    SET product_code = p_product_code,
        product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description,
        product_status = p_product_status
    WHERE product_id = p_product_id;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE remove_product(
    IN p_product_id INT
)
BEGIN
    DELETE FROM product Where product_id = p_product_id;

end //
DELIMITER ;
call remove_product (1);
call add_product('IP11','Iphone 6', 2000, 1, 'San Pham cua Iphone', 1);
call update_product(2,'IP12','Iphone 6', 2000, 1, 'San Pham cua Iphone', 1)


