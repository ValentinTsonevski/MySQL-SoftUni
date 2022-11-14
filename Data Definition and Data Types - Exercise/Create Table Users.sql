
 CREATE TABLE `users`(
 id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(30) UNIQUE,
 password VARCHAR(26),
 profile_picture BLOB,
 last_login_time TIMESTAMP,
 is_deleted BOOLEAN
 );
 
 INSERT INTO `users`(id,username,password,profile_picture,last_login_time,is_deleted)
 VALUES ("1","username123","password123",NULL,'1998-04-02 20:23:15',FALSE),
  ("2","username321","password321",NULL,NULL,TRUE),
  ("3","username456","password456",NULL,NULL,FALSE),
  ("4","usernameAsd","passwordAsd",NULL,NULL,TRUE),
  ("5","usernameDsa","passwordDsa",NULL,NULL,FALSE);
 
 