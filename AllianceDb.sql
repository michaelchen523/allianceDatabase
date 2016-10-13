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
 Admin VARCHAR(20) NOT NULL,
 PRIMARY KEY (Username),
 FOREIGN KEY (Organization) REFERENCES Organization (Name)
 );

INSERT INTO User VALUES ('SonikaF','sfinch@hotmail.com', 'i<3Dogs', 'Sonika', 'Beloved', '1');


DROP TABLE IF EXISTS Resource;

CREATE TABLE Resource
 (AdminName VARCHAR(20)  NOT NULL,
  Name VARCHAR(20) NOT NULL,
  Username VARCHAR(20) NOT NULL,
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  Description VARCHAR(600),
  ID MEDIUMINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID),
 FOREIGN KEY (Username) REFERENCES User (Username),
 CONSTRAINT Duplicate_Resource UNIQUE (Name, Address_State, Address_City, Address_Zip, Address_Street, Address_Number)
 );


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


DROP TABLE IF EXISTS Number;

CREATE TABLE Number
  (PhoneNumber INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  PRIMARY KEY (PhoneNumber, Name),
  FOREIGN KEY (Name) REFERENCES Resource (Name)
 );



/*
Housing
 */

DROP TABLE IF EXISTS Gender;

CREATE TABLE Gender
  (Gender VARCHAR(20),
    PRIMARY KEY (Gender)
    );

INSERT INTO Gender VALUES ('Male'), ('Female'), ('All'), ('Other');



DROP TABLE IF EXISTS Houseing_Type;

CREATE TABLE Houseing_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Houseing_Type VALUES ('Group'), ('Rent'), ('Buy'), ('Shelter'), ('Other');


DROP TABLE IF EXISTS Housing;

CREATE TABLE Housing
  (ID MEDIUMINT NOT NULL,
  Capacity INT,
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  Gender VARCHAR(20),
  Age INT,
  Houseing_Type VARCHAR(20),
  Children TINYINT(1),
  Non_Cit TINYINT(1),
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Gender) REFERENCES Gender (Gender),
  FOREIGN KEY (Houseing_Type) REFERENCES Houseing_Type (Type)
  );



/*
Documentation
 */
DROP TABLE IF EXISTS Doc_Type;

CREATE TABLE Doc_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Doc_Type VALUES ('ID'), ('SS'), 
('Birth Certificate'), ('Driver''s License'), ('Other');



DROP TABLE IF EXISTS Documentation;

CREATE TABLE Documentation
  (ID MEDIUMINT NOT NULL,
   Type VARCHAR(20) NOT NULL,
    StartTime time,
    EndTime time,
    Non_Cit TINYINT(1),
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Doc_Type (Type)
  ) ;




/*
Medical
 */
DROP TABLE IF EXISTS Med_Type;

CREATE TABLE Med_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    );

INSERT INTO Med_Type VALUES ('Dental'), ('Medical'), 
('Gynecologist'), ('Abortion Clinic'), ('STD'), ('Pediatrician'),
('Pharmacy'), ('Other');



DROP TABLE IF EXISTS Medical;

CREATE TABLE Medical
  ( Type VARCHAR(20),
    Insurance VARCHAR(500),
    Hours time,
    Non_Cit TINYINT(1),
    ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Med_Type (Type)
  ) ;




/*
Mental Health
 */
DROP TABLE IF EXISTS Mental_Type;

CREATE TABLE Mental_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
  );

INSERT INTO Mental_Type VALUES ('Counseling'), ('Psych Evals'), ('Counseling Hotline'), ('Other');



DROP TABLE IF EXISTS Mental_Health;

CREATE TABLE Mental_Health
( Type VARCHAR(20),
  Insurance VARCHAR(500),
  Non_Cit TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Mental_Type (Type)
);




/*
Legal
 */
DROP TABLE IF EXISTS Leg_Type;

