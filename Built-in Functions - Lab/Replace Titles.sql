SELECT REPLACE(`title`,"The","***")
AS "Title" FROM `books`
WHERE SUBSTRING(`title`,1,3) = "The";