from app import db
class User(db.Model):
    Username = db.Column(db.String(20), primary_key = True)
    Email = db.Column(db.String(30), nullable = False)
    Password = db.Column(db.String(25), nullable = False)
    Name = db.Column(db.String(20), nullable = False)

    def __init__(self, username, email, password, name):
        self.username = username
        self.email = email
        self.password = password
        self.name = name

    def __repr__(self):
        return '<User %r>' % self.username

class Organization(db.Model):
    Name = db.Column(db.String(20), primary_key = True)

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return '<Organization %r>' % self.name

class Resources(db.Model):
    AdminName = db.Column(db.String(20), nullable = False)
    Name = db.Column(db.String(20), )