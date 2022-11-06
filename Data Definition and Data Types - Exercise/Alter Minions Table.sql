

ALTER TABLE `minions1`
ADD COLUMN `town_id` INT;

ALTER TABLE `minions1`
ADD CONSTRAINT fk_minions1_towns
FOREIGN KEY `minions1`(`town_id`)
REFERENCES `towns`(`id`);
