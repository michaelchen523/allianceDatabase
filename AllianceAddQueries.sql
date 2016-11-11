/*
Add to favorites
 */
INSERT INTO User_Favorites
VALUES ('SonikaF', 1); #exchange (Username, ID)

/*
Delete from favorites
 */
DELETE FROM User_Favorites
WHERE Username = 'SonikaF' AND ID = 1; #exchange username and ID



/*
Add resource
 */

#Resource
INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, 
	Website, Non_Citizen, Documentation, Eligibility, Description)
VALUES ('FooBar', 'SonikaF', 'GA', 'Atlanta', 12345, 'Peachtree Rd', '3', 'google.com', 1, 0, 'you probs aren''t eligible',  null); #edit values, for non completed fields, put null

INSERT INTO Phone_Numbers
VALUES (123456, 1); #to edit -> (phone num, ID)

INSERT INTO Categories
VALUES ('Housing', 1); #to edit -> (category name, iD)


#Supplies
INSERT INTO Supplies
VALUES (50, 0, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Supp_Type_Multi
VALUES ('Clothing', 1); #to edit -> (Type, ID)


#Housing
INSERT INTO Housing
VALUES (3, 'Female', 18, 0, 1, 1); #to edit -> (Capacity, Gender, AgeMax, AgeMin, Children, ID)

INSERT INTO Housing_Type_Multi
VALUES ('Group', 1); #to edit -> (type, ID)

INSERT INTO Housing_Serve_Multi
VALUES ('Exploited', 1); #to edit -> (type, ID)


#Medical
INSERT INTO Medical
VALUES (null, 1); #to edit -> (insurance info, ID)

INSERT INTO Medical_Type_multi
VALUES ('Dental', 1); #to edit -> (type, ID)


#Mental Health
INSERT INTO Mental_Health
VALUES (null, 1); #to edit -> (insurance info, ID)

INSERT INTO Mental_Type_Multi
VALUES ('Counseling', 1); #to edit -> (type, ID)


#Legal
INSERT INTO Legal
VALUES (1); #to edit -> (ID)

INSERT INTO Legal_Type_Multi
VALUES ('Divorce', 1); #to edit -> (type, ID)











