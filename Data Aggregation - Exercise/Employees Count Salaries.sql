SELECT COUNT(`salary`) AS `count_no_manager`FROM `employees`
WHERE `manager_id` IS NULL;