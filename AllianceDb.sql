/*
  Delete and recreate the database, set the current database to AllianceDb
*/

DROP DATABASE IF EXISTS AllianceDb;
CREATE DATABASE AllianceDb;
USE AllianceDb;

SELECT 'BEGINNING OF SCRIPT'; # Select statements are placed throughout the script and act as a sort of print statement

DROP TABLE IF EXISTS Organization;

CREATE TABLE Organization
 (Name VARCHAR(20),
  PRIMARY KEY (Name)
  );

INSERT INTO Organization VALUES ('Beloved');


DROP TABLE IF EXISTS User;

CREATE TABLE User(
 Username VARCHAR(20)  NOT NULL,
 Email VARCHAR(30) NOT NULL,
 Password VARCHAR(25) NOT NULL,
 Name VARCHAR(20) NOT NULL,
 Organization VARCHAR(20) NOT NULL,
 PRIMARY KEY (Username),
 FOREIGN KEY (Organization) REFERENCES Organization (Name)
 );

INSERT INTO User VALUES ('SonikaF','sfinch@hotmail.com', 'i<3Dogs', 'Sonika', 'Beloved');


DROP TABLE IF EXISTS Resource;

CREATE TABLE Resource
 (Name VARCHAR(20) NOT NULL,
  Creator_Username VARCHAR(20) NOT NULL, # changed this from 'Username' to reduce possible confusion
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  Non_Citizen TINYINT(1),
  Eligibility VARCHAR(600), # after looking at the initial resources to add, it looks like we should have an eligibility attribute
  Description VARCHAR(600),
  ID MEDIUMINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID),
 FOREIGN KEY (Creator_Username) REFERENCES User (Username),
 CONSTRAINT Duplicate_Resource 
 UNIQUE (Name, Address_State, Address_City, Address_Zip, Address_Street, Address_Number)
 );
