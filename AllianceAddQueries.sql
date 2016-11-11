/*
Add to favorites
 */
INSERT INTO User_Favorites
VALUES ('SonikaF', 1) #exchange (Username, ID)

/*
Add resource
 */

INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, 
	Website, Non_Citizen, Documentation, Eligibility, Description)
VALUES ('FooBar', 'SonikaF', 'GA', 'Atlanta', 12345, 'Peachtree Rd', '3', 'google.com', 1, 0, 'you probs aren''t eligible',  null); #edit values, for non completed fields, put null

INSERT INTO Phone_Numbers
VALUES (123456, 1); #to edit -> (phone num, ID)

INSERT INTO Categories
VALUES (1, 'Housing'); #to edit -> (ID, category name)

INSERT INTO Housing
VALUES (3, 'Female', null, 18, 0); #to edit -> (Capacity, Gender, AgeMax, AgeMin, Children)