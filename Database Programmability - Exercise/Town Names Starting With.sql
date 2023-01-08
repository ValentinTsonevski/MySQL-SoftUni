DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with (target_word_in_town VARCHAR(50))
BEGIN
SELECT `name` FROM `towns` WHERE `name` LIKE CONCAT(target_word_in_town,'%')
ORDER BY `name`;

END$$

