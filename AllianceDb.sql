/*
  Delete and recreate the database, set the current database to AllianceDb
*/

DROP DATABASE IF EXISTS AllianceDb;
CREATE DATABASE AllianceDb;
USE AllianceDb;

SELECT 'BEGINNING OF SCRIPT'; # Select statements are placed throughout the script and act as a sort of print statement



DROP TABLE IF EXISTS User;

CREATE TABLE User(
 Username VARCHAR(20)  NOT NULL,
 Email VARCHAR(30) NOT NULL,
 Password VARCHAR(25) NOT NULL,
 OrgName VARCHAR(20) NOT NULL,
 PRIMARY KEY (Username)
 );

INSERT INTO User VALUES ('SonikaF','sfinch@hotmail.com', 'i<3Dogs', 'Beloved');


DROP TABLE IF EXISTS Resource;

CREATE TABLE Resource
 (Name VARCHAR(60) NOT NULL,
  Creator_Username VARCHAR(20) NOT NULL, # changed this from 'Username' to reduce possible confusion
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(30) NOT NULL,
  Address_Number VARCHAR(10),
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

CREATE TABLE Category_Names
( Name VARCHAR(20),
  Description VARCHAR(500),
  PRIMARY KEY (Name));

INSERT INTO Category_Names VALUES ('Housing');


DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories
( ID MEDIUMINT NOT NULL,
  Name VARCHAR(20),
  PRIMARY KEY (ID, Name),
  FOREIGN KEY (Name) REFERENCES Category_Names(Name),
  FOREIGN KEY (ID) REFERENCES Resource (ID));


DROP TABLE IF EXISTS User_Favorites;

CREATE TABLE User_Favorites (
  Username VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Username, ID),
  FOREIGN KEY (Username) REFERENCES User (Username),
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );


DROP TABLE IF EXISTS Phone_Numbers; # changed this because 'Number' seems to be a restricted word

CREATE TABLE Phone_Numbers
  (Phone_Number VARCHAR(25) NOT NULL, # why is this a varchar and not an int? changed from 'PhoneNumber' for format consistency
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Phone_Number, ID), # changed the second attribute from 'Name' to 'ID'
  FOREIGN KEY (ID) REFERENCES Resource (ID)
 );
#INSERT INTO Phone_Numbers VALUES ('404-817-3502', 2);

/*
Supplies
 */
SELECT 'Supplies';

DROP TABLE IF EXISTS Supp_Type;

CREATE TABLE Supp_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Supp_Type VALUES ('Clothing'), ('Children''s Things'),
('Hygienic Supplies'), ('Laundry'), ('Food'), ('Medical'),
('Food Stamps'), ('Financial Aid '), ('Other');


DROP TABLE IF EXISTS Supplies;

CREATE TABLE Supplies
  ( CostMax INT,
    CostMin INT,
    ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );


DROP TABLE IF EXISTS Supp_Type_Multi;

CREATE TABLE Supp_Type_Multi
( Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type_Multi) REFERENCES Supp_Type (Type),
  FOREIGN KEY (ID) REFERENCES Supplies (ID),
  PRIMARY KEY (ID, Type_Multi)
  );


/*
Housing
 */
SELECT 'Housing';

# for gender, do we want it to be a multivaried attribute with its own table or is it more like an enum?

DROP TABLE IF EXISTS Gender;

CREATE TABLE Gender
  (Gender VARCHAR(20),
    PRIMARY KEY (Gender)
    );

INSERT INTO Gender VALUES ('Male'), ('Female'), ('All'), ('Other');

DROP TABLE IF EXISTS Housing_Type;

CREATE TABLE Housing_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Housing_Type VALUES ('Group'), ('Rent'), ('Buy'), ('Shelter'), ('Other');

DROP TABLE IF EXISTS Serve_Type;

CREATE TABLE Serve_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Serve_Type VALUES ('Exploited'), ('Addiction'), ('Battered'),
 ('Homeless'), ('Temporary/ Emergency'), ('Religious'), ('Families'), ('Children'), ('Other');


DROP TABLE IF EXISTS Housing;

CREATE TABLE Housing
  (ID MEDIUMINT NOT NULL,
  Capacity INT,
  Gender VARCHAR(20),
  AgeMax INT,
  AgeMin INT,
  Children TINYINT(1),
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Gender) REFERENCES Gender (Gender)
  );

