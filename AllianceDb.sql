DROP TABLE IF EXISTS Organization;

CREATE TABLE Organization
 (Name VARCHAR(20),
  PRIMARY KEY (Name)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Organization WRITE;
INSERT INTO Organization VALUES ('Beloved');
UNLOCK TABLES;


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
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES User WRITE;
INSERT INTO User VALUES ('SonikaF','sfinch@hotmail.com', 'i<3Dogs', 'Sonika', 'Beloved', '1');
UNLOCK TABLES;

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
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS User_Favorites;

CREATE TABLE User_Favorites (
  Username VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Username, ID),
  FOREIGN KEY (Username) REFERENCES User (Username),
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS Gender



/*
Housing
 */

DROP TABLE IF EXISTS Gender;

CREATE TABLE Gender
  (Gender VARCHAR(20),
    PRIMARY KEY (Gender)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Gender WRITE;
INSERT INTO Gender VALUES ('Male'), ('Female'), ('All'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Houseing_Type;

CREATE TABLE Houseing_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Houseing_Type WRITE;
INSERT INTO Houseing_Type VALUES ('Group'), ('Rent'), ('Buy'), ('Shelter'), ('Other');
UNLOCK TABLES;

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
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Gender) REFERENCES Gender (Gender),
  FOREIGN KEY (Houseing_Type) REFERENCES Houseing_Type (Type)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
Documentation
 */
DROP TABLE IF EXISTS Doc_Type;

CREATE TABLE Doc_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Doc_Type WRITE;
INSERT INTO Doc_Type VALUES ('ID'), ('SS'), 
('Birth Certificate'), ('Driver''s License'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Documentation;

CREATE TABLE Documentation
  (ID MEDIUMINT NOT NULL,
   Type VARCHAR(20) NOT NULL,
    StartTime time,
    EndTime time,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Doc_Type (Type)
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*
Medical
 */
DROP TABLE IF EXISTS Med_Type;

CREATE TABLE Med_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Med_Type WRITE;
INSERT INTO Med_Type VALUES ('Dental'), ('Medical'), 
('Gynecologist'), ('Abortion Clinic'), ('STD'), ('Pediatrician'),
('Pharmacy'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Medical;

CREATE TABLE Medical
  ( Type VARCHAR(20),
    Insurance VARCHAR(500),
    Hours time,
    ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Med_Type (Type)
  )  ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*
Mental Health
 */
DROP TABLE IF EXISTS Mental_Type;

CREATE TABLE Mental_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Mental_Type WRITE;
INSERT INTO Mental_Type VALUES ('Counseling'), ('Psych Evals'), ('Counseling Hotline'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Mental_Health;

CREATE TABLE Mental_Health
( Type VARCHAR(20),
  Insurance VARCHAR(500),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (ID) REFERENCES Resource (ID),
  FOREIGN KEY (Type) REFERENCES Mental_Type (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*
Legal
 */
DROP TABLE IF EXISTS Leg_Type;

CREATE TABLE Leg_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Leg_Type WRITE;
INSERT INTO Leg_Type VALUES ('Custody'), ('Divorce'), ('Contract'), ('Police'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Legal;

CREATE TABLE Legal
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Leg_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
Resume Building
*/
DROP TABLE IF EXISTS Res_Type;

CREATE TABLE Res_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Res_Type WRITE;
INSERT INTO Res_Type VALUES ('School'), ('Workshops'), ('GED'), ('Certifications'), ('Other');
UNLOCK TABLES;

DROP TABLE IF EXISTS Resume_Building

CREATE TABLE Resume_Building
( Type VARCHAR(20),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Res_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
Employment
 */

DROP TABLE IF EXISTS Emp_Type;

CREATE TABLE Emp_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Emp_Type WRITE;
INSERT INTO Emp_Type VALUES ('Food'), ('Retail'), ('Office'), ('Factory'), ('Service'), ('Other');
UNLOCK TABLES;

DROP TABLE IF EXISTS Skills;

CREATE TABLE Skills
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Skills WRITE;
INSERT INTO Skills VALUES ('Typing'), ('People Skills'), ('Reading'), ('Writing'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Employment;

CREATE TABLE Employment
( Type VARCHAR(20),
  Salary INT,
  Skills VARCHAR(20),
  Childcare TINYINT(1),
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Emp_Type (Type),
  FOREIGN Key (Skills) REFERENCES Skills (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
Transportation
 */
DROP TABLE IF EXISTS Trans_Type;

CREATE TABLE Trans_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Trans_Type WRITE;
INSERT INTO Trans_Type VALUES ('Taxi'), ('Subway'), ('Bus'), ('Plane'), ('Train'), ('Other');
UNLOCK TABLES;


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
  FOREIGN KEY (Type) REFERENCES Trans_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*
Professional Mentors
 */
DROP TABLE IF EXISTS Mentor_Type;

CREATE TABLE Mentor_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Mentor_Type WRITE;
INSERT INTO Mentor_Type VALUES ('Life Coach'), ('Professional'), ('Personal'), ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Prof_Mentors;

CREATE TABLE Prof_Mentors
( Type VARCHAR(20),
  Cost INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Mentor_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
Vehicle
 */
DROP TABLE IF EXISTS Vehicle_Type;

CREATE TABLE Vehicle_Type
( Type VARCHAR(20),
  PRIMARY KEY (Type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Vehicle_Type WRITE;
INSERT INTO Vehicle_Type VALUES ('Donations'), ('Rent'), ('Buy'), ('Classes'), ('Insurance'), ('Register') ('Other');
UNLOCK TABLES;


DROP TABLE IF EXISTS Vehicle;

CREATE TABLE Vehicle
( Type VARCHAR(20),
  Cost INT,
  ID MEDIUMINT NOT NULL,
  FOREIGN KEY (Type) REFERENCES Vehicle_Type (Type),
  FOREIGN Key (ID) REFERENCES Resource (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



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
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


