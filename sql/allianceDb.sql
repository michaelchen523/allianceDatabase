DROP DATABASE IF EXISTS alliance;

CREATE DATABASE alliance;

use alliance;

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
INSERT INTO User VALUES ('MichaelC', 'mchen@gmail.com', 'abc123', 'Michael', 'BeLoved', 'IDK');
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

LOCK TABLES Resource WRITE;
INSERT INTO Resource (AdminName, Name, Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, Description)
VALUES ('IDK', 'Phi Sig','MichaelC', 'GA', 'Atlanta', '30332', 'Techwood Drive NW', '825', 'Frat house');
UNLOCK TABLES;

DROP TABLE IF EXISTS User_Favorites;

CREATE TABLE User_Favorites (
  Username VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Username, ID),
  FOREIGN KEY (Username) REFERENCES User (Username),
  FOREIGN KEY (ID) REFERENCES Resource (ID)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES User_Favorites WRITE;
INSERT INTO User_Favorites VALUES ('MichaelC', 1);
UNLOCK TABLES;

DROP TABLE IF EXISTS Org_Favorites;

CREATE TABLE Org_Favorites
 (Organization VARCHAR(20)  NOT NULL,
  ID MEDIUMINT NOT NULL,
  PRIMARY KEY (Organization, ID),
  FOREIGN KEY (Organization) REFERENCES Organization (Name),
  FOREIGN KEY (ID) REFERENCES Resource(ID));

LOCK TABLES Org_Favorites WRITE;
INSERT INTO Org_Favorites VALUES ('Beloved', 1);
UNLOCK TABLES;

DROP TABLE IF EXISTS Number;

CREATE TABLE Number
  (PhoneNumber INT NOT NULL,
  Name VARCHAR(20) NOT NULL,
  PRIMARY KEY (PhoneNumber, Name),
  FOREIGN KEY (Name) REFERENCES Resource (Name)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Number WRITE;
INSERT INTO Number VALUES ('4905558', 'Phi Sig');
UNLOCK TABLES;



/*
Housing
 */

DROP TABLE IF EXISTS Gender;

CREATE TABLE Gender
  (Gender VARCHAR(20),
    PRIMARY KEY (Gender)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Gender WRITE;
INSERT INTO Gender VALUES ('Male'), ('Female'), ('All');
UNLOCK TABLES;


DROP TABLE IF EXISTS Houseing_Type;

CREATE TABLE Houseing_Type
  (Type VARCHAR(20),
    PRIMARY KEY (Type)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES Houseing_Type WRITE;
INSERT INTO Houseing_Type VALUES ('Group'), ('Rent'), ('Buy'), ('Shelter');
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

LOCK TABLES Housing WRITE;
INSERT INTO Housing VALUES (1, 100, 'GA', 'Atlanta', 30332, 'Ponce', 123, 'Male', 18, 'Rent', 0);
UNLOCK TABLES;


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
    Hours time,
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
