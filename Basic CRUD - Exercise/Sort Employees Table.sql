SELECT `employee_id` AS `id`,`first_name` AS "First Name", 
`last_name` AS "Last Name",
 `middle_name` AS "Middle Name",
 `job_title`,`department_id` AS "Dept ID",
 `manager_id` AS "Mangr ID",
 `hire_date` AS "Hire Date",
 `salary`,`address_id`
 FROM `employees`
ORDER BY `salary`DESC,`first_name`,`last_name`DESC,`middle_name`;