#INSERT INTO Housing VALUES (1, 5, 'Female', 18, 30, 'Shelter', 0);

DROP TABLE IF EXISTS Housing_Multi;

CREATE TABLE Housing_Type_Multi
( Housing_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Housing_Type_Multi) REFERENCES Housing_Type (Type),
  FOREIGN KEY (ID) REFERENCES Housing (ID),
  PRIMARY KEY (ID, Housing_Type_Multi)
  );

DROP TABLE IF EXISTS Housing_Serve_Multi;

CREATE TABLE Housing_Serve_Multi
( Housing_Serve_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Housing_Serve_Multi) REFERENCES Serve_Type (Type),
  FOREIGN KEY (ID) REFERENCES Housing (ID),
  PRIMARY KEY (ID, Housing_Serve_Multi)
  );

/*
Medical
 */

SELECT 'Medical';

DROP TABLE IF EXISTS Med_Type;

CREATE TABLE Med_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );


INSERT INTO Med_Type VALUES ('Dental'), ('Medical'),
('Gynecologist'), ('Abortion Clinic'), ('STI/ HIV'), ('Pediatrician'),
('Pharmacy'), ('Check-Up'), ('Immunization'), ('Residential'), ('Addiction'), ('Vision'), ('Other');


DROP TABLE IF EXISTS Medical;

CREATE TABLE Medical
  ( Insurance VARCHAR(500),
    ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );

DROP TABLE IF EXISTS Med_Type_Multi;

CREATE TABLE Med_Type_Multi
( Med_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Med_Type_Multi) REFERENCES Med_Type (Type),
  FOREIGN KEY (ID) REFERENCES Medical (ID),
  PRIMARY KEY (ID, Med_Type_Multi)
  );


/*
Mental Health
 */
SELECT 'Mental Health';

DROP TABLE IF EXISTS Mental_Type;

CREATE TABLE Mental_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
  );

INSERT INTO Mental_Type VALUES ('Counseling'), ('Case Management'),
 ('Substance Abuse'), ('Psych Evals'), ('Counseling Hotline'), ('Other');


DROP TABLE IF EXISTS Mental_Health;

CREATE TABLE Mental_Health
( Insurance VARCHAR(500), # could insurance be a mulitvaried attribute that separates various insurance providers?
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);


DROP TABLE IF EXISTS Metal_Type_Multi;

CREATE TABLE Metal_Type_Multi
( Metal_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Metal_Type_Multi) REFERENCES Mental_Type (Type),
  FOREIGN KEY (ID) REFERENCES Mental_Health (ID),
  PRIMARY KEY (ID, Metal_Type_Multi)
  );


/*
Legal
 */

SELECT 'Legal';

DROP TABLE IF EXISTS Leg_Type;

CREATE TABLE Leg_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Leg_Type VALUES ('Custody'), ('Divorce'), ('Contract'),
 ('Police'), ('Advocacy'), ('Case Management'), ('Other');


DROP TABLE IF EXISTS Legal;

CREATE TABLE Legal
( ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Leg_Type_Multi;

CREATE TABLE Leg_Type_Multi
( Leg_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Leg_Type_Multi) REFERENCES Leg_Type (Type),
  FOREIGN KEY (ID) REFERENCES Legal (ID),
  PRIMARY KEY (ID, Leg_Type_Multi)
  );


/*
Employment
 */
SELECT 'Employment';

DROP TABLE IF EXISTS Emp_Type;

CREATE TABLE Emp_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Emp_Type VALUES ('Food'), ('Retail'), ('Office'), ('Factory'), ('Service'), ('Other');


DROP TABLE IF EXISTS Skills;

CREATE TABLE Emp_Skills
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Emp_Skills VALUES ('Typing'), ('People Skills'), ('Reading'), ('Writing'), ('Other');


DROP TABLE IF EXISTS Employment;

CREATE TABLE Employment
( SalaryMax INT,
  SalaryMin INT,
  Childcare TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Emp_Type_Multi;

CREATE TABLE Emp_Type_Multi
( Emp_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Emp_Type_Multi) REFERENCES Emp_Type (Type),
  FOREIGN KEY (ID) REFERENCES Employment (ID),
  PRIMARY KEY (ID, Emp_Type_Multi)
  );

DROP TABLE IF EXISTS Skills_Multi;

