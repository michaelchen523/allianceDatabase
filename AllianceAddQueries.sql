DELETE FROM Supp_Type;
DELETE FROM Supplies;

DELETE FROM For_Child;
DELETE FROM For_Children;

DELETE FROM Net_Sub;
DELETE FROM Net_Mem;
DELETE FROM Networks;

DELETE FROM Mentor_Type;
DELETE FROM Mentors;

DELETE FROM Transportation;

DELETE FROM Med_Type;
DELETE FROM Medical;

DELETE FROM Supplies;
DELETE FROM Supp_Type;

DELETE FROM Leg_Type;
DELETE FROM Legal;

DELETE FROM Mental_Type;
DELETE FROM Mental_Health;

DELETE FROM Emp_Skills;
DELETE FROM Emp_Type;
DELETE FROM Employment;

DELETE FROM Job_Readiness_Type;
DELETE FROM Job_Readiness;

DELETE FROM Education_Type;
DELETE FROM Education;

DELETE FROM Life_Skill_Type;
DELETE FROM Life_Skills;

DELETE FROM Child_Type;
DELETE FROM Childcare;

DELETE FROM Housing_Serve;
DELETE FROM Housing_Type;
DELETE FROM Housing;

DELETE FROM Vehicle_Type;
DELETE FROM Vehicle;

DELETE FROM Phone_Numbers;
DELETE FROM Resource;

/*
Add resource
 */

#Resource
INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, 
	Website, Non_Citizen, Documentation, Eligibility, Description)
VALUES ('FooBar', 'SonikaF', 'GA', 'Atlanta', 12345, 'Peachtree Rd', '3', 'google.com', 1, 0, 'you probs aren''t eligible',  null); #edit values, for non completed fields, put null

INSERT INTO Phone_Numbers
VALUES (123456, 'Cell', 1); #to edit -> (phone num, Type, ID)

INSERT INTO Categories
VALUES ('Housing', 1); #to edit -> (category name, iD)


#Supplies
INSERT INTO Supplies
VALUES (50, 0, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Supp_Type
VALUES ('Clothing', 1); #to edit -> (Type, ID)


#Housing
INSERT INTO Housing
VALUES (3, 'Female', 18, 0, 1, 1); #to edit -> (Capacity, Gender, AgeMax, AgeMin, Children, ID)

INSERT INTO Housing_Type
VALUES ('Group', 1); #to edit -> (type, ID)

INSERT INTO Housing_Serve
VALUES ('Exploited', 1); #to edit -> (type, ID)


#Medical
INSERT INTO Medical
VALUES (null, 1); #to edit -> (insurance info, ID)

INSERT INTO Med_Type
VALUES ('Dental', 1); #to edit -> (type, ID)


#Mental Health
INSERT INTO Mental_Health
VALUES (null, 1); #to edit -> (insurance info, ID)

INSERT INTO Mental_Type
VALUES ('Counseling', 1); #to edit -> (type, ID)


#Legal
INSERT INTO Legal
VALUES (1); #to edit -> (ID)

INSERT INTO Leg_Type
VALUES ('Divorce', 1); #to edit -> (type, ID)


#Employment
INSERT INTO Employment
VALUES (100, 0, 0, 1); #to edit -> (SalaryMax, SalaryMin, Childcare, ID)

INSERT INTO Emp_Type
VALUES ('Retail', 1); #to edit -> (type, ID)

INSERT INTO Emp_Skills
VALUES ('People SKills', 1); #to edit -> (type, ID)


#Transportation
INSERT INTO Transportation
VALUES (10, 10, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Trans
VALUES ('Taxi', 1); #to edit -> (type, ID)


#Mentors
INSERT INTO Mentors
VALUES (0, 0, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Mentor_Type
VALUES ('Professional', 1); #to edit -> (type, ID)


#For_Children
INSERT INTO For_Children
VALUES (18, 0, 1); #to edit -> (AgeMax, AgeMin, ID)

INSERT INTO For_Child
VALUES ('Therapy', 1); #to edit -> (type, ID)


#Childcare
INSERT INTO Childcare
VALUES (18, 0, 	100, 100, 3, 1); #to edit -> (AgeMax, AgeMin, CostMax, CostMin, Capacity, ID)

INSERT INTO Child_Type
VALUES ('Tutoring', 1); #to edit -> (type, ID)


#Vehicle
INSERT INTO Vehicle
VALUES (1000, 500, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Vehicle_Type
VALUES ('Buy', 1); #to edit -> (type, ID)


#Life Skills
INSERT INTO Life_Skills
VALUES (20, 20, 1); #to edit -> (CostMax, CostMin, ID)

INSERT INTO Life_Skill_Type
VALUES ('Resume', 1); #to edit -> (Type, ID)


#Education
INSERT INTO Education
VALUES (1000, 700, null, 1); #to edit -> (CostMax, CostMin, Prerequisites, ID)

INSERT INTO Education_Type
VALUES ('College', 1); #to edit -> (Type, ID)


#Networks
INSERT INTO Networks
VALUES ('All', 18, 10, 1);  #to edit -> (Gender, AgeMax, AgeMin, ID)

INSERT INTO Net_Mem
VALUES ('Survivors', 1); #to edit (Type, ID)

INSERT INTO Net_Sub
VALUES ('Prostitution', 1);


#Job Readiness
INSERT INTO Job_Readiness
VALUES (1); #to edit (ID)

INSERT INTO Job_Readiness_Type
VALUES ('Training', 1); #to edit (Type, ID)


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
Insert into Reviews
 */
INSERT INTO Reviews
VALUES ('SonikaF', 5, null, 1); #to edit (Username of rater, rating, testimonial, ID)








