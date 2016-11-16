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
1. find resources based on category
    1. sorted by rating <- order by and avg
    2. show rating, name, and description
Order by rating

implementation:
1) join resourse and categories to filter via category (name join resource)
2) join newly joined table 'resource' and reviews to get avg score
 */



#Housing

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
2. find filtering options based on category
ex: housing
 */

SELECT COLUMN_NAME AS filter_ops
FROM INFORMATION_SCHEMA.COLUMNS
/*
exchange Housing for each table name
 */
WHERE  TABLE_NAME = 'Housing' 
        AND COLUMN_NAME != 'ID';

/*
Acess phone number
 */
SELECT Phone_Number
FROM Phone_Numbers
WHERE ID = 3; #input resource ID

/*
edit every attribute of a resource (including sub cat)
 */

UPDATE Resource
SET Name = '', Address_State = '', Address_City = '',       #new info
 Address_Zip = 123, Address_Street = '', Address_Number = 123,
 Website = '', Non_Citizen = 1, Documentation = 0, Eligibility = '',
 Description = ''
 WHERE ID = 1; #ID of resource

UPDATE Phone_Numbers
SET Phone_Number = '1234'
WHERE ID = 1;

UPDATE Housing_Type_Multi#category name
 SET Housing_Type_Multi = 'Group'#attribute names
 WHERE ID = 1; #ID of resource


/*
given resource ID, show every attribute all info
 */

#housing
SELECT *
FROM (
    SELECT *
    FROM 
        Housing_Type_Multi
    NATURAL LEFT JOIN 
        Housing_Serve_
        Multi

    UNION

    SELECT *
    FROM 
        Housing_Type_Multi
    NATURAL RIGHT JOIN 
        Housing_Serve_Multi
    ) type
NATURAL RIGHT JOIN 
    Housing
NATURAL LEFT JOIN 
    Phone_Numbers
NATURAL JOIN 
    Resource
WHERE ID = 1; #INSERT ID HERE


/*
add a resource 
 */

/*
3. based on filtering selections, produce resources 
ex: housing, gender = female
 
implementation:
1) filter out within the housing table to find female
2) join filtered housing with resource to get name/ description (name filter)
3) join newly created 'filter' with review to get avg score
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
                    Housing_Type_Multi
                NATURAL LEFT JOIN 
                    Housing_Serve_Multi
                WHERE Housing_Serve_Multi = 'Homeless' AND Housing_Type_Multi = 'Shelter' #insert subcategory filters

                UNION

                SELECT ID
                FROM
                    Housing_Type_Multi
                NATURAL RIGHT JOIN
                    Housing_Serve_Multi
                WHERE Housing_Serve_Multi = 'Homeless' AND Housing_Type_Multi = 'Shelter' #insert subcategory filters

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
See favorites

Given: username
Pull: name, description, rating address
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
editing a resource
 */

UPDATE Resource
SET Name = 'foobar', Creator_Username = 'SonikaF', Address_State = 'GA', Address_City = 'Atlanta', Address_Zip = 1234, #put data which is to be updated here
 Address_Street = 'Peachtree', Address_Number = '5', Website = null, Non_Citizen = 1, Documentation = 0,
 Eligibility = 'not you', Description = 'poop'
WHERE ID = 1; #Put ID of resource to edit here

UPDATE Phone_Numbers
SET Phone_Number = '1234'
WHERE ID = 1;

UPDATE Housing
SET 