CREATE TABLE Emp_Skills_Multi
( Emp_Skills_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Emp_Skills_Multi) REFERENCES Emp_Skills (Type),
  FOREIGN KEY (ID) REFERENCES Employment (ID),
  PRIMARY KEY (ID, Emp_Skills_Multi)
  );

/*
Transportation
 */
SELECT 'Transportation';


DROP TABLE IF EXISTS Trans_Type;

CREATE TABLE Trans_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Trans_Type VALUES ('Taxi'), ('Subway'), ('Bus'), ('Plane'), ('Train'), ('Other');

DROP TABLE IF EXISTS Transportation;

CREATE TABLE Transportation
( CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Trans_Multi;

CREATE TABLE Trans_Multi
( Trans_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Trans_Multi) REFERENCES Trans_Type (Type),
  FOREIGN KEY (ID) REFERENCES Transportation (ID),
  PRIMARY KEY (ID, Trans_Multi)
  );


/*
Professional Mentors
 */
SELECT 'Mentors';

DROP TABLE IF EXISTS Mentor_Type;

CREATE TABLE Mentor_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Mentor_Type VALUES ('Life Coach'), ('Professional'), ('Personal'), ('Other');


DROP TABLE IF EXISTS Mentors;

CREATE TABLE Mentors
( CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Mentor_Multi;

CREATE TABLE Mentor_Multi
( Mentor_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Mentor_Multi) REFERENCES Mentor_Type (Type),
  FOREIGN KEY (ID) REFERENCES Mentors (ID),
  PRIMARY KEY (ID, Mentor_Multi)
  );


/*
For_Children
 */

SELECT 'For_Children';

DROP TABLE IF EXISTS For_Child_Type;

CREATE TABLE For_Child_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO For_Child_Type VALUES ('Sexual Abuse'), ('Physical Abuse'),
 ('Therapy'), ('Forensic Evaluations'), ('Interviewing'), ('Other');


DROP TABLE IF EXISTS For_Children;

CREATE TABLE For_Children
( AgeMax INT,
  AgeMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS For_Child_Multi;

CREATE TABLE For_Child_Multi
( For_Child_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (For_Child_Multi) REFERENCES For_Child_Type (Type),
  FOREIGN KEY (ID) REFERENCES For_Children (ID),
  PRIMARY KEY (ID, For_Child_Multi)
  );


/*
Childcare
 */

SELECT 'Childcare';

DROP TABLE IF EXISTS Childcare_Type;

CREATE TABLE Childcare_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Childcare_Type VALUES ('Mentoring'), ('Tutoring'), ('Day Care'), ('Information'), ('Other');

DROP TABLE IF EXISTS Childcare;

CREATE TABLE Childcare
( Age INT,
  Cost INT,
  Capacity INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Child_Type_Multi;

CREATE TABLE Child_Type_Multi
( Child_Type_Multi VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Child_Type_Multi) REFERENCES Childcare_Type (Type),
  FOREIGN KEY (ID) REFERENCES Childcare (ID),
  PRIMARY KEY (ID, Child_Type_Multi)
  );

/*
Vehicle
 */
SELECT 'Vehicle';


DROP TABLE IF EXISTS Vehicle_Type;

CREATE TABLE Vehicle_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Vehicle_Type VALUES ('Donations'), ('Rent'), ('Buy'), ('Classes'), ('Insurance'), ('Register'), ('Other');


DROP TABLE IF EXISTS Vehicle;

CREATE TABLE Vehicle
(CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Vehicle_Type_Multi;
CREATE TABLE Vehicle_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Vehicle_Type_Multi VARCHAR(20),
  PRIMARY KEY (ID, Vehicle_Type_Multi),
  FOREIGN KEY (ID) REFERENCES Vehicle(ID),
  FOREIGN KEY (Vehicle_Type_Multi) REFERENCES Vehicle_Type(Type)
);

SELECT 'Life Skills';

/*
Life Skills
 */

DROP TABLE IF EXISTS Skill_Type;

CREATE TABLE Skill_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Skill_Type VALUES ('Finances'), ('Resume'), ('Education'), ('Health'), ('Parenting'), ('Cooking'), ('Faith'), ('Home Ownership'), ('Other');


DROP TABLE IF EXISTS Life_Skills;

CREATE TABLE Life_Skills
( CostMax INT,
  CostMin INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Life_Skill_Type_Multi;
CREATE TABLE Life_Skill_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Life_Skill_Type_Multi VARCHAR(20),
  PRIMARY KEY (ID, Life_Skill_Type_Multi),
  FOREIGN KEY (ID) REFERENCES Life_Skills(ID),
  FOREIGN KEY (Life_Skill_Type_Multi) REFERENCES Skill_Type(Type)
);

SELECT 'Education';

/*
Education
 */
DROP TABLE IF EXISTS Education_Type;

CREATE TABLE Education_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type));

