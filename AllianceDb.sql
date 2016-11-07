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
    for women, and public benefits assistance', 14), ('Atlanta Mission: Fuqua Hall', 'SonikaF', 'GA', 'Atlanta', 30313, 'Mills Street', 156, 'Over the age of 18 years old unless accompanied by
    a legal guardian, agree to all guidelines and program activities, be fully detoxified and have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene
    and self-care, and complete an application', 'Emergency shelter, temporary shelter, and residential recovery', 17), ('Action Ministries', 'SonikaF', 'GA', 'Atlanta', 30308, 'Ponce de Leon Avenue',
    458, 'Must be homeless with children', 'Provides transitional housing to homeless families with children and casae management services, including providing a case manager, employment help and school
    related help for children ie tutoring', 18), ('Covenant House', 'SonikaF', 'GA', 'Atlanta', 30318, 'Johnson Road NW', 1559, 'Homeless youth ages 18-21 years old', 'Provides crisis shelter (with mental health
    and substance abuse assessment and treatment, medical attention, help with educational and vocational needs), indpendent living facilities for up to two years, educational services, job services, health and wellness, 
    lide skills development, and mental health services including individual, group, experiential, and pastoral counseling', 19), ('Eden Village: City of Refuge', 'SonikaF', 'GA', 'Atlanta', 30314, 
    'Joseph E. Boone Blvd', 1300, 'Children are welcome', 'Provides emergency night shelter for homeless women offering 30 and 120 days of support, other services including case management, food service, daycare/preschool, 
    after school tutoring for children, GED preparation, medical care, job readiness training and placement, and transition into permanent housing', 20), ('HOPE Atlanta: Transitional Housing Program', 'SonikaF', 'GA', 'Atlanta', 
    30303, 'Marietta St Suite 400', 75, 'Households with children, provides services up to 18-24 months, in Cobb, DeKalb, Gwinnett, Fulton, and Douglas', 'Provides housing, case management, and other supportive services', 27), ('iAM, 
    Atlanta Dream Center', 'SonikaF', 'GA', 'Atlanta', 30308, 'Angier Ave NE', 652, 'Currently homeless', 'Provides support for those who are homeless and addicted by placing men into an emergency shelter, provide case management, and
    are then placed into a 12 month restoration program', 28), ('The Garden: 7 Bridges to Recovery', 'SonikaF', 'GA', 'Smyrna', 30080, 'Plant Atkinson Rd', 2840, 'Phone intake, agree to rules, children are welcome (boys must be 13 or younger), 
    cannot leave shelter for first 30 days but can stay as long as the individual wants to, no fees, must surrender to God', 'Short term shelter', 31), ('Atlanta Mission: The Shepherd"s Inn', 'SonikaF', 'GA', 'Atlanta', 30313, 'Ivan Allen Blvd NW',
    165, 'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxified and have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene 
    and self-care, and complete an application', 'Provides overnight shelter and food, helps find and secure a job, find transitional housing, and assistance finding a recovery program if needed', 32), ('Young Adult Guidance Center', 'SonikaF', 'GA', 
    'Atlanta', 30318, 'Hightower Rd NW', 1230, '13 to 26 year old male, must complete an interview, and obtain approval by a case manager', 'Provides a crisis intervention and emergency shelter for male runaways and homeless youth; services include mentoring, 
    individual and group counseling, experiential therapy, health and wellness, life skill development, and educational and job services', 33), ('Atlanta Care for Self Sufficiency (ACSS)', 'SonikaF', 'GA', 'Atlanta', 30339, 'Edgewood Ave NE #700', 100, 'homeless, 
    ex-offenders, and unemployed individuals', 'Providese employment services and course, career counseling, and mental health support groups', 35), ('Atlanta Legal Aid Society, Inc.', 'SonikaF', 'GA', 'Atlanta', 30303, 'Spring St, NW', 151, 'Live in Cobb, DeKalb, 
    Fulton, South Fulton/Clayton, and Gwinnett', 'Provides legal aid for civil (non-criminal) matters', 38), ('Atlanta Volunteer Lawyers Foundation, Inc.', 'SonikaF', 'GA', 'Atlanta', 30303, 'Peachtree St NE, Suite 1750', 235, 'Complete and pass the financial and 
    geographical eligibility, those rejected are given alternative resources', 'Provides pro-bono legal assistance for domestic violence, landlord/tenant disputes, eviction, unpaid wages, consumer debt, and probate issues', 39), ('Community Court for Fulton Industrial 
    Boulevard Area', 'SonikaF', 'GA', 'Atlanta', 'Fulton Industrial Boulevard, Suite B', 5500, 'Must live in the Fulton Industrial Boulevard area', 'Provides referrals and support to community members and assitance for those who have committed a variety of crimes', 40), 
    ('Catholic Charities', 'SonikaF', 'GA', 'Chamblee', 30341, 'North Peachtree Rd', 3669, 'Must be pregnant or have a child 2 or younger, live within Fulton, DeKalb, Cobb, Douglas, or Gwinnett county', 'Provides services in home and includes assistnace with goal setting, 
      free baby supplies, counseling services, information and referral, case management, assessments and child development screenings', 42), ('Mary Hall Freedom House', 'SonikaF', 'GA', 'Atlanta', 31150, 'PO Box', 501205, 'For second set of services: women only, must recognize that alcohol/drug abuse is a problem,
      be drug free upon admittance (testing required), must be 18 years or older, must have had a tuberculosis and syphilis test completed in the past 6 months (documentation required), have two weeks of medication upon entry (documentation for mental disorders required), must meet DSM criteria for substance 
      dependence, meet physical requirements, and compelte an application', 'Monday-Sunday 7:30am-6pm; Provides up to two-year transitional housing to homeless veteran women and women with children. Also provides outpatient, day, residential, and intensive outpatient treatment for women struggling with addiction, 
      each program provides a treatment plan and treats clients with co-existing dependence and mental health disorders.', 34), ('Atlanta Mission: The Potter"s House', 'SonikaF', 'GA', 'Jefferson', 30549, 'Potter House Rd', 655, 'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines
      and program activities, be fully detoxified and have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 'Provides residential recovery and transitional housing for chemically addicted men', 50), ('Families First, Inc: Doula', 'SonikaF',
    'GA', 'Atlanta', 30357, 'W. Peachtree St, NE', 1105, 'In DeKalb and Fulton counties', 'Provides emotional and physical support for young pregnant women through her pregnancy and after', 51), ('Families First, Inc: TAPP', 'SonikaF', 'GA', 'Atlanta', 30357, 'W. Peachtree St, NE', 1105, 'In Cobb and Fulton counties', 'Provides 
    case management and counseling for pregnant teenagers and services (ie school visitation, service coordination, and parent education', 52), ('Crime Victims Advocacy Council', 'SonikaF', 'GA', 'Atlanta', 30339, 'Paces Mill Rd, SE', 3101, 'Must be a crime victime or the victim"s family', 'Provides crisis intervention, support groups 
    for victims of any crime, assistance in filing victim"s compensation, education regarding the criminal justice system, and information and appropriate referrals', 60), ('HOPE Atlanta: Veteran Services', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Low or low income, residing in or transitioning to permanent
    housing in Atlanta, Fulton, DeKalb, Cobb or Douglas counties', 'Provides services for rapid re-housing and prevention assistance to veterans and veteran families', 63), ('Georgia Center for Child Advocacy', 'SonikaF', 'GA', 'Atlanta', 30316, 'Woodland Ave, SE', 1485, 'Children abused in or reside in DeKalb or Fulton county', 
    'No fees and provides services for sexually and severely physically abused children focusing on prevention, intervention, and therapy. Provides forensic interviewing, forensic evaluations, therapy, and family advocacy services', 64), ('Cascade Community Services, Inc.', 'SonikaF', 'GA', 'Atlanta', 30311, 'Cascade Rd, SW', 3144, 
    'Must be a resident in the area', 'Provides baby, children, general, professional, and plus size clothing and financial assistance for gas, electric, mortgage, rent, and water services payment', 66), ('Fulton Atlanta Community Action Authority: Financial Assistance', 'SonikaF', 'GA', 'Atlanta', 30324, 'Chantilly Dr, NE', 1690, 
    'Must attend the financial planning classes (on Saturdays) and counseling before considered', 'Provides financial assistance', 67); 

INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number, Description, ID MEDIUMINT) VALUES
('Atlanta Mission: Atlanta Day Shelter for Women and Children', 'SonikaF', 'GA', 'Atlanta', 30318, 'Ethel St', 655, 'Provides job readiness programs, education 
  stipends, medical care, computer training, early education and teen programs, critical needs services, and mental health counseling', 7), ('Urban League of Greater Altanta:
  Education and Job Skills Training', 'GA', 'Atlanta', 30303, 'Peachtree St, NW #300', 229, 'GED Prep/Academic Upgrade: self-paced instruction in reading, math, science, and social 
  studies; Microsoft Office Certification: a 16 week course designed to provide basic computer skills and certify participants as Microsoft Office Specialists; Connect to Work: 
  an 8-weeek course covering call-center and customer service training; Banking and Financial Services Training Program: a 12-week introductory course to banking and financial services; 
  Financial Literacy and Wealth Creation Workshops; Homeownership Counseling and Education Programs', 8), ('4Sarah', 'SonikaF', 'GA', 'Conyers', 30012, 'PO Box', 82685, 'Provides short term 
  housing for women who have been commercially sexually exploited; Provides church placement, prayer, aftercare, residential program assistance, scholarships to assist with continuing 
  education, STI/HIV resources, suicide intervention, addiction and domestic violence resources', 9), ('Women"s Resouce Center', 'SonikaF', 'GA', 'Decatur', 30031, 'PO Box', 171,
  'Provides temporary housing for women and children, 24-hour domestic and dating violence hotline, legal advocacy, consultations with volunteer attorneys, domestic
  violence support groups, financial strategies program, community-based child and family advocacy, Camp PEACE, and provides a supervised visitation facility', 16), ('HOPE Atlanta: Emergency Shelter
  Hotel/Motel Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta Street, Suite 400', 75, 'Provides emergency housing for homeless families when there are no other available spaces in emergency 
  shelters or no appropriate shelter', 21), ('HOPE Atlanta: First Month"s Rent Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides helpf for homeless families
  wanting to acquire permanent housing including assistance with security deposits and utilities charges and case management support', 22), ('HOPE Atlanta: Homeless Prevention Program', 'SonikaF', 
  'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides services to prevent eviction and homelessness including case management, crisis counseling, information and referral employment assistanc, and
  financial assistance', 23), ('HOPE Atlanta: PATH Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St Suite 400', 75, 'Helps those not in a shelter by engaging them in their current locations, ensuring 
  their basic needs are being met, helping find housing, and providing case management', 24), ('HOPE Atlanta: Reunification Program', 'SonikaF', 'GA', 30303, 'Marietta St Suite 400', 75, 'Provides assistance
  to homeless residents and stranded individuals who are in need of transporation to return to their home communities', 25), ('HOPE Atlanta: Supportive Housing Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta 
  St Suite 400', 75, 'Provides permanent housing for special needs, chronically homeless women, and homeless women with children, and provides case management', 26), ('Our House', 'SonikaF', 'GA', 'Decatur', 30030, 
  'Columbia Drive', 711, 'Provides homeless families with family advocacy services inclusing case management, goal setting and action planning, counseling services, help with resources and referral, and employment and job
  training opportunities; Early Childhood Education Program: provides support for homeless children with a learning environment, services including immunizations and health check-ups, developmental assessments, and onsite special 
  education intervention services', 29), ('Atlanta Day Shelter for Women and Children', 'SonikaF', 'GA', 'Atlanta', 30318, 'Ethel Street NW', 655, 'Provides emergency shelter for women and children, offers job readiness programs, medical 
  care, computer training, child care, meals, clothing, transportation, and mental health counseling', 30), ('Urban Leage of Greater Atlanta: Job Assistance', 'SonikaF', 'GA', 'Atlanta', 30303, 'Peachtree St NW #300', 229, 'Step up to Work: 8 week job readiness and job replacement program including 
  customer service, entrepreneur, and computer skills training; Think UP!: career development program for workers looking for a new career path; Transitional Program: offers life skills, job readiness, job referrals, and placement and supportive services; Training
  2 Work: reentry program; New Beginnings: ex-offenders', 36), ('Urban League of Greater Atlanta: Prep for Young People', 'SonikaF', 'GA', 'Atlanta', 30303, 'Peachtree St NW #300', 229, 'Project Ready: supports high school students as they transition from high school to college 
  through tutoring, mentoring, career exploration workshops, college readiness programs, and more; YouthBuild: ages 16-24, training for construction work; Neighborhood College Prep: ages 14-24 and currently involved in the juvenile justice system and reside in Metro Atlanta', 37), 
  ('Atlanta Victim Assistance, Inc.', 'SonikaF', 'GA', 'Atlanta', 30303, 'Garnett St', 150, ' Provides support for feeling safe at home and in your neighborhood, identity theft, domestic violence, loss of a loved one to homicide, or support for a crime that has left a financial 
    or medical gap (includes parenting, general, financial)', 41), ('Buckhead Christian Ministry, Inc.', 'SonikaF', 'GA', 'Atlanta', 30305, 'Piedmont Rd NE, The Murray Building', 2847, 'Provides a 20 week educational program for families to develop skills and 
    strategies for budgeting their household financies and providing volunteer coaching', 43), ('Urban League of Greater Atlanta: Financial Literacy', 'SonikaF', 'GA', 'Atlanta', 30303, 'Peachtree St NW #300', 229, 'Financial Literacy and Wealth Creation Workshops: offer services to
    youth and adults to help budget household expenses, save invent, and create and maintain wealth; Homeownership Counseling and Education Programs: offers free monthly Homebuyer Education Workshops, counseling, mortgage readiness, and other support', 44), ('24/7 Gateway Center', 
    'SonikaF', 'GA', 'Atlanta', 30303, 'Pryor St, SW', 275, 'Provides a drop in center, clothing closet, shower, laundry facilities, on-site primary care medical clinic, and transitional shelter for men', 45), ('Community Advanced Practice Nurses, Inc.', 'SonikaF', 'GA', 'Atlanta', 
    30308, 'Ponce de Leon Ave, NE', 458, 'Provides primary health care services, pediatric health care, gynecology services, referrals, STD testing and treatment, HIV testing, tuberculosis skin testing, immunizations and vaccinations, dental care and vision referrals, referrals for 
    specialist services, and transportation for medical appointments. Also provides mental health care, substance abuse, group and child counseling, assessment and referrals for substance abuse, and case managament.', 46), ('Atlanta Care Center', 'SonikaF', 'GA', 'Atlanta', 30309, 'Peachtree St #496', 1718, 'Office hours: Monday-Thursday 9:30am-4pm, Saturday 9:30am-1pm; Provides confidential pregnancy testing, free ultrasounds, 
    pregnancy counseling, adoption help and information, resources for maternity, and baby clothing for women who are pregnant', 47), ('HOPE Atlanta: HIV/AIDS Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides emergency services, crisis intervention, transitional, and 
    permanent housing to those with HIV/AIDS', 48), ('Atlanta Harm Reduction Coaltion', 'SonikaF', 'GA', 'Atlanta', 30314, 'Joseph E. Boone Blvd', 1231, 'Tuesday 10am-5pm, Wednesday 10am-5pm, and Thursday 1pm-6pm; Provides education, risk reduction programs through partnership programs, diagnosis and 
    treatment of substance abuse, HIV/AIDS, sexually transmitted infections, viral Hepatitis, and other communicable diseases, free computer labe and phone use, free birth certificate and ID services, treatment referral services, free meals, needle exchange, and hygiene kits', 49), ('Bethany Christian Services', 'SonikaF', 
    'GA', 'Atlanta', 30328, 'Peachtree Dunwoody Rd, NE', 6645, 'Provides family, couples, children, and group counseling, information about pregnancy options, and options for financial assistance; fees: sliding fee scale, accepts Medicaid', 53), ('Families First, Inc: Counseling', 'SonikaF', 'GA', 'Atlanta', 30357, 'W Peachtree 
    St, NE', 1105, 'Provides counseling in Cobb, Gwinnett, Decatur, Harris-Johnston, North and South Fulton counties', 54), ('Odyssey Family Counseling Center', 'SonikaF', 'GA', 'Hapeville', 303054, 'S. Fulton Ave', 3578, 'Provides children (play therapy) and adolescent counseling, family therapy, outpatient substance abuse treatment 
    program for adolescents, groups (psycho-education, life and coping skills, anger management, and relapse prevention), substance abuse support for adolescents, counseling for adolescents charged with sex offense crimes and/or at risk for future involvement, and couples counseling', 55), ('Families First, Inc: Intervention Programs', 
    'SonikaF', 'GA', 'Atlanta', 30357, 'W. Peachtree St, NE', 1105, 'Provides Family Violence Intervention Program group counseling classes in Midtown, Cobb, Gwinnett, Decatur, South Fulton, North Fulton, and Harris-Johnston', 56), ('Day League', 'SonikaF', 'GA', 'Decatur', 30030, 'Church Street', 204, 'Provides hospital accompaniment services, 
    support groups and individual counseling for youth (ages 13-18 years old), support groups and individual counseling for adults, and follow up services', 57), ('Grady Rape Crisis Center', 'SonikaF', 'GA', 'Atlanta', 30303, 'Jesse Hill Jr Drive, SE, Box 26049', 80, 'Provides support groups, counseling, courtroom accompaniment, and community 
    prevention programs', 58), ('HOPE Atlanta: Domestic Violence Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides transportation, long distance travel asssistance, and resettlement services who have left domestic violence situations', 59), ('Girls Education & Mentoring Services (GEMS)', 'SonikaF', 'NA', 'NA', 00, 'NA', 00, 
    'Mission: to empower girls and young women (ages 12-24) who have experienced commerical sexual exploitation and domestic trafficking to exit the commercial sex industry and develop to their full potential', 61), ('National Survivor Network', 'SonikaF', 'NA', 'NA', 00, 'NA', 00, 'MissionL to bring together a 
    community of human trafficking by creating a platform for survivor-led advocacy, peer-to-peer mentorship and empowerment that embraces all survivors, regardless of gender, age, nationality, or type of trafficking experience', 62), ('Beulah Baptist Church', 'SonikaF', 'GA', 'Atlanta', 30314, 'Griffin St, NW', 167, 'Open 11am-1pm and provides clothing 
    and professional clothing to individuals in the area', 65), ('Salvation Army', 'SonikaF', 'GA', 'Atlanta', 30340, 'Central Ave', 3771, 'Provides assistance with food, clothing, rent/mortgage, utilities, school supplies, and furniture to families and individuals in a financial crisis', 68);


INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City, Address_Zip, Address_Street, Address_Number) 
VALUES ('madeup', 'SonikaF', 'NA', 'NA', 0, 'NA', 0 );

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


