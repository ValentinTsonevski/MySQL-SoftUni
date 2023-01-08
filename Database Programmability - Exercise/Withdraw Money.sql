

DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(account_id INT,money_amount DECIMAL(19,4)) 

BEGIN
START TRANSACTION;
IF(money_amount <= 0) OR (money_amount > (SELECT `balance` FROM `accounts` AS a  WHERE account_id = a.`id`))THEN ROLLBACK;
ELSE UPDATE `accounts` AS acc SET acc.`balance` = `balance` - money_amount
WHERE acc.`id` = account_id;
END IF;

END$$