CREATE TABLE Leg_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);


INSERT INTO Leg_Type VALUES ('Custody'), ('Divorce'), ('Contract'), ('Police'), ('Other');



DROP TABLE IF EXISTS Legal;

CREATE TABLE Legal
( Type VARCHAR(20),
  Non_Cit TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Leg_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);



/*
Resume Building
*/
DROP TABLE IF EXISTS Res_Type;

CREATE TABLE Res_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);


INSERT INTO Res_Type VALUES ('School'), ('Workshops'), ('GED'), ('Certifications'), ('Resume Building') ('Other');


DROP TABLE IF EXISTS Resume_Building

CREATE TABLE Resume_Building
( Type VARCHAR(20),
  Non_Cit TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Res_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);



/*
Employment
 */

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
( Type VARCHAR(20),
  Salary INT,
  Skills VARCHAR(20),
  Childcare TINYINT(1),
  Non_Cit TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Emp_Type (Type),
  FOREIGN Key (Skills) REFERENCES Skills (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);



/*
Transportation
 */
DROP TABLE IF EXISTS Trans_Type;

CREATE TABLE Trans_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Trans_Type VALUES ('Taxi'), ('Subway'), ('Bus'), ('Plane'), ('Train'), ('Other');



DROP TABLE IF EXISTS Transportation;

CREATE TABLE Transportation
( Type VARCHAR(20),
  Cost INT,
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  ID MEDIUMINT NOT NULL,
  Non_Cit TINYINT(1),
  FOREIGN KEY (Type) REFERENCES Trans_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);



/*
Professional Mentors
 */
DROP TABLE IF EXISTS Mentor_Type;

CREATE TABLE Mentor_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Mentor_Type VALUES ('Life Coach'), ('Professional'), ('Personal'), ('Other');



DROP TABLE IF EXISTS Prof_Mentors;

CREATE TABLE Prof_Mentors
( Type VARCHAR(20),
  Cost INT,
  ID MEDIUMINT NOT NULL,
  Non_Cit TINYINT(1),
  FOREIGN KEY (Type) REFERENCES Mentor_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);



/*
Childcare
 */
DROP TABLE IF EXISTS Childcare;

CREATE TABLE Childcare
( Age INT,
  Cost INT,
  StartTime time,
  EndTime time,
  Capacity INT,
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  ID MEDIUMINT NOT NULL,
  Non_Cit TINYINT(1),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);


/*
Vehicle
 */
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
  Non_Cit TINYINT(1),
  FOREIGN KEY (Type) REFERENCES Vehicle_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);




/*
Life Skills
 */
DROP TABLE IF EXISTS Skill_Type;

CREATE TABLE Skill_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
);

INSERT INTO Skill_Type VALUES ('Finances'), ('Resume'), ('Education'), ('Health'), ('Parenting'), ('Cooking'), ('Faith') ('Other');


DROP TABLE IF EXISTS Life_Skills;

CREATE TABLE Life_Skills
( Type VARCHAR(20),
  Cost INT,
  Address_State VARCHAR(2) NOT NULL,
  Address_City VARCHAR(20) NOT NULL,
  Address_Zip INT NOT NULL,
  Address_Street VARCHAR(20) NOT NULL,
  Address_Number INT NOT NULL,
  ID MEDIUMINT NOT NULL,
  Non_Cit TINYINT(1),
  FOREIGN KEY (Type) REFERENCES Skill_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
);






/*
Reviews
 */

DROP TABLE IF EXISTS Reviews;

CREATE TABLE Reviews
  (ID MEDIUMINT NOT NULL,
   Username VARCHAR(20) NOT NULL,
   Score INT NOT NULL,
   Description VARCHAR(600),
   PRIMARY KEY (ID, Username),
   FOREIGN KEY (ID) REFERENCES Resource (ID),
   FOREIGN KEY (Username) REFERENCES User (Username)
   );


