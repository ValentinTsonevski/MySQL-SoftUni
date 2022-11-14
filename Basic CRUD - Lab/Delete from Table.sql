
DELETE  FROM `employees`
WHERE `department_id` = 2 OR `department_id` = 1;

SELECT `id`,`first_name` AS `First_name`,`last_name` AS `Last_name`, `job_title` AS `Job_title`,`department_id` AS `Department_id`, `salary`
FROM `employees` ORDER BY `id`;