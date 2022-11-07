

 CREATE TABLE `directors`(
 id INT PRIMARY KEY AUTO_INCREMENT,
 director_name VARCHAR(30) NOT NULL,
 notes VARCHAR(100)
 );
 
 CREATE TABLE `genres`(
 id INT PRIMARY KEY AUTO_INCREMENT,
 genre_name VARCHAR(30) NOT NULL,
 notes VARCHAR(100)
 );

 CREATE TABLE `categories`(
 id INT PRIMARY KEY AUTO_INCREMENT,
 category_name VARCHAR(30) NOT NULL,
 notes VARCHAR(100)
 );
 
 CREATE TABLE `movies`(
 id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(30) NOT NULL,
 director_id INT,
 copyright_year YEAR,
 length DOUBLE(3,2),
 genre_id INT,
 category_id INT,
 rating DOUBLE(2,1),
 notes VARCHAR(100)
 );
 
 
 INSERT INTO `directors`(id,director_name,notes)
 VALUES ("1","Ivan",NULL),
("2","Gosho",NULL),
("3","Petko","hi"),
("4","Georgi",NULL),
("5","Marin",NULL);
 
 INSERT INTO `genres`(id,genre_name,notes)
 VALUES ("1","Ivan",NULL),
("2","Gosho",NULL),
("3","Petko","hi"),
("4","Georgi",NULL),
("5","Marin",NULL);
 
 INSERT INTO `categories`(id,category_name,notes)
 VALUES ("1","Ivan",NULL),
("2","Gosho",NULL),
("3","Petko","hi"),
("4","Georgi",NULL),
("5","Marin",NULL);

INSERT INTO `movies`(id,title,director_id,copyright_year,length,genre_id,category_id,rating,notes)
VALUES ("1","Comedy","1","2019",2.35,"1","1",4.5,NULL),
("2","Comedy","2","2016",2.35,"1","1",5.5,NULL),
("3","Drama","3","2017",2.35,"1","1",4.7,"bad movie"),
("4","Comedy","1","2018",2.35,"1","1",4.4,NULL),
("5","Horror","1","2009",2.35,"1","1",6.0,"nice movie");
 