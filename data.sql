DELETE FROM Category_Names;
DELETE FROM Categories;

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

INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number,
  Website,
  Documentation, 
  Eligibility,
  Description, 
  ID
  ) VALUES

('Families First, Inc.: Resource Moms', 
  'SonikaF', 
  'GA', 
  'Atlanta',
  30314, 
  'Joseph E. Lowery Boulevard, NW', 
  80, 
  'www.familiesfirst.org',
  0, 
  'In all of Georgia',  
  'Provides resources and information to new mothers with a low-birth weight baby', 
  3),

('Wellspring Living: Empowering Living Academy', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30342, 
  'Johnson Ferry Rd Suite 140-331', 
  860,
  'www.wellspringliving.org', 
  0, 
  'Women 18-31 years old, no violent criminal charges, medically stable, no substance abuse, access to transportation, willingness to live a drug and 
  alcohol free lifestyle, no history of sexual offending behavior, committed to empowered living curriculum and schedule',
  '9 week program (9am-3:40pm,5 days a week) that provides GED preparation, life skills classes, health and fitness classes, career readiness 
  training, opportunities for jobs, and individual and group therapy', 
  4),

('Fulton Atlanta Community Action Authority: Academy 4 Life', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30324, 
  'Chantilly Dr, NE', 
  1690, 
  'www.facaa.org',
  0, 
  'Must register or complete an online application', 
  'Provides support with life and career skills, provide educational, social, and economic opportunities, topics include: money management, 
  computer skills, entreprenurial help, GED preparation, life enhancement, construction skills training, and job preparedness', 
  5),

('Salvation Army Kroc Center: Family Literacy Program', 
  'SonikaF',
  'GA', 
  'Atlanta', 
  30310, 
  'Dewey St, SW', 
  967,
  'www.kroccenteratlanta.org/programs/family-literacy', 
  0, 
  'Complete application and admissions testing', 
  'Provides GED preparation Monday to Friday from 5-8pm and provides dinner and childcare', 
  6),

('Wellspring Living: Assessment Center', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30342, 
  'Johnson Ferry Rd Suite 140-331', 
  860, 
  'www.wellspringliving.org', 
  0,
 'Women 18-30 years old', 
 'Provides short-term residential care for survivors of sexual exploitation and sexual abuse and education about options', 
 11),

('Wellspring Living:Wellspring Living for Girls', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30342, 
  'Johnson Ferry Rd Suite 140-331', 
  860,
  'www.wellspringliving.org', 
  0, 
  'Girls 12-17 years old', 
  'Provides housing and support for survivors of Domestic Minor Sex Trafficking with a focus on trauma therapy, education, life skills, and confidence',
   12),

('Atlanta Mission: My Sister"s House', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  303118, 
  'Howell Mill Rd', 
  921, 
  'www.atlantamission.org', 
  0,
  'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxifiedand have 
  at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 
  'Provides overnight shelter for women and child including food, counselors, referrals to job training programs, assistance in obtaining housing, 
  medical and legal resources, and a childcare facilitiy with a behavioralspecialist and social workers', 
  13),
  
('Atlanta Mission: Fuqua Hall', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30313, 
  'Mills Street', 
  156, 
  'www.atlantamission.org', 
  0, 
  'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxified and have 
  at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 
  'Emergency shelter, temporary shelter, and residential recovery', 
  17),

('Action Ministries', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30308, 
  'Ponce de Leon Avenue', 
  458, 
  'www.actionministries.net', 
  0, 
  'Must be homeless with children',
  'Provides transitional housing to homeless families with children and casae management services, including providing a case manager, employment help 
  and school related help for children ie tutoring', 
  18),

('Covenant House', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30318, 
  'Johnson Road NW', 
  1559, 
  'www.covenanthousega.org', 
  0, 
  'Homeless youth ages 18-21 years old',
  'Provides crisis shelter (with mental healthand substance abuse assessment and treatment, medical attention, help with educational and vocational 
  needs), indpendent living facilities for up to two years, educational services, job services, health and wellness, lide skills development, and 
  mental health services including individual, group, experiential, and pastoral counseling', 
  19),

('HOPE Atlanta: Transitional Housing Program', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Marietta St Suite 400', 
  75, 
  'www.hopeatlanta.org', 
  0,
  'Households with children, provides services up to 18-24 months, in Cobb, DeKalb, Gwinnett, Fulton, and Douglas', 'Provides housing, case management, 
  and other supportive services', 
  27), 

('The Garden: 7 Bridges to Recovery', 
  'SonikaF', 
  'GA', 
  'Smyrna', 
  30080, 
  'Plant Atkinson Rd', 
  2840, 
  'www.7bridgestorecovery.org', 
  0, 
  'Phone intake, agree to rules, children are welcome (boys must be 13 or younger), cannot leave shelter for first 30 days but can stay as long as 
  the individual wants to, no fees, must surrender to God', 'Short term shelter. Email: 7bridgestorecovery@gmail.com', 
  31),

('Atlanta Mission: The Shepherd"s Inn', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30313, 
  'Ivan Allen Blvd NW', 
  165, 
  'www.atlantamission.org', 
  0,
  'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxified and 
  have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 
  'Provides overnight shelter and food, helps find and secure a job, find transitional housing, and assistance finding a recovery program if needed', 
  32), 

('Young Adult Guidance Center', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30318, 
  'Hightower Rd NW', 
  1230, 
  'www.yagc.net', 
  0, 
  '13 to 26 year old male, must complete an interview, and obtain approval by a case manager', 'Provides a crisis intervention and emergency 
  shelter for male runaways and homeless youth; services include mentoring, individual and group counseling, experiential therapy, health and 
  wellness, life skill development, and educational and job services', 
  33),

('Atlanta Care for Self Sufficiency (ACSS)', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30339, 
  'Edgewood Ave NE #700', 
  100, 
  'www.atlantacss.org', 
  0, 
  'homeless, ex-offenders, and unemployed individuals', 
  'Providese employment services and course, career counseling, and mental health support groups', 
  35),

('Mary Hall Freedom House', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  31150, 
  'PO Box', 
  501205, 
  'www.maryhallfreedomhouse.org', 
  0, 
  'For second set of services: women only, must recognize that alcohol/drug abuse is a problem, be drug free upon admittance (testing required), 
  must be 18 years or older, must have had a tuberculosis and syphilis test completed in the past 6 months (documentation required), have two 
  weeks of medication upon entry (documentation for mental disorders required), must meet DSM criteria for substance dependence, meet physical 
  requirements, and compelte an application', 
  'Monday-Sunday 7:30am-6pm; Provides up to two-year transitional housing to homeless veteran women and women with children. Also provides 
  outpatient, day, residential, and intensive outpatient treatment for women struggling with addiction, each program provides a treatment plan and 
  treats clients with co-existing dependence and mental health disorders.', 
  34),

