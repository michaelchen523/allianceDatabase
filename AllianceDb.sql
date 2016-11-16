/*
  Delete and recreate the database, set the current database to AllianceDb
*/

DROP DATABASE IF EXISTS AllianceDb;
CREATE DATABASE AllianceDb;
USE AllianceDb;

SELECT 'BEGINNING OF SCRIPT'; # Select statements are placed throughout the script and act as a sort of print statement



DROP TABLE IF EXISTS User;

CREATE TABLE User (
 Username VARCHAR(20)  NOT NULL,
 Email VARCHAR(30) NOT NULL,
 Password VARCHAR(25) NOT NULL,
 OrgName VARCHAR(20) NOT NULL,
 PRIMARY KEY (Username)
);

INSERT INTO User VALUES ('SonikaF','sfinch@hotmail.com', 'i<3Dogs', 'Beloved');


DROP TABLE IF EXISTS Resource;

CREATE TABLE Resource (
  Name VARCHAR(70) NOT NULL,
  Creator_Username VARCHAR(20) NOT NULL, # changed this from 'Username' to reduce possible confusion
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(60) NOT NULL,
  Address_Number VARCHAR(10)

   NOT NULL,
  Website VARCHAR(50),
  Non_Citizen TINYINT(1),
  Documentation TINYINT(1),
  Eligibility VARCHAR(600), # after looking at the initial resources to add, it looks like we should have an eligibility attribute
  Description VARCHAR(600),
  ID MEDIUMINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID),
 FOREIGN KEY (Creator_Username) REFERENCES User (Username),
 CONSTRAINT Duplicate_Resource
 UNIQUE (Name, Address_State, Address_City, Address_Zip, Address_Street, Address_Number)
);


DROP TABLE IF EXISTS Category_Names;

CREATE TABLE Category_Names (
  Name VARCHAR(20),
  Description VARCHAR(500),
  PRIMARY KEY (Name)
);


DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
  Name VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Name),
  FOREIGN KEY (Name) REFERENCES Category_Names(Name),
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS User_Favorites;

CREATE TABLE User_Favorites (
  Username VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Username, ID),
  FOREIGN KEY (Username) REFERENCES User (Username) ON DELETE CASCADE,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Phone_Numbers; # changed this because 'Number' seems to be a restricted word

CREATE TABLE Phone_Numbers (
  Phone_Number VARCHAR(25) NOT NULL, # why is this a varchar and not an int? changed from 'PhoneNumber' for format consistency
  Type VARCHAR(30),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Phone_Number, ID), # changed the second attribute from 'Name' to 'ID'
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);


/*
Supplies
 */

SELECT 'Supplies';

DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies (
  CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Supp_Type;

CREATE TABLE Supp_Type (
  Supp_Type ENUM('Clothing', 'Children''s Things', 'Hygienic Supplies', 'Laundry',
 'Food', 'Medical', 'Food Stamps', 'Financial Aid ', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Supplies (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Supp_Type)
);


/*
Housing
 */

SELECT 'Housing';

DROP TABLE IF EXISTS Housing;

CREATE TABLE Housing (
  Capacity INT,
  Gender ENUM('Male', 'Female', 'All', 'Other'),
  AgeMax INT,
  AgeMin INT,
  Children TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Housing_Type;

CREATE TABLE Housing_Type (
  Housing_Type ENUM('Group', 'Rent', 'Buy', 'Shelter', 'Transitional', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Housing (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Housing_Type)
);

DROP TABLE IF EXISTS Housing_Serve;

CREATE TABLE Housing_Serve (
  Housing_Serve ENUM('Exploited', 'Addiction', 'Battered', 'Homeless',
  'Temporary/ Emergency', 'Religious', 'Families', 'Children', 'Other')
  ,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Housing (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Housing_Serve)
);

/*
Medical
 */

SELECT 'Medical';

DROP TABLE IF EXISTS Medical;

CREATE TABLE Medical (
  Insurance VARCHAR(500),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Med_Type;

CREATE TABLE Med_Type (
  Med_Type ENUM('Dental', 'Medical', 'Gynecologist', 'Abortion Clinic', 'STI/ HIV', 'Pediatrician',
  'Pharmacy', 'Check-Up', 'Immunization', 'Residential', 'Addiction', 'Vision', 'General', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Medical (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Med_Type)
);


/*
Mental Health
 */

SELECT 'Mental Health';


DROP TABLE IF EXISTS Mental_Health;

CREATE TABLE Mental_Health (
  Insurance VARCHAR(500),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS Mental_Type;

CREATE TABLE Mental_Type (
  Mental_Type ENUM('Counseling', 'Case Management', 'Substance Abuse', 'Psych Evals',
 'Counseling Hotline', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Mental_Health (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Mental_Type)
);


/*
Legal
 */

SELECT 'Legal';

DROP TABLE IF EXISTS Legal;

CREATE TABLE Legal (
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Leg_Type;

CREATE TABLE Leg_Type (
  Leg_Type ENUM('Custody', 'Divorce', 'Contract', 'Police', 'Advocacy', 'Case Management', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Legal (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Leg_Type)
);


/*
Employment
 */

SELECT 'Employment';


DROP TABLE IF EXISTS Employment;

CREATE TABLE Employment (
  SalaryMax INT,
  SalaryMin INT,
  Childcare TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Emp_Type;

CREATE TABLE Emp_Type (
  Emp_Type ENUM('Food', 'Retail', 'Office', 'Factory', 'Service', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Employment (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Emp_Type)
);

DROP TABLE IF EXISTS Skills;

CREATE TABLE Emp_Skills (
  Emp_Skills ENUM('Typing', 'People Skills', 'Reading', 'Writing', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Employment (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Emp_Skills)
);

/*
Transportation
 */
SELECT 'Transportation';

DROP TABLE IF EXISTS Transportation;

CREATE TABLE Transportation (
  CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Trans;

CREATE TABLE Trans (
  Trans ENUM('Taxi', 'Subway', 'Bus', 'Plane', 'Train', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Transportation (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Trans)
);


/*
Professional Mentors
 */
SELECT 'Mentors';

DROP TABLE IF EXISTS Mentors;

CREATE TABLE Mentors (
  CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Mentor;

CREATE TABLE Mentor_Type (
  Mentor ENUM('Life Coach', 'Professional', 'Personal', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Mentors (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Mentor)
);


/*
For_Children
 */

SELECT 'For_Children';

DROP TABLE IF EXISTS For_Children;

CREATE TABLE For_Children (
  AgeMax INT,
  AgeMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS For_Child;

CREATE TABLE For_Child (
  For_Child ENUM('Sexual Abuse', 'Physical Abuse', 'Therapy', 'Forensic Evaluations', 'Interviewing', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES For_Children (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, For_Child)
);


/*
Childcare
 */

SELECT 'Childcare';

DROP TABLE IF EXISTS Childcare;

CREATE TABLE Childcare (
  AgeMax INT,
  AgeMin INT,
  CostMax INT,
  CostMin INT,
  Capacity INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Child_Type;

CREATE TABLE Child_Type (
  Child_Type ENUM('Mentoring', 'Tutoring', 'Day Care', 'Information', 'Other'),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Childcare (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID, Child_Type)
);

/*
Vehicle
 */

SELECT 'Vehicle';

DROP TABLE IF EXISTS Vehicle;

CREATE TABLE Vehicle (
  CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Vehicle_Type;

CREATE TABLE Vehicle_Type (
  Vehicle_Type ENUM('Donations', 'Rent', 'Buy', 'Classes', 'Insurance', 'Register', 'Other'),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Vehicle_Type),
  FOREIGN KEY (ID) REFERENCES Vehicle(ID) ON DELETE CASCADE
);


/*
Life Skills
 */

SELECT 'Life Skills';

DROP TABLE IF EXISTS Life_Skills;

CREATE TABLE Life_Skills (
  CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Life_Skill_Type;

CREATE TABLE Life_Skill_Type (
  Life_Skill_Type ENUM('Financial', 'Resume', 'Education', 'Health', 'Parenting', 'Cooking', 'Faith', 'Home Ownership', 'General', 'Other'),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Life_Skill_Type),
  FOREIGN KEY (ID) REFERENCES Life_Skills(ID) ON DELETE CASCADE
);


/*
Education
 */

SELECT 'Education';

DROP TABLE IF EXISTS Education;

CREATE TABLE Education (
  CostMax INT,
  CostMin INT,
  Prerequisites VARCHAR(400),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Education_Type;

CREATE TABLE Education_Type (
  Education_Type ENUM('GED', 'Scholarships', 'College', 'Certifications', 'Workshops', 'Computer Skills', 'Other'),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Education_Type),
  FOREIGN KEY (ID) REFERENCES Education(ID) ON DELETE CASCADE
);


/*
Networks
 */

SELECT 'Networks';

DROP TABLE IF EXISTS Networks;

CREATE TABLE Networks ( 
  Gender ENUM('Male', 'Female', 'All', 'Other'),
  AgeMax INT,
  AgeMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE,
  PRIMARY KEY (ID)
  );

DROP TABLE IF EXISTS Net_Mem;

CREATE TABLE Net_Mem (
  Net_Mem ENUM('Survivors', 'Parents of Survivors', 'Family of Survivors', 'Volunteers', 'Other'),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Net_Mem),
  FOREIGN KEY (ID) REFERENCES Networks(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Net_Sub;
CREATE TABLE Net_Sub (
	Net_Sub ENUM('Partner', 'Sex Trafficking', 'Prostitution'),
  ID MEDIUMINT NOT NULL,
	PRIMARY KEY (ID, Net_Sub),
  FOREIGN KEY (ID) REFERENCES Networks(ID) ON DELETE CASCADE
);

/*
Job Readiness
*/

SELECT 'Job_Readiness';

DROP TABLE IF EXISTS Job_Readiness;

CREATE TABLE Job_Readiness (
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Job_Readiness_Type;

CREATE TABLE Job_Readiness_Type (
  Job_Readiness_Type ENUM('Training', 'Counseling'),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Job_Readiness_Type),
  FOREIGN KEY (ID) REFERENCES Job_Readiness(ID) ON DELETE CASCADE
);

/*
Reviews
 */

SELECT 'Reviews';

DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews (
  Username VARCHAR(20) NOT NULL,
  Rating INT NOT NULL,
  Testimonial VARCHAR(600),
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (ID, Username),
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Username) REFERENCES User (Username)
);
