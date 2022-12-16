
SELECT `department_id`, ROUND(AVG(`salary`),2) FROM `employees` AS `Average Salary`
GROUP BY `department_id`
ORDER BY `department_id`;