('Atlanta Public Schools', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30316, 
  'Mary Dell Dr, SE', 
  1757, 
  'www.atlantapublicschools.us/adulteducation', 
  1, 
  'Live in Atlanta in Fulton County, 18 years or older, attend orientation session, complete enrollment information and assessment test', 
  'Provides free academic services and GED preparation', 
  70),

('Atlanta Workforce Development Agency (AWDA): GED', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30315, 
  'Pollard Blvd, SW', 
  818, 
  'www.atlantaga.gov/AWDA', 
  0, 
  'Aged 16-17 or 18 and older', 
  'Provides GED instruction including reading, writing, and math onsite once a week; Fees: none', 
  71),  

('YES Georgia', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Edgewood Ave, Suite 1030', 
  100, 
  'www.yesgeorgia.com  info@yesgeorgia.org', 
  1, 
  'Must have 8th greade minimum reading and math level, 16-23 years old, attend new student orientation on the first Monday of every month, have 
  legal ID', 
  'Provides community based GED program for at-risk youth and individuals who have dropped out of high school, individualized assessment and 
  lesson planning', 
  72), 

('Job Corps (US Dept of Labor)', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30314, 
  'West Lake Ave, NW', 
  239, 
  'www.atlanta.jobcorps.gov', 
  0, 
  'Pass income requirements', 
  'Provides education and training for 16 to 24 year olds including a GED program, online high school diploma program, advanced career training to 
  help students enter community and technical colleges', 
  73), 

('Serenity House of Atlanta Ministries, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30310, 
  'Confidential Address', 
  00, 
  'www.serenityhouseatl.org', 
  0, 
  'Complete phone intake for battered, ex-offender, or homeless women', 'Provides transitional housing for battered, ex-offencer, and homeless women, 
  minimum stay is 3 months; Fees: sliding scale', 
  15), 

('Buckhead Christian Ministry, Inc', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30305, 
  'Piedmont Rd, NE, The Murray Building', 
  2847, 
  'www.buckheadchristianministry.org', 
  1, 
  'Proof of address, picture ID, social security card for yourself and all other adults and children living with you', 
  'Provides emergency financial assistance to forestall eviction and utility shut-offs to those who have experienced illness, death in 
  family or job loss; also provides pantry items, support for new workers and thrift store items', 
  74), 

('Atlanta Mission: Clifton Sanctuary Ministries, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30307, 
  'Connecticut Avenue, NE', 
  369, 
  'www.cliftonsanctuary.com', 
  1, 
  'Homeless, HIV+ or disabled, over the age of 35, must provide medical or psychiatric records, declaration letter of homelessness from HUD or 
  referring case manager', 
  'Provides services for men who are homeless including emergency shelter, case management, support groups, counseling, health and wellness program, 
  computer training classes, and a transitional living facility', 
  75),

('Atlanta Workforce Development Agency (AWDA): Job Assistance', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30315, 
  'Pollard Blvd, SW', 
  818, 
  'www.atlantaga.gov/AWDA', 
  1, 
  'Must have been recently laid off, proof of residence, and employment history', 
  'Provides job assisstance and training, GED instruction, job readiness and interview skills, computer skills, and job leads', 
  78), 

('Center for Working Families, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30312, 
  'Windsor St #101', 
  477, 
  'www.tcwfi.org', 
  1, 
  'Live in 30310, 30312, or 30315, need photo ID, social security card, and attend employment bootcamp', 
  'Provides employment services, job development, curriculum, computer training (Microsoft Office), and financial workshops', 
  79),

('Integrity Transformations Community Development Corporation', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30318, 
  'Lindsey St', 
  692, 
  'www.integritycdc.com', 
  1, 
  'Live in the English Ave/Vine City, complete application, driver"s license', 
  'Provides job readiness training and job placement in construction, maintenance, and operation jobs nearby in the English Avenue area, computer 
  classes, and computer lab', 
  80),

('Second Chance International Ministries, Inc.', 
  'SonikaF', 
  'GA', 
  'College Park', 
  30337, 
  'Old National Hwy', 
  4848, 
  'www.secondchanceintl.org', 
  1, 
  'Over 18 years of age, ex-offenders, survivors of domestic violence, homeless veterans, complete application, picture ID', 
  'Provides resources to ex-offenders, survivors of domestic violence, those affected by substance abuse including anger management classes, 
  job preparedness workshop (every fourth Saturday from 3-4pm), and provides professional attire for ex-offenders', 
  81), 

('Hosea Williams Feed the Hungry and Homeless', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30310, 
  'Donnelly Ave, SW', 
  1035, 
  'www.hoseafeedthehungry.com', 
  1, 
  'Must provide picture ID, driver"s license, and social security card for each household member', 'Provides clothing and personal/grooming supplies 
  and food for those in need', 
  82), 

('Southwest Ecumenical Emergency Assistance Center, Inc. (SWEEAC)', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30310, 
  'Ralph David Abernathy Blvd, SW', 
  1040, 
  'www.sweeac.org', 
  1, 
  'Live in SW Atlanta (30310, 30311, 30331), complete an application form, picture ID, proof of residence', 
  'Provides a food pantry, clothing closest, job assistance, counseling, hearing/vision aids, and food stamps applications', 
  83);

INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Eligibility,
  Description, 
  ID
  ) VALUES

('Atlanta Legal Aid Society, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Spring St, NW', 
  151, 
  'Live in Cobb, DeKalb, Fulton, South Fulton/Clayton, and Gwinnett', 
  'Provides legal aid for civil (non-criminal) matters', 
  38),

('Atlanta Volunteer Lawyers Foundation, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Peachtree St NE, Suite 1750', 
  235, 
  'Complete and pass the financial and geographical eligibility, those rejected are given alternative resources', 
  'Provides pro-bono legal assistance for domestic violence, landlord/tenant disputes, eviction, unpaid wages, consumer debt, and probate issues', 
  39),

('Community Court for Fulton Industrial Boulevard Area', 
  'SonikaF', 
  'GA', 
  'Atlanta',
  30336,
  'Fulton Industrial Boulevard, Suite B', 
  5500, 
  'Must live in the Fulton Industrial Boulevard area', 
  'Provides referrals and support to community members and assitance for those who have committed a variety of crimes', 
  40), 

