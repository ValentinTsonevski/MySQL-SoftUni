
SELECT `department_id`, ROUND(MIN(`salary`),2) AS `Min Salaray` FROM `employees`
GROUP BY `department_id`
HAVING `Min Salaray` > 800;