/*
INSERT INTO Resource VALUES ('Beloved', 'SonikaF', 'GA', 'Atlanta', 30308, 'Spring St.', 9, 1, 'women', 'shelter', 1);
INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, Eligibility, Description, ID MEDIUMINT) VALUES 
('Atlanta Dream Center, Inc.', 'SonikaF', 'GA', 'Atlanta', 30308, 'Angier Ave, NE', 635, 'live in the areas they serve', 'Provides after school 
  program including tutoring and one-on-one mentoring',2), ('Families First, Inc.: Resource Moms', 'SonikaF', 'GA', 'Atlanta', 'W. Peachtree St, NE',
  1105, 'In all of Georgia', 'Provides resources and information to new mothers with a low-birth weight baby', 3), ('Wellspring Living:
  Empowering Living Academy', 'SonikaF', 'GA', 'Atlanta', 30342, 'Johnson Ferry Rd Suite 140-331', 860, 'Women 18-31 years old, no
  violent criminal charges, medically stable, no substance abuse, access to transportation, willingness to live a drug and alcohol 
  free lifestyle, no history of sexual offending behavior, committed to empowered living curriculum and schedule', '9 week program (9am-3:40pm,
  5 days a week) that provides GED preparation, life skills classes, health and fitness classes, career readiness training, opportunities for
  jobs, and individual and group therapy', 4), ('Fulton Atlanta Community Action Authority: Academy 4 Life', 'SonikaF', 'GA', 'Atlanta', 30324
  'Chantilly Dr, NE', 1690, 'Must register or complete an online application', 'Provides support with life and career skills, provide educational, 
  social, and economic opportunities, topics include: money management, computer skills, entreprenurial help, GED preparation, life enhancement, construction 
  skills training, and job preparedness', 5), ('Salvation Army Kroc Center: Family Literacy Program', 'SonikaF','GA', 'Atlanta', 30310, 'Dewey St, SW', 967,
  'Complete application and admissions testing', 'Provides GED preparation Monday to Friday from 5-8pm and provides dinner and childcare', 6),
   ('Out of Darkness/Soloman"s House', 'SonikaF', 'GA', 'Atlanta', 00000, 'NA', 00, 'At least 18 years old and has been commercially sexually exploited and want 
    to join a 12-15 month program', 'Helps those who are survivors of sex trafficking by rescuing women, placing them in a safe house and given medical care, mentoring
    and placing her into a 12 month restoration program', 10), ('Wellspring Living: Assessment Center', 'SonikaF', 'GA', 'Atlanta', 30342, 'Johnson Ferry Rd Suite 140-331',
    860, 'Women 18-30 years old', 'Provides short-term residential care for survivors of sexual exploitation and sexual abuse and education about options', 11), ('Wellspring Living:
    Wellspring Living for Girls', 'SonikaF', 'GA', 'Atlanta', 30342, 'Johnson Ferry Rd Suite 140-331', 860, 'Girls 12-17 years old', 'Provides housing and support for survivors of 
    Domestic Minor Sex Trafficking with a focus on trauma therapy, education, life skills, and confidence', 12), ('Atlanta Mission: My Sister"s House', 'SonikaF', 'GA',
    'Atlanta', 303118, 'Howell Mill Rd', 921, 'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxified
    and have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 'Provides overnight shelter for women
    and child including food, counselors, referrals to job training programs, assistance in obtaining housing, medical and legal resources, and a childcare facilitiy with a behavioral 
    specialist and social workers', 13), ('Partnership Against Domestic Violence/PADV', 'SonikaF', 'GA', 'Atlanta', 30317, 'PO Box', 170225, 'Must coplete phone call process, no age limit,
    female only, but children are welcome', 'Provides 24-hour crisis line, emergency safe housing, parenting services, supportive housing program, legal advocacy, community support groups 
    for women, and public benefits assistance', 14), 

INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, Description, ID MEDIUMINT) VALUES
('Atlanta Mission: Atlanta Day Shelter for Women and Children', 'SonikaF', 'GA', 'Atlanta', 30318, 'Ethel St', 655, 'Provides job readiness programs, education 
  stipends, medical care, computer training, early education and teen programs, critical needs services, and mental health counseling', 7), ('Urban League of Greater Altanta:
  Education and Job Skills Training', 'GA', 'Atlanta', 30303, 'Peachtree St, NW #300', 229, 'GED Prep/Academic Upgrade: self-paced instruction in reading, math, science, and social 
  studies; Microsoft Office Certification: a 16 week course designed to provide basic computer skills and certify participants as Microsoft Office Specialists; Connect to Work: 
  an 8-weeek course covering call-center and customer service training; Banking and Financial Services Training Program: a 12-week introductory course to banking and financial services; 
  Financial Literacy and Wealth Creation Workshops; Homeownership Counseling and Education Programs', 8), ('4Sarah', 'SonikaF', 'GA', 'Conyers', 30012, 'PO Box', 82685, 'Provides short term 
  housing for women who have been commercially sexually exploited; Provides church placement, prayer, aftercare, residential program assistance, scholarships to assist with continuing 
  education, STI/HIV resources, suicide intervention, addiction and domestic violence resources', 9), (' )

INSERT INTO Resource (Name, ('Atlanta-Fulton Public Library System', 'SonikaF', 'GA', 'Atlanta', 30303, 
  'Margaret Mitchell Square, NW', 1, 'Valid state ID' )

INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number) 
VALUES ('madeup', 'SonikaF', 'NA', 'NA', 0, 'NA', 0 );
*/
DROP TABLE IF EXISTS Category_Names;

CREATE TABLE Category_Names
( Name VARCHAR(20),
  Description VARCHAR(500),
  PRIMARY KEY (Name));
/*
INSERT INTO Category_Names VALUES ('Housing'), ('Documentation'), ('Medical'),
 ('Mental Health'), ('Legal'), ('Resume Building'), ('Employment'), ('Transportation'),
  ('Professional Mentors'), ('Childcare'), ('Vehicle'), ('Life Skills'), ('Education'), ('Networks');
*/

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


DROP TABLE IF EXISTS Org_Favorites;

CREATE TABLE Org_Favorites
 (Organization VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Organization, ID),
  FOREIGN KEY (Organization) REFERENCES Organization (Name),
  FOREIGN KEY (ID) REFERENCES Resource(ID));


DROP TABLE IF EXISTS Phone_Numbers; # changed this because 'Number' seems to be a restricted word