('Catholic Charities', 
  'SonikaF', 
  'GA', 
  'Chamblee', 
  30341, 
  'North Peachtree Rd', 
  3669, 
  'Must be pregnant or have a child 2 or younger, live within Fulton, DeKalb, Cobb, Douglas, or Gwinnett county', 
  'Provides services in home and includes assistnace with goal setting, free baby supplies, counseling services, information and referral, 
  case management, assessments and child development screenings', 
  42), 

('Atlanta Mission: The Potter"s House', 
  'SonikaF', 
  'GA', 
  'Jefferson', 
  30549, 
  'Potter House Rd', 
  655, 
  'Over the age of 18 years old unless accompanied by a legal guardian, agree to all guidelines and program activities, be fully detoxified and 
  have at least 72 hours since last drug or alcohol use, able to exercise proper personal hygiene and self-care, and complete an application', 
  'Provides residential recovery and transitional housing for chemically addicted men', 
  50),

('Families First, Inc: Doula', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30357, 
  'W. Peachtree St, NE', 
  1105, 
  'In DeKalb and Fulton counties', 
  'Provides emotional and physical support for young pregnant women through her pregnancy and after', 
  51), 

('Families First, Inc: TAPP', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30357, 
  'W. Peachtree St, NE', 
  1105, 
  'In Cobb and Fulton counties', 
  'Provides case management and counseling for pregnant teenagers and services (ie school visitation, service coordination, and parent education', 
  52), 

('Crime Victims Advocacy Council', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30339, 
  'Paces Mill Rd, SE', 
  3101, 
  'Must be a crime victime or the victim"s family', 
  'Provides crisis intervention, support groups for victims of any crime, assistance in filing victim"s compensation, education regarding the criminal 
  justice system, and information and appropriate referrals', 
  60), 

('HOPE Atlanta: Veteran Services', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Marietta St, Suite 400', 
  75, 
  'Low or low income, residing in or transitioning to permanent housing in Atlanta, Fulton, DeKalb, Cobb or Douglas counties', 
  'Provides services for rapid re-housing and prevention assistance to veterans and veteran families', 
  63), 

('Georgia Center for Child Advocacy', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30316, 
  'Woodland Ave, SE', 
  1485, 
  'Children abused in or reside in DeKalb or Fulton county', 
  'No fees and provides services for sexually and severely physically abused children focusing on prevention, intervention, and therapy. Provides 
  forensic interviewing, forensic evaluations, therapy, and family advocacy services', 
  64), 

('Cascade Community Services, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30311, 
  'Cascade Rd, SW', 
  3144, 
  'Must be a resident in the area', 
  'Provides baby, children, general, professional, and plus size clothing and financial assistance for gas, electric, mortgage, rent, and water 
  services payment', 
  66), 

('Fulton Atlanta Community Action Authority: Financial Assistance', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30324, 
  'Chantilly Dr, NE', 
  1690, 
  'Must attend the financial planning classes (on Saturdays) and counseling before considered', 
  'Provides financial assistance', 
  67);


INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Documentation, 
  Eligibility, 
  Description, 
  ID
  ) VALUES 

('Atlanta Dream Center, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30308, 
  'Angier Ave, NE', 
  635, 
  0, 
  'Live in the areas they serve', 
  'Provides after school program including tutoring and one-on-one mentoring',
  2),

('Beloved', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30307, 
  'Caroline St, Suite D120-426', 
  1270, 
  0, 
  'Complete an application and intake process', 
  'Provides 12-24 residential housing to women 18+ who have been involved in prostitution, trafficking, and addiction in Atlanta', 
  1), 

('Out of Darkness/Soloman"s House', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  00000, 
  'NA', 
  00, 
  0, 
  'At least 18 years old and has been commercially sexually exploited and wantto join a 12-15 month program', 
  'Helps those who are survivors of sex trafficking by rescuing women, placing them in a safe house and given medical care, mentoring and placing 
  her into a 12 month restoration program', 
  10),

('Partnership Against Domestic Violence/PADV', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30317, 
  'PO Box', 
  170225, 
  0, 
  'Must complete phone call process, no age limit, female only, but children are welcome', 
  'Provides 24-hour crisis line, emergency safe housing, parenting services, supportive housing program, legal advocacy, community support groups 
  for women, and public benefits assistance', 
  14), 

('Atlanta Children"s Shelter, Inc.', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30308, 
  'Confidential Address', 
  00, 
  1, 
  'Must call to schedule an intake and bring current shelter letter on agency letterhead, immunization records for each child, birth 
  certificate, a social security card for each parent and child, and a state ID/driver"s license for parent', 
  'Services include shelter for homeless children and families, enrichment programs, early childhooh nutrition program, health and 
  wellness program, case management, employment help, and housing help', 
  76), 

('Eden Village: City of Refuge', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30314, 
  'Joseph E. Boone Blvd', 
  1300, 
  0, 
  'Children are welcome', 
  'Provides emergency night shelter for homeless women offering 30 and 120 days of support, other services including case management, 
  food service, daycare/preschool, after school tutoring for children, GED preparation, medical care, job readiness training and placement, 
  and transition into permanent housing', 
  20),

('iAM, Atlanta Dream Center', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30308, 
  'Angier Ave NE', 
  652, 
  0, 
  'Currently homeless', 
  'Provides support for those who are homeless and addicted by placing men into an emergency shelter, provide case management, and are then 
  placed into a 12 month restoration program', 
  28),

('Salvation Army', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30313, 
  'Luckie St, NW', 
  400, 
  1, 
  'Must call at 7am the day of needed assistance, bring picture ID/driver license, social security card, TB test, homeless letter, proof of 
  income or letter from unemployment office', 
  'Provides emergency shelter for men, women, and families and provides fnancial and distaster office', 
  77);

INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Website, 
  Documentation, 
  Description, 
  ID
  ) VALUES

('Atlanta-Fulton Public Library System', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Margaret Mitchell Square, NW', 
  1, 
  'www.afpls.org/afplsservices/learning-career-center', 
  1, 
  'Centrary Library, 4th floor: Provides introductory computer classes (including the 
  basics, word, and related programs and the Internet) and GED study materials and classes', 
  69),
  
('Atlanta Mission: Atlanta Day Shelter for Women and Children', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30318, 
  'Ethel St', 
  655, 
  'www.atlantamission.org', 
  0, 
  'Provides job readiness programs, education stipends, medical care, computer training, early education and teen programs, critical needs 
  services, and mental health counseling', 
  7),

