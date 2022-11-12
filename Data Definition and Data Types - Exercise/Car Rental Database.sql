
CREATE TABLE `categories`(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
category VARCHAR(30) NOT NULL,
daily_rate DOUBLE(2,1) NOT NULL,
weekly_rate DOUBLE(2,1) NOT NULL,
monthly_rate DOUBLE(2,1) NOT NULL,
weekend_rate DOUBLE(2,1) NOT NULL
);

CREATE TABLE `cars`(
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
plate_number VARCHAR(10) NOT NULL,
make VARCHAR(20) NOT NULL,
model VARCHAR(20) NOT NULL,
car_year INT,
category_id INT,
doors INT,
picture BLOB,
car_condition VARCHAR(20),
available VARCHAR(10) NOT NULL
);

CREATE TABLE `employees` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
title VARCHAR(30) ,
notes TEXT
);

CREATE TABLE `customers` (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
driver_licence_number INT NOT NULL,
full_name VARCHAR(50) NOT NULL,
address VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
zip_code VARCHAR(20) ,
notes TEXT
);

 
 CREATE TABLE `rental_orders` (
 id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
 employee_id INT NOT NULL,
 customer_id INT NOT NULL,
 car_id INT NOT NULL,
 car_condition VARCHAR(30) NOT NULL,
 tank_level VARCHAR(20),
 kilometrage_start INT NOT NULL,
 kilometrage_end INT NOT NULL,
 total_kilometrage INT NOT NULL,
 start_date DATETIME ,
 end_date DATETIME ,
 total_days INT NOT NULL,
 rate_applied DOUBLE (2,1),
 tax_rate VARCHAR(20),
 order_status VARCHAR (30),
 notes TEXT
 );
 
 
 INSERT INTO `categories` (`id`,`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`)
 VALUES(1,"Van",4.5,4.5,4.6,4.7),
 (2,"Car",4.9,4.9,4.9,5.0),
 (3,"Small_Car",4.1,4.1,4.1,5.0);
 
 
 INSERT INTO `cars` (`id`,`plate_number`,`make`,`model`,`car_year`,`category_id`,`doors`,`picture`,`car_condition`,`available`)
 VALUES (1,"OB2296BM","Germany","BMW",2006,NULL,5,NULL,"Excellent","Yes"),
 (2,"OB2232BM","Italy","Alfa",2012,NULL,2,NULL,"Poor","No"),
 (3,"OB9999BM","Germany","Mercedes",2019,NULL,5,NULL,"Good","Yes");


INSERT INTO `employees` (`id`,`first_name`,`last_name`,`title`,`notes`)
VALUES (1,"Ivan","Ivanov","Mr",NULL),
 (2,"Petkan","Petkanov","Mr","Holidey for next 2 weeks"),
 (3,"Dragan","Draganov","Mr",NULL);
 
 
 INSERT INTO `customers` (`id`,`driver_licence_number`,`full_name`,`address`,`city`,`zip_code`,`notes`)
 VALUES(1,59231425,"Ivan Ivanov Ivanov","Alexandra Road","Doncaster",NULL,NULL),
 (2,59231425,"Ivan Asenov Krumov","Radcliffe Road","Birmingham",NULL,NULL),
 (3,59231425,"Asen Ivanov Petkov","Iport Avenue","Liverpool",NULL,NULL);
 
 
 INSERT INTO `rental_orders` (`id`,`employee_id`,`customer_id`,`car_id`,`car_condition`,`tank_level`,
 `kilometrage_start`,`kilometrage_end`,`total_kilometrage`,`start_date`,`end_date`,`total_days`,`rate_applied`,`tax_rate`,`order_status`,`notes`)
VALUES (1,12,23412,3312,"Good","full",1000,1100,100,'2020-10-25','2020-10-27',2,NULL,NULL,NULL,NULL),
(2,11,26412,6312,"Good","empty",2000,2100,200,'2020-09-24','2020-09-26',2,NULL,NULL,NULL,NULL),
(3,9,25412,2312,"Good","full",3000,3100,300,'2021-03-05','2021-05-05',2,NULL,NULL,NULL,NULL);
 
 