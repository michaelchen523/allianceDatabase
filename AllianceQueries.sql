/*
Bring up category names
 */

SELECT *
FROM Category_Names;

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
            WHERE Name = 'Housing'
            ) categories
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
edit user phone number
 */
UPDATE Phone_Numbers
SET Phone_Number = '1234567' #new number
WHERE ID = 3; #ID of resource to be changed

/*
edit every attribute of a resource (including sub cat)
 */

UPDATE Resource
SET Name = '', Address_State = '', Address_City = '',       #new info
 Address_Zip = 123, Address_Street = '', Address_Number = 123,
 Website = '', Non_Citizen = 1, Documentation = 0, Eligibility = '',
 Description = ''
 WHERE ID = 1; #ID of resource

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
        Housing_Serve_Multi

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



SELECT rev.avg_rating AS Rating, filter.name AS Name, filter.description AS Description, filter.Address_State AS State,
    filter.Address_City AS city, filter.Address_Zip AS Zip, filter.Address_Street AS Street, filter.Address_Number AS Num
FROM (
    SELECT *
    FROM Resource AS res
    NATURAL JOIN (
            SELECT ID
            FROM Housing
            NATURAL LEFT JOIN (

                SELECT ID #might need to fix
                FROM 
                    Housing_Type_Multi
                NATURAL LEFT JOIN 
                    Housing_Serve_Multi
                WHERE Housing_Serve_Multi = 'Homeless' AND Housing_Type_Multi = 'Shelter' #insert options here

                UNION

                SELECT ID
                FROM
                    Housing_Type_Multi
                NATURAL RIGHT JOIN
                    Housing_Serve_Multi
                WHERE Housing_Serve_Multi = 'Homeless' AND Housing_Type_Multi = 'Shelter' #insert options here

                ) subCat
            WHERE Gender = 'Female'
        ) category
    WHERE Non_Citizen = 0 #insert options here
    ) filter
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS avg_rating
        FROM Reviews
        GROUP BY ID
    ) rev
ORDER BY rev.avg_rating DESC;