('Urban League of Greater Altanta: Education and Job Skills Training',
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Peachtree St, NW #300', 
  229, 
  'www.ulgatl.com', 
  0, 
  'GED Prep/Academic Upgrade: self-paced instruction in reading, math, science, and social studies; Microsoft Office Certification: a 16 week 
  course designed to provide basic computer skills and certify participants as Microsoft Office Specialists; Connect to Work: an 8-weeek course 
  covering call-center and customer service training; Banking and Financial Services Training Program: a 12-week introductory course to banking and 
  financial services; Financial Literacy and Wealth Creation Workshops; Homeownership Counseling and Education Programs',
  8),

('Women"s Resouce Center', 'SonikaF', 'GA', 'Decatur', 30031, 'PO Box', 171, 'www.wrcdv.org', 0, 'Provides temporary housing for women and children, 
  24-hour domestic and dating violence hotline, legal advocacy, consultations with volunteer attorneys, domestic violence support groups, financial 
  strategies program, community-based child and family advocacy, Camp PEACE, and provides a supervised visitation facility', 16),

('HOPE Atlanta: Emergency Shelter Hotel/Motel Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta Street, Suite 400', 75, 'www.hopeatlanta.org', 
  0, 'Provides emergency housing for homeless families when there are no other available spaces in emergency shelters or no appropriate shelter', 21),

('HOPE Atlanta: First Month"s Rent Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'www.hopeatlanta.org', 0, 'Provides 
  help for homeless families wanting to acquire permanent housing including assistance with security deposits and utilities charges and case 
  management support', 22), 

('HOPE Atlanta: Homeless Prevention Program', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Marietta St, Suite 400', 
  75, 
  'www.hopeatlanta.org', 
  0, 
  'Provides services to prevent eviction and homelessness including case management, crisis counseling, information and referral employment 
  assistanc, and financial assistance', 
  23),

('HOPE Atlanta: PATH Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St Suite 400', 75, 'www.hopeatlanta.org', 0, 'Helps those not in a shelter 
  by engaging them in their current locations, ensuring their basic needs are being met, helping find housing, and providing case management', 24), 

('HOPE Atlanta: Reunification Program', 
  'SonikaF', 
  'GA', 
  'Atlanta',
  30303, 
  'Marietta St Suite 400', 
  75, 
  'www.hopeatlanta.org', 
  0, 
  'Provides assistance to homeless residents and stranded individuals who are in need of transporation to return to their home communities', 
  25), 

('HOPE Atlanta: Supportive Housing Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St Suite 400', 75, 'www.hopeatlanta.org', 0, 'Provides 
  permanent housing for special needs, chronically homeless women, and homeless women with children, and provides case management', 26),

('Atlanta Day Shelter for Women and Children', 'SonikaF', 'GA', 'Atlanta', 30318, 'Ethel Street NW', 655, 'www.atlantadayshelter.org', 0, 'Provides 
  emergency shelter for women and children, offers job readiness programs, medical care, computer training, child care, meals, clothing, 
  transportation, and mental health counseling', 30);

INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number,
  Description, 
  ID
  ) VALUES

('Urban Leage of Greater Atlanta: Job Assistance', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Peachtree St NW #300',
  229, 
  'Step up to Work: 8 week job readiness and job replacement program including customer service, entrepreneur, and computer skills 
  training; Think UP!: career development program for workers looking for a new career path; Transitional Program: offers life skills, 
  job readiness, job referrals, and placement and supportive services; Training 2 Work: reentry program; New Beginnings: ex-offenders', 
  36), 

('Urban League of Greater Atlanta: Prep for Young People', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Peachtree St NW #300', 
  229, 
  'Project Ready: supports high school students as they transition from high school to college through tutoring, mentoring, career 
  exploration workshops, college readiness programs, and more; YouthBuild: ages 16-24, training for construction work; Neighborhood College 
  Prep: ages 14-24 and currently involved in the juvenile justice system and reside in Metro Atlanta', 
  37), 

('Atlanta Victim Assistance, Inc.', 'SonikaF', 'GA', 'Atlanta', 30303, 'Garnett St', 150, ' Provides support for feeling safe at home and in your 
  neighborhood, identity theft, domestic violence, loss of a loved one to homicide, or support for a crime that has left a financial or medical gap 
  (includes parenting, general, financial)', 41), 

('Buckhead Christian Ministry, Inc.', 'SonikaF', 'GA', 'Atlanta', 30305, 'Piedmont Rd NE, The Murray Building', 2847, 'Provides a 20 week educational 
  program for families to develop skills and strategies for budgeting their household financies and providing volunteer coaching', 43),

('Urban League of Greater Atlanta: Financial Literacy', 'SonikaF', 'GA', 'Atlanta', 30303, 'Peachtree St NW #300', 229, 'Financial Literacy and Wealth 
  Creation Workshops: offer services to youth and adults to help budget household expenses, save invent, and create and maintain wealth; Homeownership 
  Counseling and Education Programs: offers free monthly Homebuyer Education Workshops, counseling, mortgage readiness, and other support', 44), 

('24/7 Gateway Center', 'SonikaF', 'GA', 'Atlanta', 30303, 'Pryor St, SW', 275, 'Provides a drop in center, clothing closet, shower, laundry 
  facilities, on-site primary care medical clinic, and transitional shelter for men', 45), 

('Community Advanced Practice Nurses, Inc.', 'SonikaF', 'GA', 'Atlanta', 30308, 'Ponce de Leon Ave, NE', 458, 'Provides primary health care 
  services, pediatric health care, gynecology services, referrals, STD testing and treatment, HIV testing, tuberculosis skin testing, immunizations 
  and vaccinations, dental care and vision referrals, referrals for specialist services, and transportation for medical appointments. Also provides 
  mental health care, substance abuse, group and child counseling, assessment and referrals for substance abuse, and case managament.', 46), 

('Atlanta Care Center', 'SonikaF', 'GA', 'Atlanta', 30309, 'Peachtree St #496', 1718, 'Office hours: Monday-Thursday 9:30am-4pm, Saturday 9:30am-1pm; 
  Provides confidential pregnancy testing, free ultrasounds, pregnancy counseling, adoption help and information, resources for maternity, and baby 
  clothing for women who are pregnant', 47), 

('HOPE Atlanta: HIV/AIDS Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides emergency services, crisis 
  intervention, transitional, and permanent housing to those with HIV/AIDS', 48), 

('Atlanta Harm Reduction Coaltion', 'SonikaF', 'GA', 'Atlanta', 30314, 'Joseph E. Boone Blvd', 1231, 'Tuesday 10am-5pm, Wednesday 10am-5pm, and 
  Thursday 1pm-6pm; Provides education, risk reduction programs through partnership programs, diagnosis and treatment of substance abuse, HIV/AIDS, 
  sexually transmitted infections, viral Hepatitis, and other communicable diseases, free computer labe and phone use, free birth certificate and 
  ID services, treatment referral services, free meals, needle exchange, and hygiene kits', 49),

('Bethany Christian Services', 'SonikaF', 'GA', 'Atlanta', 30328, 'Peachtree Dunwoody Rd, NE', 6645, 'Provides family, couples, children, and group 
  counseling, information about pregnancy options, and options for financial assistance; fees: sliding fee scale, accepts Medicaid', 53), 

('Families First, Inc: Counseling', 'SonikaF', 'GA', 'Atlanta', 30357, 'W Peachtree St, NE', 1105, 'Provides counseling in Cobb, Gwinnett, Decatur, 
  Harris-Johnston, North and South Fulton counties', 54), 

('Odyssey Family Counseling Center', 'SonikaF', 'GA', 'Hapeville', 303054, 'S. Fulton Ave', 3578, 'Provides children (play therapy) and adolescent 
  counseling, family therapy, outpatient substance abuse treatment program for adolescents, groups (psycho-education, life and coping skills, anger 
  management, and relapse prevention), substance abuse support for adolescents, counseling for adolescents charged with sex offense crimes and/or at 
  risk for future involvement, and couples counseling', 55), 

('Families First, Inc: Intervention Programs', 'SonikaF', 'GA', 'Atlanta', 30357, 'W. Peachtree St, NE', 1105, 'Provides Family Violence Intervention 
  Program group counseling classes in Midtown, Cobb, Gwinnett, Decatur, South Fulton, North Fulton, and Harris-Johnston', 56), 

('Day League', 'SonikaF', 'GA', 'Decatur', 30030, 'Church Street', 204, 'Provides hospital accompaniment services, support groups and individual 
  counseling for youth (ages 13-18 years old), support groups and individual counseling for adults, and follow up services', 57),

('Grady Rape Crisis Center', 'SonikaF', 'GA', 'Atlanta', 30303, 'Jesse Hill Jr Drive, SE, Box 26049', 80, 'Provides support groups, counseling, 
  courtroom accompaniment, and community prevention programs', 58), 

('HOPE Atlanta: Domestic Violence Program', 'SonikaF', 'GA', 'Atlanta', 30303, 'Marietta St, Suite 400', 75, 'Provides transportation, long distance 
  travel asssistance, and resettlement services who have left domestic violence situations', 59), 

('Girls Education & Mentoring Services (GEMS)', 'SonikaF', 'NA', 'NA', 00, 'NA', 00, 'Mission: to empower girls and young women (ages 12-24) who 
  have experienced commerical sexual exploitation and domestic trafficking to exit the commercial sex industry and develop to their full potential', 61), 

('National Survivor Network', 'SonikaF', 'NA', 'NA', 00, 'NA', 00, 'MissionL to bring together a community of human trafficking by creating a 
  platform for survivor-led advocacy, peer-to-peer mentorship and empowerment that embraces all survivors, regardless of gender, age, nationality, 
  or type of trafficking experience', 62), 

('Beulah Baptist Church', 'SonikaF', 'GA', 'Atlanta', 30314, 'Griffin St, NW', 167, 'Open 11am-1pm and provides clothing and professional clothing 
  to individuals in the area', 65),

('Salvation Army', 'SonikaF', 'GA', 'Atlanta', 30340, 'Central Ave', 3771, 'Provides assistance with food, clothing, rent/mortgage, utilities, 
  school supplies, and furniture to families and individuals in a financial crisis', 68);


INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Documentation, 
  Description, 
  ID
  ) VALUES 

('4Sarah', 'SonikaF', 'GA', 'Conyers', 30012, 'PO Box', 82685, 0, 'Provides short term housing for women who have been commercially sexually 
  exploited; Provides church placement, prayer, aftercare, residential program assistance, scholarships to assist with continuing education, STI/HIV 
  resources, suicide intervention, addiction and domestic violence resources', 9),

('Our House', 'SonikaF', 'GA', 'Decatur', 30030, 'Columbia Drive', 711, 0, 'Provides homeless families with family advocacy services inclusing case 
  management, goal setting and action planning, counseling services, help with resources and referral, and employment and job training opportunities; 
  Early Childhood Education Program: provides support for homeless children with a learning environment, services including immunizations and 
  health check-ups, developmental assessments, and onsite special education intervention services', 29); 


INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Documentation,
  ID
  ) VALUES

('National Human Trafficking Hotline and Resource Center', 
  'SonikaF', 
  'NA', 
  'NA', 
  0, 
  'NA', 
  0, 
  0, 
  84),

('Literacy Action', 
  'SonikaF', 
  'GA', 
  'Atlanta', 
  30303, 
  'Edgewood Ave, NE', 
  100, 
  0, 
  88);

INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number, 
  Website, 
  Documentation, 
  ID
  ) VALUES

('Mayor"s Office', 'SonikaF', 'GA', 'Atlanta', 30303, 'Office of Communications Trinity Avenue, Suite 2500', '55', 'communications@atlantaga.gov',
 0, 85), 

('U.S. Laws on Trafficking in Persons', 'SonikaF', 'NA', 'NA', 0, 'NA', 0, 'www.state.gov/j/tip/laws', 0, 86);


INSERT INTO Resource (
  Name, 
  Creator_Username, 
  Address_State, 
  Address_City, 
  Address_Zip, 
  Address_Street, 
  Address_Number,
  Website, 
  ID
  ) VALUES

('Attorney General of Georgia - Human Trafficking', 'SonikaF', 'NA', 'NA', 0, 'NA', 0, 'www.law.ga.gov/human-trafficking', 87);


INSERT INTO Category_Names VALUES 
('Supplies', 'Resources that provide supplies, such as clothing, food, hygienic supplies, and financial aid.'),
('Housing', 'Resources that give options for housing based on gender and type of housing, including group and shelter.'), 
('Medical', 'Resources that offer medical attention with different physicians, including dentist, gynecologist, and pediatrician.'),
('Mental_Health', 'Resources that provide services relating to mental health, including counseling and case management.'),
('Legal', 'Resources that help victims navigate their legal problems, including advocacy and case management.'),
('Employment', 'Resources that help find job placement for victims.'),
('Transportation', 'Resources that give transportation services for various reasons.'),
('Mentors', 'Resources that aid victims find professional mentors to help them.'),
('For_Children', 'Resources meant to help children get out of sexually or physically abusive environments and navigate the legal system.'),
('Childcare', 'Resources for parents meant to help them with their children, including day care and tutoring.'),
('Vehicle', 'Resources that help victims find vehicles.'),
('Life_Skills', 'Resources that help victims learn life skills, including financial and health.'),
('Education', 'Resources that help victims gain an education through GED programs and scholarships.'),
('Networks', 'Resources that give victims a way to find survivor networks in their area.'),
('Job_Readiness', 'Resources that help victims prepare themselves for a job or career.');


INSERT INTO Categories VALUES
('Supplies', 13),
('Supplies', 74),
('Supplies', 22),
('Supplies', 23),
('Supplies', 30),
('Supplies', 77),
('Supplies', 81),
('Supplies', 42),
('Supplies', 45),
('Supplies', 47),
('Supplies', 49),
('Supplies', 53),
('Supplies', 65),
('Supplies', 66),
('Supplies', 82),
('Supplies', 83),
('Supplies', 67),
('Supplies', 68),
('Supplies', 84),
('Supplies', 85),
('Supplies', 86),
('Supplies', 87),

('Housing', 9), 
('Housing', 1),
('Housing', 10),
('Housing', 11),
('Housing', 12),
('Housing', 13), 
('Housing', 14), 
('Housing', 15),
('Housing', 16), 
('Housing', 74), 
('Housing', 75), 
('Housing', 17), 
('Housing', 18), 
('Housing', 76), 
('Housing', 20), 
('Housing', 21), 
('Housing', 22), 
('Housing', 23), 
('Housing', 24), 
('Housing', 25), 
('Housing', 26), 
('Housing', 27), 
('Housing', 28),
('Housing', 29), 
('Housing', 30), 
('Housing', 31), 
('Housing', 77), 
('Housing', 32), 
('Housing', 34), 
('Housing', 45), 
('Housing', 48), 
('Housing', 50), 
('Housing', 59), 
('Housing', 63),

('Medical', 9),
('Medical', 10),
('Medical', 13),
('Medical', 19),
('Medical', 20),
('Medical', 29),
('Medical', 30),
('Medical', 34),
('Medical', 45),
('Medical', 46),
('Medical', 47),
('Medical', 48),
('Medical', 49),
('Medical', 50),
('Medical', 51),

('Mental_Health', 4),
('Mental_Health', 10),
('Mental_Health', 12),
('Mental_Health', 75),
('Mental_Health', 19),
('Mental_Health', 29),
('Mental_Health', 30),
('Mental_Health', 33),
('Mental_Health', 34),
('Mental_Health', 35),
('Mental_Health', 46),
('Mental_Health', 51),
('Mental_Health', 52),
('Mental_Health', 53),
('Mental_Health', 54),
('Mental_Health', 55),
('Mental_Health', 56),
('Mental_Health', 57),
('Mental_Health', 58),
('Mental_Health', 64),
('Mental_Health', 83),

('Legal', 13),
('Legal', 14),
('Legal', 16),
('Legal', 75),
('Legal', 76),
('Legal', 20),
('Legal', 22),
('Legal', 23),
('Legal', 24),
('Legal', 26),
('Legal', 27),
('Legal', 28),
('Legal', 29),
('Legal', 38),
('Legal', 39),
('Legal', 40),
('Legal', 41),
('Legal', 42),
('Legal', 60),
('Legal', 64),

('Employment', 4),
('Employment', 18),
('Employment', 76),
('Employment', 19),
('Employment', 20),
('Employment', 23),
('Employment', 29),
('Employment', 32),
('Employment', 33),
('Employment', 78),
('Employment', 79),
('Employment', 80),
('Employment', 36),

('Transportation', 25),
('Transportation', 30),
('Transportation', 46),
('Transportation', 63), 

('Mentors', 37),

('For_Children', 64),

('Childcare', 2), 
('Childcare', 3), 
('Childcare', 6), 
('Childcare', 73), 
('Childcare', 13), 
('Childcare', 18), 
('Childcare', 76), 
('Childcare', 20), 
('Childcare', 30), 
('Childcare', 42), 
('Childcare', 53),

('Life_Skills', 3), 
('Life_Skills', 4), 
('Life_Skills', 5), 
('Life_Skills', 12), 
('Life_Skills', 14), 
('Life_Skills', 16), 
('Life_Skills', 76), 
('Life_Skills', 19), 
('Life_Skills', 20), 
('Life_Skills', 23), 
('Life_Skills', 33), 
('Life_Skills', 79), 
('Life_Skills', 42), 
('Life_Skills', 43), 
('Life_Skills', 44), 
('Life_Skills', 52), 
('Life_Skills', 55),

('Education', 4), 
('Education', 71), 
('Education', 69),
('Education', 70),
('Education', 5),
('Education', 88),
('Education', 6),
('Education', 72),
('Education', 7),
('Education', 73),
('Education', 8),
('Education', 9),
('Education', 12),
('Education', 75),
('Education', 20),
('Education', 30),
('Education', 78),
('Education', 79),
('Education', 80),
('Education', 36),
('Education', 49), 

('Networks', 58),
('Networks', 59),
('Networks', 60),
('Networks', 61),
('Networks', 62),

('Job_Readiness', 4),
('Job_Readiness', 5),
('Job_Readiness', 73),
('Job_Readiness', 13),
('Job_Readiness', 20),
('Job_Readiness', 29),
('Job_Readiness', 30),
('Job_Readiness', 35),
('Job_Readiness', 78),
('Job_Readiness', 79),
('Job_Readiness', 80),
('Job_Readiness', 81),
('Job_Readiness', 36),
('Job_Readiness', 37),
('Job_Readiness', 83);


INSERT INTO Phone_Numbers VALUES
('4048532800', 'Intake', 3), 
('4048811991', 'ext. 5608', 18), 
('4047681156', 'Main Client', 55), 
('4043771429', '24/7 Crisis Hotline', 57), 
('4046164861', 'Crisis Line', 58), 
('4048532844', 'Main Client', 3), 
('4046020068', 'Ages 12-17', 4), 
('4044273100', 'Ages 18-30', 4), 
('4046020068', 'Ages 12-17', 11), 
('4044273100', 'Ages 18-30', 11), 
('4046020068', 'Ages 12-17', 12), 
('4044273100', 'Ages 18-30', 12), 
('4048731766', 'Fulton County Crisis Line', 14), 
('7709639799', 'Gwinnett County Crisis Line', 14), 
('4048532800', 'Intake', 51), 
('4048532844', 'Main Client', 51), 
('4048532800', 'Intake', 52), 
('4048532844', 'Main Client', 52), 
('4048532800', 'Intake', 54), 
('4048532844', 'Main Client', 54), 
('4048532800', 'Intake', 56), 
('4048532844', 'Main Client', 56);


INSERT INTO Phone_Numbers (Phone_Number, ID) VALUES 
('4703628808', 9), 
('4048173502', 2), 
('4043200166', 5), 
('4046387210', 6), 
('4045884007', 7), 
('4046591150', 8), 
('4043672465', 13), 
('18444737364', 15), 
('4043707670', 16), 
('4043672508', 17), 
('4045890163', 19), 
('4048742241', 20), 
('4048177070', 21), 
('4048177070', 22), 
('4048177070', 23), 
('4048177070', 24), 
('4048177070', 25), 
('4048177070', 26), 
('4048177070', 27), 
('4048172502', 28), 
('4043780938', 29), 
('4048762894', 30), 
('6784303698', 31), 
('4045884015', 32), 
('4047927616', 33), 
('4048748001', 35), 
('4046591150', 36), 
('4046591150', 37), 
('4045245811', 38), 
('4045210790', 39), 
('4046136441', 40), 
('4045884759', 41), 
('4049207745', 42), 
('4042390038', 43), 
('4042156600', 45), 
('4048151811', 46), 
('4044926187', 47), 
('4048177070', 48), 
('4048179994', 49), 
('7704557111', 53), 
('4048177070', 59), 
('7703339254', 60), 
('4048177070', 63), 
('6789042880', 64), 
('4046882296', 65), 
('4046915770', 66), 
('4043200166', 67), 
('7709360449', 68), 
('4047301915', 69), 
('4045643000', 71), 
('4048023560', 70), 
('4048187323', 88), 
('4042157883', 72), 
('8007335627', 73), 
('4042390038', 74), 
('4043733253', 75), 
('4048923713', 76), 
('4044862700', 77), 
('4045643000', 78), 
('4042333303', 79), 
('4048531780', 80), 
('4046849508', 81), 
('4047553353', 82), 
('4047561699', 83), 
('8883737888', 84), 
('4043306004', 85), 
('4048709600', 14),
('7706425500', 34), 
('1855851FREE', 34);


INSERT INTO Housing (Children, Gender, ID) VALUES 

(0, 'Female', 9), 
(0, 'Female', 1),
(0, 'Female', 10),
(0, 'Female', 11),
(0, 'Female', 12),
(1, 'Female', 13), 
(1, 'Female', 14), 
(0, 'Female', 15),
(1, 'Female', 16), 
(1, 'All', 74), 
(0, 'Male', 75), 
(0, 'All', 17), 
(1, 'All', 18), 
(1, 'All', 76), 
(1, 'Female', 20), 
(1, 'All', 21), 
(1, 'All', 22), 
(0, 'All', 23), 
(0, 'All', 24), 
(0, 'All', 25), 
(1, 'Female', 26), 
(1, 'All', 27), 
(0, 'Male', 28),
(1, 'All', 29), 
(1, 'Female', 30), 
(1, 'All', 31), 
(1, 'All', 77), 
(0, 'Male', 32), 
(1, 'Female', 34), 
(0, 'Male', 45), 
(0, 'All', 48), 
(0, 'Male', 50), 
(1, 'Female', 59), 
(1, 'All', 63);


INSERT INTO Housing (ID, Gender, AgeMax, AgeMin, Children) VALUES

(19, 'All', 21, 18, 0),
(33, 'Male', 26, 13, 0);


INSERT INTO Housing_Type VALUES

('Group', 9),
('Group', 1),
('Group', 10),
('Group', 11),
('Group', 12),
('Shelter', 13),
('Shelter', 14),
('Transitional', 15),
('Transitional', 16),
('Shelter', 75),
('Shelter', 17),
('Transitional', 18),
('Shelter', 76), 
('Shelter', 19), 
('Shelter', 20), 
('Shelter', 21), 
('Rent', 22), 
('Buy', 22), 
('Transitional', 27), 
('Shelter', 28), 
('Group', 28), 
('Shelter', 30), 
('Shelter', 31), 
('Shelter', 77), 
('Shelter', 32), 
('Shelter', 33), 
('Group', 34), 
('Transitional', 45), 
('Transitional', 48),
('Group', 50), 
('Transitional', 50);


INSERT INTO Housing_Serve VALUES 

('Exploited', 9),
('Addiction', 9),
('Religious', 9), 
('Exploited', 1), 
('Addiction', 1), 
('Religious', 1), 
('Exploited', 10), 
('Exploited', 11), 
('Exploited', 12), 
('Temporary/ Emergency', 13), 
('Temporary/ Emergency', 14), 
('Homeless', 15), 
('Battered', 15), 
('Battered', 16), 
('Temporary/ Emergency', 16), 
('Temporary/ Emergency', 74), 
('Temporary/ Emergency', 75), 
('Temporary/ Emergency', 17), 
('Temporary/ Emergency', 18), 
('Families', 18), 
('Families', 76), 
('Homeless', 76), 
('Temporary/ Emergency', 19), 
('Homeless', 19), 
('Addiction', 19), 
('Temporary/ Emergency', 20), 
('Families', 21),
('Families', 22), 
('Homeless', 22), 
('Homeless', 24), 
('Homeless', 25), 
('Homeless', 26), 
('Families', 27), 
('Temporary/ Emergency', 28), 
('Homeless', 28), 
('Addiction', 28), 
('Homeless', 29), 
('Families', 29), 
('Temporary/ Emergency', 30), 
('Religious', 31), 
('Temporary/ Emergency', 31), 
('Families', 77),
('Temporary/ Emergency', 32), 
('Temporary/ Emergency', 33), 
('Homeless', 33), 
('Temporary/ Emergency', 34), 
('Addiction', 34), 
('Temporary/ Emergency', 45), 
('Temporary/ Emergency', 48), 
('Battered', 59);


INSERT INTO Childcare (ID) VALUES 
(2), 
(3), 
(6), 
(73), 
(13), 
(18), 
(76), 
(20), 
(30), 
(42), 
(53);


INSERT INTO Child_Type VALUES 

('Day Care', 2), 
('Mentoring', 2), 
('Tutoring', 2), 
('Information', 3), 
('Day Care', 6), 
('Day Care', 73), 
('Tutoring', 18), 
('Information', 76), 
('Tutoring', 20), 
('Day Care', 20), 
('Information', 42), 
('Information', 53); 


INSERT INTO Life_Skills (ID) VALUES 

(3), 
(4), 
(5), 
(12), 
(14), 
(16), 
(76), 
(19), 
(20), 
(23), 
(33), 
(79), 
(42), 
(43), 
(44), 
(52), 
(55); 


INSERT INTO Life_Skill_Type VALUES 

('Parenting', 3), 
('General', 4), 
('General', 5), 
('Financial', 5), 
('General', 12), 
('Parenting', 14), 
('Financial', 16), 
('General', 19), 
('Home Ownership', 20), 
('Home Ownership', 23), 
('General', 33), 
('Financial', 79), 
('Parenting', 42), 
('Financial', 43), 
('Financial', 44), 
('Home Ownership', 44), 
('Parenting', 52), 
('General', 55);


INSERT INTO Education (ID) VALUES

(4), 
(71), 
(69),
(70),
(5),
(88),
(6),
(72),
(7),
(73),
(8),
(9),
(12),
(75),
(20),
(30),
(78),
(79),
(80),
(36),
(49); 


INSERT INTO Education_Type VALUES

('GED', 4), 
('GED', 71),
('GED', 69),
('Computer Skills', 69),
('GED', 70),
('GED', 5),
('Computer Skills', 5),
('GED', 6),
('GED', 72),
('Computer Skills', 7),
('Scholarships', 7),
('GED', 73),
('GED', 8),
('Computer Skills', 8),
('Scholarships', 9), 
('Computer Skills', 75),
('GED', 20),
('Computer Skills', 30),
('GED', 78),
('Computer Skills', 78),
('Computer Skills', 79),
('Computer Skills', 80),
('Computer Skills', 36);


INSERT INTO Job_Readiness (ID) VALUES

(4),
(5),
(73),
(13),
(20),
(29),
(30),
(35),
(78),
(79),
(80),
(81),
(36),
(37),
(83);


INSERT INTO Job_Readiness_Type VALUES

('Training', 4),
('Training', 5),
('Training', 73),
('Training', 13),
('Training', 20),
('Training', 29),
('Training', 30),
('Training', 35),
('Counseling', 35),
('Training', 78),
('Training', 79),
('Training', 80),
('Training', 81),
('Training', 36),
('Counseling', 36),
('Counseling', 37),
('Training', 37),
('Training', 83);


INSERT INTO Employment (ID) VALUES
(4),
(18),
(76),
(19),
(20),
(23),
(29),
(32),
(33),
(78),
(79),
(80),
(36);


INSERT INTO Mental_Health (ID) VALUES 

(4),
(10),
(12),
(75),
(19),
(29),
(30),
(33),
(34),
(35),
(46),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(64),
(83);


INSERT INTO Mental_Type VALUES 

('Counseling', 4),
('Counseling', 10),
('Counseling', 12),
('Counseling', 75),
('Counseling', 19),
('Counseling', 29),
('Counseling', 30),
('Counseling', 33),
('Counseling', 35),
('Counseling', 46),
('Substance Abuse', 46),
('Case Management', 46), 
('Counseling', 51),
('Counseling', 52),
('Case Management', 52),
('Counseling', 53),
('Counseling', 54),
('Counseling', 55),
('Substance Abuse', 55),
('Counseling', 56),
('Counseling', 57),
('Counseling', 58),
('Counseling', 64);


INSERT INTO Medical (ID) VALUES 

(9),
(10),
(13),
(19),
(20),
(29),
(30),
(34),
(45),
(46),
(47),
(48),
(49),
(50),
(51); 


INSERT INTO Med_Type VALUES 

('STI/ HIV', 9),
('General', 10),
('General', 13),
('General', 19),
('General', 20),
('General', 29),
('Immunization', 29),
('General', 30),
('Residential', 34),
('Addiction', 34),
('STI/ HIV', 46),
('General', 46),
('Pediatrician', 46),
('Gynecologist', 46),
('Immunization', 46),
('Dental', 46),
('Vision', 46),
('Gynecologist', 47),
('STI/ HIV', 48),
('STI/ HIV', 49),
('Residential', 50),
('Addiction', 50),
('Gynecologist', 51);


INSERT INTO Supplies (ID) VALUES

(13),
(74),
(22),
(23),
(30),
(77),
(81),
(42),
(45),
(47),
(49),
(53),
(65),
(66),
(82),
(83),
(67),
(68),
(84),
(85),
(86),
(87);


INSERT INTO Supp_Type VALUES

('Food', 13),
('Food', 74),
('Financial Aid', 74),
('Financial Aid', 22),
('Financial Aid', 23),
('Clothing', 30),
('Food', 30),
('Financial Aid', 77),
('Clothing', 81),
('Children''s Things', 42),
('Clothing', 45),
('Hygienic Supplies', 45),
('Laundry', 45), 
('Children''s Things', 47),
('Clothing', 47),
('Hygienic Supplies', 49),
('Food', 49),
('Financial Aid', 53),
('Clothing', 65),
('Clothing', 66),
('Financial Aid', 66),
('Clothing', 82),
('Hygienic Supplies', 82),
('Clothing', 83),
('Food', 83),
('Medical', 83), 
('Food Stamps', 83),
('Financial Aid', 67),
('Clothing', 68),
('Food', 68),
('Financial Aid', 68);


INSERT INTO Legal VALUES 

(13),
(14),
(16),
(75),
(76),
(20),
(22),
(23),
(24),
(26),
(27),
(28),
(29),
(38),
(39),
(40),
(41),
(42),
(60),
(64); 


INSERT INTO Leg_Type VALUES 

('Advocacy', 16),
('Case Management', 75),
('Case Management', 76),
('Case Management', 20),
('Case Management', 22),
('Case Management', 23),
('Case Management', 24),
('Case Management', 26),
('Case Management', 27),
('Case Management', 28), 
('Case Management', 29),
('Advocacy', 38),
('Advocacy', 39),
('Advocacy', 41),
('Case Management', 42);


INSERT INTO Transportation (ID) VALUES 

(25),
(30),
(46),
(63); 


INSERT INTO Mentors (ID) VALUES 

(37);


INSERT INTO Mentor_Type VALUES

('Professional', 37);



INSERT INTO Networks (ID) VALUES 

(58),
(59),
(60),
(61),
(62); 


INSERT INTO Net_Mem VALUES 

('Survivors', 58),
('Survivors', 59);


INSERT INTO Net_Sub VALUES

('Partner', 59),
('Sex Trafficking', 61),
('Sex Trafficking', 62);


INSERT INTO For_Children (ID) VALUES 

(64);


INSERT INTO For_Child VALUES 

('Sexual Abuse', 64),
('Physical Abuse', 64),
('Therapy', 64),
('Forensic Evaluations', 64),
('Interviewing', 64);
