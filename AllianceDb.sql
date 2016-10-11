DROP TABLE IF EXISTS `Organization`;

CREATE TABLE `Organization`
 (`Name` VARCHAR(20),
  PRIMARY KEY (`Name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `User`;

CREATE TABLE `User`(
 `Username` VARCHAR(20)  NOT NULL,
 `Email` VARCHAR(30) NOT NULL,
 `Password` VARCHAR(25) NOT NULL,
 `Name` VARCHAR(20) NOT NULL,
 `Organization` VARCHAR(20) NOT NULL,
 `Admin` INT NOT NULL,
 PRIMARY KEY (`Username`),
 FOREIGN KEY (`Organization`) REFERENCES `Organization` (`Name`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;

INSERT INTO `User` VALUES (`SonikaF`,`sfinch@hotmail.com`, `i<3Dogs`, `Sonika`, `Beloved`, `IDK`);

UNLOCK TABLES;

DROP TABLE IF EXISTS `Resource`;

CREATE TABLE `Resource`
 (`AdminName` VARCHAR(20)  NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  `Username` VARCHAR(20) NOT NULL,
  `Address_State` VARCHAR(2) NOT NULL,
  `Address_City` VARCHAR(20) NOT NULL,
  `Address_Zip` INT NOT NULL,
  `Address_Street` VARCHAR(20) NOT NULL,
  `Address_Number` INT NOT NULL,
  `Description` VARCHAR(600),
  `ID` MEDIUMINT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
 FOREIGN KEY (`Username`) REFERENCES `User` (`Username`),
 CONSTRAINT `Duplicate_Resource` UNIQUE (`Name`, `Address_State`, `Address_City`, `Address_Zip`, `Address_Street`, `Address_Number`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `User_Favorites`;

CREATE TABLE `User_Favorites` (
  `Username` VARCHAR(20)  NOT NULL,
  `ID` MEDIUMINT NOT NULL,
  PRIMARY KEY (`Username`, `ID`),
  FOREIGN KEY (`Username`) REFERENCES `User` (`Username`),
  FOREIGN KEY (`ID`) REFERENCES `Resource` (`ID`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Org_Favorites`;

CREATE TABLE `Org_Favorites`
 (`Organization` VARCHAR(20)  NOT NULL,
  `ID` MEDIUMINT NOT NULL,
  PRIMARY KEY (`Organization`, `ID`),
  FOREIGN KEY (`Organization`) REFERENCES `Organization` (`Name`),
  FOREIGN KEY (`ID`) REFERENCES `Resource`(`ID`));


DROP TABLE IF EXISTS `Number`;

CREATE TABLE `Number`
  (`PhoneNumber` INT NOT NULL,
  `Name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`PhoneNumber`, `Name`),
 FOREIGN KEY (`Name`) REFERENCES `Resource` (`Name`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Gender`

CREATE TABLE `Gender`
  (`Gender` VARCHAR(20),
    PRIMARY KEY(`Gender`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Gender` WRITE;
INSERT INTO `Gender` VALUES (`Male`, `Female`, `All`);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Housing`;

CREATE TABLE `Housing`
  (`ID` MEDIUMINT NOT NULL,
  `Capacity` INT,
  `Address_State` VARCHAR(2) NOT NULL,
  `Address_City` VARCHAR(20) NOT NULL,
  `Address_Zip` INT NOT NULL,
  `Address_Street` VARCHAR(20) NOT NULL,
  `Address_Number` INT NOT NULL,
  `Gender` VARCHAR(20),
  `Age` INT,
  `Houseing_Type` VARCHAR(20),
  FOREIGN KEY (`ID`) REFERENCES `Resource` (`ID`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Medical`;

CREATE TABLE `Medical`
  (`ID` MEDIUMINT NOT NULL,
  `Insurance` VARCHAR(20),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID`) REFERENCES `Resource` (`ID`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Religious`;

CREATE TABLE `Religious`
  (`ID` MEDIUMINT NOT NULL,
  `Denomonation` VARCHAR(20),
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID`) REFERENCES `Resource` (`ID`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Shelter`;

CREATE TABLE Shelter
  (`ID` MEDIUMINT NOT NULL,
  `Capacity` INT,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`ID`) REFERENCES `Resource` (ID)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `Reviews`;

CREATE TABLE Reviews
  (`ID` MEDIUMINT NOT NULL,
   `Username` VARCHAR(20) NOT NULL,
   `Score` INT NOT NULL,
   `Description` VARCHAR(600),
   PRIMARY KEY (`ID`, `Username`),
   FOREIGN KEY (`ID`) REFERENCES `Resource` (`ID`),
   FOREIGN KEY (`Username`) REFERENCES `User` (`Username`)
   ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


