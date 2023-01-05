SELECT 
    c.`country_code`,
    COUNT(m.`mountain_range`) AS `mountain_range`
FROM
    `mountains` AS m
        JOIN
    `mountains_countries` AS c ON m.`id` = c.`mountain_id`
WHERE
    c.`country_code` IN ('BG' , 'RU', 'US')
GROUP BY c.`country_code`
ORDER BY `mountain_range` DESC;
