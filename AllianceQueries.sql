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
        FROM Resource AS res
        JOIN (
                SELECT house.ID AS ID
                FROM (
                    SELECT ID
                    FROM Housing
                    WHERE Gender = 'Female' # AND blah blah for more filtering

                    ) house
                LEFT JOIN (
                    SELECT subCat.ID AS ID #might need to fix
                    FROM (
                            SELECT ID
                            FROM Housing_Type_Multi
                            WHERE Type = 'Shelter' #alter here to specify
                        ) type
                    OUTER JOIN (
                        SELECT ID
                        FROM Housing_Serve_Multi
                        WHERE Type = 'Homeless' #alter here to specity
                        ) serve
                    ) subCat
                    ON type.ID = serve.ID
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






