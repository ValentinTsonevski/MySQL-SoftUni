SELECT `name` AS `game`,CASE
WHEN HOUR(`start`) < 12 THEN 'Morning'
WHEN HOUR(`start`) < 18 THEN 'Afternoon'
ELSE 'Evening'
END
AS `Part Of The Day`,
CASE
WHEN `duration` <= 3 THEN 'Extra Short'
WHEN `duration` <= 6 THEN 'Short'
WHEN `duration` <=10 THEN 'Long'
ELSE 'Extra Long'
END
AS `Duration` FROM `games`;