INSERT INTO Education_Type VALUES ('GED'),
 ('Scholarships'), ('College'), ('Certifications'), ('Workshops'), ('Computer Skills'), ('Other');


DROP TABLE IF EXISTS Education;

CREATE TABLE Education
( CostMax INT,
  CostMin INT,
  Prerequisites VARCHAR(400),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );

DROP TABLE IF EXISTS Education_Type_Multi;
CREATE TABLE Education_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Education_Type_Multi VARCHAR(20),
  PRIMARY KEY (ID, Education_Type_Multi),
  FOREIGN KEY (ID) REFERENCES Education(ID),
  FOREIGN KEY (Education_Type_Multi) REFERENCES Education_Type(Type)
);

SELECT 'Networks';

/*
Networks
 */
DROP TABLE IF EXISTS Net_Mem;

CREATE TABLE Net_Mem
( Members VARCHAR(20),
  PRIMARY KEY (Members));

INSERT INTO Net_Mem VALUES ('Survivors'),
 ('Parents of Survivors'),
  ('Family of Survivors'), ('Volunteers'), ('Other');


DROP TABLE IF EXISTS Net_Sub;

CREATE TABLE Net_Sub
( Subject VARCHAR(20),
  PRIMARY KEY (Subject));

INSERT INTO Net_Sub VALUES ('Partner'),
 ('Sex Trafficking'), ('Prostitution');


DROP TABLE IF EXISTS Networks;

CREATE TABLE Networks
( Gender VARCHAR(20),
  Age INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Gender) REFERENCES Gender (Gender),
  PRIMARY KEY (ID)
  );

DROP TABLE IF EXISTS Net_Mem_Multi;
CREATE TABLE Net_Mem_Multi
(
  ID MEDIUMINT NOT NULL,
  Net_Mem_Multi VARCHAR(20),
  PRIMARY KEY (ID, Net_Mem_Multi),
  FOREIGN KEY (ID) REFERENCES Networks(ID),
  FOREIGN KEY (Net_Mem_Multi) REFERENCES Net_Mem(Members)
);

DROP TABLE IF EXISTS Net_Sub_Multi;
CREATE TABLE Net_Sub_Multi
(
	ID MEDIUMINT NOT NULL,
	Net_Sub_Multi VARCHAR(20),
	PRIMARY KEY (ID, Net_Sub_Multi),
    FOREIGN KEY (ID) REFERENCES Networks(ID),
	FOREIGN kEY (Net_Sub_Multi) REFERENCES Net_Sub(Subject)
);

/*
Job Readiness
*/

SELECT 'Job_Readiness';

DROP TABLE IF EXISTS Job_Readiness;

CREATE TABLE Job_Readiness
(  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );

DROP TABLE IF EXISTS Job_Readiness_Type;
CREATE TABLE Job_Readiness_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type));

INSERT INTO Job_Readiness_Type VALUES ('Training'), ('Counseling');

DROP TABLE IF EXISTS Job_Readiness_Type_Multi;
CREATE TABLE Job_Readiness_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Job_Readiness_Type_Multi VARCHAR(20),
  PRIMARY KEY (ID, Job_Readiness_Type_Multi),
  FOREIGN KEY (ID) REFERENCES Job_Readiness(ID),
  FOREIGN KEY (Job_Readiness_Type_Multi) REFERENCES Job_Readiness_Type(Type)
);

/*
Reviews
 */

SELECT 'Reviews';

DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews
  (ID MEDIUMINT NOT NULL,
   Username VARCHAR(20) NOT NULL,
   Rating INT NOT NULL,
   Testimonial VARCHAR(600),
   PRIMARY KEY (ID, Username),
   FOREIGN KEY (ID) REFERENCES Resource (ID),
   FOREIGN KEY (Username) REFERENCES User (Username)
   );
