from app import db

class Organization(db.Model):
    Name = db.Column(db.String(20), primary_key = True)

    def __init__(self, Name):
        self.Name = Name

    def __repr__(self):
        return '<Organization %r>' % self.Name

class User(db.Model):
    Username = db.Column(db.String(20), primary_key = True)
    Email = db.Column(db.String(30), nullable = False)
    Password = db.Column(db.String(25), nullable = False)
    Name = db.Column(db.String(20), nullable = False)
    Organization = db.Column(db.String(20), db.ForeignKey('Organization.Name'), nullable = False)

    def __init__(self, Username, Email, Password, Name, Organization):
        self.Username = Username
        self.Email = Email
        self.Password = Password
        self.Name = Name
        self.Organization = Organization

    def __repr__(self):
        return '<User %r>' % self.username

class Resources(db.Model):
    AdminName = db.Column(db.String(20), nullable = False)
    Name = db.Column(db.String(20), nullable = False)
    Username = db.Column(db.String(20), db.ForeignKey('User.Username'), nullable = False)
    Address_State = db.Column(db.String(2), nullable = False)
    Address_City = db.Column(db.String(20), nullable = False)
    Address_Zip = db.Column(db.Integer, nullable = False)
    Address_Street = db.Column(db.String(20), nullable = False)
    Address_Number = db.Column(db.Integer, nullable = False)
    Description = db.Column(db.Text)
    ID = db.Column(db.Integer, primary_key = True)
    __table_args__ = (db.UniqueConstraint('Name', 'Address_State',
                                       'Address_City', 'Address_Zip',
                                       'Address_Street', 'Address_Number',
                                       name = 'Unique_Address'),
                      )

    def __init__(self, AdminName, Name, Username, Address_State, Address_City,
                 Address_Zip, Address_Street, Address_Number, Description, ID):
        self.AdminName = AdminName
        self.Name = Name
        self.Username = Username
        self.Address_State = Address_State
        self.Address_City = Address_City
        self.Address_Zip = Address_Zip
        self.Address_Street = Address_Street
        self.Address_Number = Address_Number
        self.Description = Description
        self.ID = ID

    def __repr__(self):
        return  '<Resources %>' % self.Name

class User_Favorites(db.Model):
    Username = db.Column(db.String(20), db.ForeignKey('User.Username'), primary_key = True)
    ID = db.Column(db.Integer, db.ForeignKey('Resource.ID'), primary_key = True)

    def __init__(self, Username, ID):
        self.Username = Username
        self.ID = ID

    def __repr__(self):
        return '<User_Favorites %>' % self.Username

class Org_Favorites(db.Model):
    Organization = db.Column(db.String(20), db.ForeignKey('Organization.Name'), primary_key = True)
    ID = db.Column(db.Integer, db.ForeignKey('Resource.ID'), primary_key = True)

    def __init__(self, Organization, ID):
        self.Organization = Organization
        self.ID = ID

    def __repr__(self):
        return '<User_Favorites %>' % self.Organization

class Number(db.Model):
    PhoneNumber = db.Column(db.Integer, primary_key = True, autoincrement = False)
    Type = db.Column(db.String(20))
    Name = db.Column(db.String(20), db.ForeignKey('Resource.Name'), primary_key = True)

    def __init__(self, PhoneNumber, Type, Name):
        self.PhoneNumber = PhoneNumber
        self.Type = Type
        self.Name = Name

    def __repr__(self):
        return '<Number %>' % self.Name

class Reviews(db.Model):
    ID = db.Column(db.Integer, db.ForeignKey('Resource.ID'), primary_key = True)
    Username = db.Column(db.String(20), db.ForeignKey('User.Username'), primary_key = True)
    Score = db.Column(db.Integer, nullable = False)
    Description = db.Column(db.Text)

    def __init__(self, ID, Username, Score, Description):
        self.ID = ID
        self.Username = Username
        self.Score = Score
        self.Description = Description

    def __repr__(self):
        return  '<Reviews %>' % self.Usernameu