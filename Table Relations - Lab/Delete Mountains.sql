CREATE TABLE `mountains` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(40));
   
CREATE TABLE `peaks` (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(40),
   `mountain_id` INT,
CONSTRAINT `fk_peaks_mountain`
FOREIGN KEY (`mountain_id`)
REFERENCES `mountains`(`id`)
ON DELETE CASCADE);