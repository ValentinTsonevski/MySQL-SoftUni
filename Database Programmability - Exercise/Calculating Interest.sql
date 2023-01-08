
 
 DELIMITER $$ 
CREATE PROCEDURE usp_calculate_future_value_for_account (account_id INT,interest_rate DECIMAL(19,4))

BEGIN
SELECT a.`id` AS `account_id`,acch.`first_name`,acch.`last_name`,
a.`balance` AS `current_balance`, ufn_calculate_future_value(a.`balance`,interest_rate,5) AS `balance_in_5_years`
FROM `account_holders` AS acch
JOIN `accounts` AS a ON a.`account_holder_id` = acch.`id`
WHERE a.`id` = account_id ;
END$$