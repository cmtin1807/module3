use classicmodels;
DELIMITER //
DROP PROCEDURE IF EXISTS `getCusById`//
CREATE PROCEDURE getCusById(
    IN cusNum INT
)
BEGIN
    SELECT * FROM customers
        WHERE customerNumber = cusNum;
end //
DELIMITER ;
CALL getCusById(175);