CREATE TABLE Phone_Numbers
  (Phone_Number VARCHAR(15) NOT NULL, # why is this a varchar and not an int? changed from 'PhoneNumber' for format consistency
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Supp_Type (Type),
  FOREIGN KEY (ID) REFERENCES Supplies (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Housing_Type (Type),
  FOREIGN KEY (ID) REFERENCES Housing (ID),
  PRIMARY KEY (ID, Type)
  );

DROP TABLE IF EXISTS Housing_Serve_Multi;

CREATE TABLE Housing_Serve_Multi
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Serve_Type (Type),
  FOREIGN KEY (ID) REFERENCES Housing (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Med_Type (Type),
  FOREIGN KEY (ID) REFERENCES Medical (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Mental_Type (Type),
  FOREIGN KEY (ID) REFERENCES Mental_Health (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Leg_Type (Type),
  FOREIGN KEY (ID) REFERENCES Legal (ID),
  PRIMARY KEY (ID, Type)
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

CREATE TABLE Skills
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Skills VALUES ('Typing'), ('People Skills'), ('Reading'), ('Writing'), ('Other');


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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Emp_Type (Type),
  FOREIGN KEY (ID) REFERENCES Employment (ID),
  PRIMARY KEY (ID, Type)
  );

DROP TABLE IF EXISTS Skils_Multi;

CREATE TABLE Skils_Multi
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Skills (Type),
  FOREIGN KEY (ID) REFERENCES Employment (ID),
  PRIMARY KEY (ID, Type)
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
( Cost INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Trans_Multi;

CREATE TABLE Trans_Multi
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Trans_Type (Type),
  FOREIGN KEY (ID) REFERENCES Transportation (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Mentor_Type (Type),
  FOREIGN KEY (ID) REFERENCES Mentors (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES For_Child_Type (Type),
  FOREIGN KEY (ID) REFERENCES For_Children (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Childcare_Type (Type),
  FOREIGN KEY (ID) REFERENCES Childcare (ID),
  PRIMARY KEY (ID, Type)
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
( Type VARCHAR(20),
  Cost INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Vehicle_Type_Multi;
CREATE TABLE Vehicle_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Type VARCHAR(20),
  PRIMARY KEY (ID, Type),
  FOREIGN KEY (ID) REFERENCES Vehicle(ID),
  FOREIGN KEY (Type) REFERENCES Vehicle_Type(Type)
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
( Type VARCHAR(20),
  Cost INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
);

DROP TABLE IF EXISTS Life_Skill_Type_Multi;
CREATE TABLE Life_Skill_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Type VARCHAR(20),
  PRIMARY KEY (ID, Type),
  FOREIGN KEY (ID) REFERENCES Life_Skills(ID),
  FOREIGN KEY (Type) REFERENCES Skill_Type(Type)
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
( Cost INT,
  Type VARCHAR(20),
  Prerequisites VARCHAR(400),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );

DROP TABLE IF EXISTS Education_Type_Multi;
CREATE TABLE Education_Type_Multi
(
  ID MEDIUMINT NOT NULL,
  Type VARCHAR(20),
  PRIMARY KEY (ID, Type),
  FOREIGN KEY (ID) REFERENCES Education(ID),
  FOREIGN KEY (Type) REFERENCES Education_Type(Type)
);

SELECT 'Networks';

/*
Networks
 */
DROP TABLE IF EXISTS Net_Mem;

CREATE TABLE Net_Mem
( Type VARCHAR(20),
  PRIMARY KEY (Type));

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
( Gender TINYINT(1),
  Age INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  );

DROP TABLE IF EXISTS Net_Mem_Multi;
CREATE TABLE Net_Mem_Multi
(
  Network MEDIUMINT NOT NULL,
  Member_Type VARCHAR(20),
  PRIMARY KEY (Network, Member_Type),
  FOREIGN KEY (Network) REFERENCES Networks(ID),
  FOREIGN KEY (Member_Type) REFERENCES Net_Mem(Type)
);


/*
Job Readiness
*/

SELECT 'Job_Readiness';

DROP TABLE IF EXISTS Job_Readiness;
CREATE TABLE Job_Readiness
( ID MEDIUMINT NOT NULL,
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
  Type VARCHAR(20),
  PRIMARY KEY (ID, Type),
  FOREIGN KEY (ID) REFERENCES Job_Readiness(ID),
  FOREIGN KEY (Type) REFERENCES Job_Readiness_Type(Type)
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


