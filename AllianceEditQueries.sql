/*
edit every attribute of a resource (including sub cat)
 */
UPDATE Resource
SET Name = '', Address_State = '', Address_City = '',       #new info
 Address_Zip = 123, Address_Street = '', Address_Number = 123,
 Website = '', Non_Citizen = 1, Documentation = 0, Eligibility = '',
 Description = ''
WHERE ID = 1; #ID of resource

UPDATE Phone_Numbers
SET Phone_Number = '1234'
WHERE ID = 1;

UPDATE Housing
SET Capacity = 4
WHERE ID = 1;

UPDATE Housing_Type#category name
SET Housing_Type = 'Group'#attribute names
WHERE ID = 1; #ID of resource


/*
editing a resource
 */
UPDATE Resource
SET Name = 'foobar', Creator_Username = 'SonikaF', Address_State = 'GA', Address_City = 'Atlanta', Address_Zip = 1234, #put data which is to be updated here
 Address_Street = 'Peachtree', Address_Number = '5', Website = null, Non_Citizen = 1, Documentation = 0,
 Eligibility = 'not you', Description = 'poop'
WHERE ID = 1; #Put ID of resource to edit here

UPDATE Phone_Numbers
SET Phone_Number = '1234'
WHERE ID = 1;

/*
Edit user
 */
UPDATE User
SET Email = 'foobar@gmail.com', Password = 'foobar', OrgName = 'idk'
WHERE Username = 'SonikaF'; #put username of user in here 
