
DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level (salary_level VARCHAR(8))
BEGIN
SELECT `first_name`,`last_name` FROM `employees`
 WHERE ufn_get_salary_level(`salary`) LIKE salary_level
ORDER BY `first_name` DESC, `last_name` DESC;
END$$