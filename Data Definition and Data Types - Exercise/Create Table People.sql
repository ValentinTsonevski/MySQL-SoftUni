CREATE TABLE `people`(
id INT  UNIQUE PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(3,2),
weight DOUBLE(4,2),
gender CHAR(1) NOT NULL,
birthdate DATETIME NOT NULL,
biography TEXT
);

INSERT INTO `people`(id,name,picture,height,weight,gender,birthdate,biography)
VALUES ("1","Ivan",NULL,1.68,85.25,"m",'1990-09-09 10:13:15',NULL),
 ("2","Georgi",NULL,1.78,82.25,"m",'1993-03-05 10:23:11',NULL),
 ("3","Maria",NULL,1.70,52.35,"f",'1998-04-02 20:23:15',NULL),
 ("4","Ivailo",NULL,1.78,82.25,"m",'1983-01-05 16:43:55',NULL),
 ("5","Simeon",NULL,1.78,82.25,"m",'1975-05-05 13:33:15',NULL);