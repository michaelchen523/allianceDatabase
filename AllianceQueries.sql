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

SELECT rev.rating,
       resource.name,
       resource.description
FROM (
        SELECT res.Name AS name,
               res.Description AS description,
               res.ID AS ID
        FROM Resource AS res
        JOIN (
                SELECT *
                FROM Categories
        /*
        exchange Housing for category name
         */
                WHERE Name = 'Housing'
            ) category
        ON  category.ID = res.ID
    ) resource
LEFT JOIN (
        SELECT ID, AVG(Rating) AS rating
        FROM Reviews
        GROUP BY ID
    ) rev

ON rev.ID = resource.ID

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
WHERE ID = #input resource ID

/*
edit user phone number
 */
UPDATE Phone_Numbers
SET Phone_Number = '1234567890' #new number
WHERE ID = 1 #ID of resource to be changed

/*
edit every attribute of a resource (including sub cat)
 */

UPDATE Resource
SET Name = '', Address_State = '', Address_City = '',       #new info
 Address_Zip = 123, Address_Street = '', Address_Number = 123,
 Website = '', Non_Citizen = 1, Documentation = 0, Eligibility = '',
 Description = ''
 WHERE ID = 1 #ID of resource

 UPDATE #category name
 SET #attribute names
 WHERE ID = 1 #ID of resource


/*
given resource ID, show every attribute all info
 */

#housing
SELECT category.Type AS Type, category.Serve AS Serve, category.Capacity AS Capacity,
    category.Gender AS Gender, category.AgeMax AS AgeMax, category.AgeMin AS AgeMin,
    category.Children AS Children, resInfo.Phone_Number AS Phone_Number, 
    resInfo.Name AS Name, resInfo.User AS User, resInfo.State AS State, 
    resInfo.City AS City, resInfo.Zip AS Zip, resInfo.Street AS Street,
    resInfo.Num AS Num, resInfo.Website AS Website, resInfo.Non_Citizen AS Non_Citizen,
    resInfo.Docs AS Docs, resInfo.Eligibility AS Eligibility, resInfo.Description AS Description,
FROM (
    SELECT subCat.Type AS Type, subCat.Serve AS Serve, subCat.ID AS ID, 
        house.Capacity AS Capacity, house.Gender AS Gender, house.AgeMax AS AgeMax,
        house.AgeMin AS AgeMin, house.Children AS Children
    FROM (
        SELECT type.Type_Multi AS Type, serve.Type_Multi AS Serve, serve.ID AS ID
        FROM (
            SELECT Type_Multi, ID
            FROM Housing_Type_Multi
            WHERE ID = 1 #insert ID here
            ) type
        JOIN (
            SELECT Type_Multi, ID
            FROM Housing_Serve_Multi
            WHERE ID = 1 #insert ID here
            ) serve
        ON serve.ID = type.ID
        ) subCat
    RIGHT JOIN (
        SELECT ID, Capacity, Gender, AgeMax, AgeMin, Children
        FROM Housing
        WHERE ID = 1 #insert ID here
        ) house
    ON subCat.ID = house.ID
    ) category
JOIN (
    SELECT res.ID AS ID, res.Name AS Name, res.Creator_Username AS User, 
    res.Address_State AS State, res.Address_City AS City, res.Address_Zip AS Zip,
    res.Address_Street AS Street, res.Address_Number AS Num, res.Website AS Website,
    res.Non_Citizen AS Non_Citizen, res.Documentation AS Docs, res.Eligibility AS Eligibility,
    res.Description AS Description, phone.Phone_Number AS Phone_Number
    FROM (
        SELECT Phone_Number, ID
        FROM Phone_Numbers
        WHERE ID = 1 #insert ID here
        ) phone
    JOIN (
        SELECT Name, Creator_Username, Address_State, Address_City, Address_Zip,
        Address_Street, Address_Number, Website, Non_Citizen, Documentation,
        Eligibility, Description, ID
        FROM Resource
        WHERE ID = 1 #insert ID here
        ) res
    ON phone.ID = res.ID
    ) resInfo
ON resInfo.ID = category.ID;

/*
3. based on filtering selections, produce resources 
ex: housing, gender = female
 
implementation:
1) filter out within the housing table to find female
2) join filtered housing with resource to get name/ description (name filter)
3) join newly created 'filter' with review to get avg score
 */

SELECT rev.avg_rating, filter.name, filter.description
FROM (
        SELECT res.Name AS name, res.Description AS description, category.ID AS ID
        FROM (
            SELECT Name, Description, ID
            FROM Resource
            WHERE Non_Citizen = 0 #alter this to specify
            ) res
        JOIN (
                SELECT house.ID AS ID
                FROM (
                    SELECT ID
                    FROM Housing
                    WHERE Gender = 'Female' # alter this to specity (AND blah for more filtering)

                    ) house
                LEFT JOIN (
                    SELECT serve.ID AS ID #might need to fix
                    FROM (
                            SELECT ID
                            FROM Housing_Type_Multi
                            WHERE Type_Multi = 'Shelter' #alter here to specify
                        ) type
                    JOIN (
                        SELECT ID
                        FROM Housing_Serve_Multi
                        WHERE Type_Multi = 'Homeless' #alter here to specity
                        ) serve
                    ON type.ID = serve.ID
                    ) subCat
                ON house.ID = subCat.ID
            ) category
        ON res.ID = category.ID
    ) filter
LEFT JOIN (
        SELECT ID, AVG(Rating) AS avg_rating
        FROM Reviews
        GROUP BY ID
    ) rev
ON filter.ID = rev.ID
ORDER BY rev.avg_rating;






