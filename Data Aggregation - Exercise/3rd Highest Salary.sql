SELECT DISTINCT `department_id`,(SELECT  DISTINCT `salary`
        FROM    `employees` e
        WHERE   e.`department_id` = `employees`.`department_id`
        ORDER BY `salary` DESC
        LIMIT 1 OFFSET 2
        ) AS `third_highest_salary`
FROM    `employees`
HAVING `third_highest_salary` IS NOT NULL
ORDER BY `department_id`;