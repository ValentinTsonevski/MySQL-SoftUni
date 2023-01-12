CREATE TABLE `movies_additional_info`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`rating` DECIMAL(10,2) NOT NULL,
`runtime` INT NOT NULL,
`picture_url` VARCHAR(80) NOT NULL,
`budget` DECIMAL(10,2),
`release_date` DATE NOT NULL,
`has_subtitles` TINYINT(1),
`description` TEXT
);


CREATE TABLE `countries`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(30) NOT NULL UNIQUE,
`continent` VARCHAR(30) NOT NULL ,
`currency` VARCHAR(5) NOT NULL 
);

CREATE TABLE `actors`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50) NOT NULL,
`birthdate` DATE NOT NULL,
`height` INT,
`awards` INT,
`country_id` INT NOT NULL,

CONSTRAINT `fk_actors_countries`
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`)
);


CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`title` VARCHAR(70) NOT NULL UNIQUE,
`country_id` INT NOT NULL,
`movie_info_id` INT NOT NULL UNIQUE,

CONSTRAINT `fk_movies_counties`
FOREIGN KEY (`country_id`)
REFERENCES `countries`(`id`),

CONSTRAINT `fk_movies_movies_aditional_info`
FOREIGN KEY (`movie_info_id`)
REFERENCES `movies_additional_info`(`id`)
);



CREATE TABLE `movies_actors`(
`movie_id` INT,
`actor_id` INT,
 KEY `pk_movies_actors`(`movie_id`,`actor_id`),

CONSTRAINT `fk_movies_actors_movies`
FOREIGN KEY (`movie_id`)
REFERENCES `movies`(`id`),

CONSTRAINT `fk_movies_actors_actors`
FOREIGN KEY (`actor_id`)
REFERENCES `actors`(`id`)
);


CREATE TABLE `genres`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE `genres_movies`(
`genre_id` INT,
`movie_id` INT,
 KEY (`genre_id`,`movie_id`),

CONSTRAINT `fk_genres_movies_genres`
FOREIGN KEY (`genre_id`)
REFERENCES `genres`(`id`),

CONSTRAINT `fk_genres_movies_movies`
FOREIGN KEY (`movie_id`)
REFERENCES `movies`(`id`)
);


INSERT INTO `actors` (`first_name`,`last_name`,`birthdate`,`height`,`awards`,`country_id`)
SELECT REVERSE(`first_name`),
REVERSE (`last_name`),
`birthdate`- 2,
`height` + 10,
`country_id`,
 (SELECT`id` FROM `countries` WHERE `name` LIKE "Armenia")
 FROM `actors` WHERE `id` <= 10;


UPDATE `movies_additional_info` 
SET `runtime` = `runtime` - 10 
WHERE `id` BETWEEN 15 AND 25;


DELETE c  FROM `countries` AS c WHERE c.`id` NOT IN(SELECT `country_id` FROM `movies`);



SELECT `id`,`name`,`continent`,`currency` FROM `countries`
ORDER BY `currency` DESC, `id`;


SELECT mad.`id`,m.`title`,mad.`runtime`,mad.`budget`,mad.`release_date` FROM `movies_additional_info` AS mad
JOIN `movies` AS m
ON m.`movie_info_id` = mad.`id`
WHERE YEAR(`release_date`)  BETWEEN 1996 AND 1999
ORDER BY `runtime`,`id`
LIMIT 20;


SELECT CONCAT(`first_name`," ",`last_name`) AS `full_name`,
 CONCAT((REVERSE(`last_name`)) , (CHAR_LENGTH(`last_name`)) ,"@cast.com")	AS `email`,
CONCAT( 2022 - YEAR(`birthdate`)) AS `age`,`height` FROM `actors` AS a
LEFT JOIN `movies_actors` AS ma
ON a.`id` = ma.`actor_id`
WHERE `actor_id` IS NULL
ORDER BY `height` ; 


SELECT c.`name`, count(m.`id`) AS `movies_count`
FROM `movies` AS m
LEFT JOIN `countries` AS c 
ON m.`country_id` = c.`id`
GROUP BY m.`country_id`
HAVING `movies_count` >= 7
ORDER BY c.`name` DESC;



SELECT m.`title`,CASE
WHEN mad.`rating` <= 4 THEN "poor"
WHEN mad.`rating` <= 7 THEN "good"
ELSE "excellent"
END 
AS `rating`,
IF(mad.`has_subtitles`,"english","-") AS `subtitles`,
mad.`budget` FROM `movies` AS m
JOIN `movies_additional_info` AS mad
ON m.`movie_info_id` = mad.`id`
ORDER BY `budget` DESC;


DELIMITER $$
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE history_movies INT;
    SET history_movies := (
		SELECT count(ma.movie_id)
        FROM movies_actors AS ma
        JOIN actors AS a
        ON ma.actor_id = a.id
        JOIN genres_movies AS gm
        ON gm.movie_id = ma.movie_id
        JOIN genres AS g
        ON gm.genre_id = g.id
        WHERE concat_ws(' ', a.first_name, a.last_name) = full_name AND g.`name` = 'History'
        GROUP BY ma.actor_id
    );
    RETURN history_movies;
END$$

DELIMITER $$
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
	UPDATE actors AS a
	JOIN movies_actors AS ma
    ON a.id = ma.actor_id
    JOIN movies AS m
    ON ma.movie_id = m.id
    SET a.awards = a.awards + 1
	WHERE m.title = movie_title;
END$$



