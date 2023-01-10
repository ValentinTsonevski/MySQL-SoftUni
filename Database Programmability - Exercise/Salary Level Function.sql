DELIMITER $$
CREATE FUNCTION ufn_get_salary_level (employee_salary DECIMAL(19,4))
RETURNS VARCHAR(8)
DETERMINISTIC

BEGIN
DECLARE salary_Level VARCHAR(8);

IF employee_salary < 30000 THEN SET salary_Level := "Low";
ELSEIF employee_salary <= 50000 THEN SET salary_Level := "Average";
ELSE SET salary_Level  := "High";
END IF;
RETURN salary_Level;	
END$$
