/*
Bring up category names
 */
SELECT *
FROM Category_Names;


/*
Given ID
Find category name
 */
SELECT Name
FROM Categories
WHERE ID = 1;


/*
Search based on category
 */
SELECT rev.rating, res.name, res.description, res.Address_State AS State,
    res.Address_City AS City, res.Address_Zip AS Zip, res.Address_Street AS Street,
    res.Address_Number AS Num
FROM (
        SELECT *
        FROM Resource
        NATURAL JOIN (
            SELECT ID
            FROM Categories
            WHERE Name = 'Housing' #put in category name
            ) categories
    ) res
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS rating
        FROM Reviews
        GROUP BY ID
    ) rev

ORDER BY rev.rating DESC;



/*
search by name
 */
SELECT rev.rating, res.name, res.description, res.Address_State AS State,
    res.Address_City AS City, res.Address_Zip AS Zip, res.Address_Street AS Street,
    res.Address_Number AS Num
FROM (
        SELECT *
        FROM Resource
        WHERE name = 'Beloved' #insert name here
    ) res
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS rating
        FROM Reviews
        GROUP BY ID
    ) rev

ORDER BY rev.rating DESC;



/*
 find filtering options based on category
ex: housing
 */
SELECT COLUMN_NAME AS filter_ops
FROM INFORMATION_SCHEMA.COLUMNS
WHERE  TABLE_NAME = 'Housing' #insert category name
        AND COLUMN_NAME != 'ID';

/*
Acess phone number
 */
SELECT Phone_Number
FROM Phone_Numbers
WHERE ID = 3; #input resource ID


/*
given resource ID, show every attribute all info
 */

#2 categories 

SELECT *
FROM (
    SELECT *
    FROM Housing #Insert category name 1 here
    NATURAL LEFT JOIN 
        Phone_Numbers
    NATURAL JOIN 
        Resource
    ) category1
JOIN (
    SELECT *
    FROM Medical #Insert category name 2 here
    NATURAL LEFT JOIN 
        Phone_Numbers
    NATURAL JOIN 
        Resource
    ) category2
ON category1.ID = category2.ID 
WHERE category1.ID = 1; #INSERT ID HERE

#2 sub categories

SELECT *
FROM Housing_Type #Insert subcategory 1 here
WHERE ID = 1; #INSERT ID HERE

SELECT *
FROM Housing_Serve #Insert subcategory 2 here
WHERE ID = 1; #INSERT ID HERE

#1 sub category

SELECT *
FROM Med_Type #Insert subcategory 1 here
WHERE ID = 1; #INSERT ID HERE



/*
Search based on filtering selections
 */
SELECT rev.avg_rating AS Rating, res.name AS Name, res.description AS Description, res.Address_State AS State,
    res.Address_City AS city, res.Address_Zip AS Zip, res.Address_Street AS Street, res.Address_Number AS Num
FROM (
    SELECT *
    FROM Resource
    NATURAL JOIN (
            SELECT ID
            FROM Housing
            NATURAL LEFT JOIN (

                SELECT ID #might need to fix
                FROM 
                    Housing_Type
                NATURAL LEFT JOIN 
                    Housing_Serve
                WHERE Housing_Serve = 'Homeless' AND Housing_Type = 'Shelter' #insert subcategory filters

                UNION

                SELECT ID
                FROM
                    Housing_Type
                NATURAL RIGHT JOIN
                    Housing_Serve
                WHERE Housing_Serve = 'Homeless' AND Housing_Type = 'Shelter' #insert subcategory filters

                ) subCat
            WHERE Gender = 'Female' #insert category filters
        ) category
    WHERE Non_Citizen = 0 #insert resource filters
    ) res
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS avg_rating
        FROM Reviews
        GROUP BY ID
    ) rev
ORDER BY rev.avg_rating DESC;


/*
See user favorites
 */
SELECT rev.avg_rating AS Rating, res.name AS Name, res.description AS Description, res.Address_State AS State,
    res.Address_City AS city, res.Address_Zip AS Zip, res.Address_Street AS Street, res.Address_Number AS Num
FROM (
    SELECT *
    FROM (
        SELECT ID
        FROM User_Favorites
        WHERE Username = 'SonikaF'  #insert username here
        ) favs
    NATURAL JOIN Resource
    ) res
NATURAL LEFT JOIN (
    SELECT ID, AVG(Rating) AS avg_rating
    FROM Reviews
    GROUP BY ID
    ) rev
ORDER BY rev.avg_rating DESC;

/*
See if resource is a favorite
 */
SELECT * #if empty set, then not a fav
FROM User_Favorites
WHERE Username = 'SonikaF' AND ID = 1; #insert user's username and resource's ID

/*
pull ratings for a resource
 */
SELECT Rating, Testimonial
FROM Reviews
WHERE ID = 1; #insert ID here



