from app import db
class User(db.Model):
    username = db.Column(db.String(20), nullable = False, unique=True, primary_key=True)
    email = db.Column(db.String(30), nullable = False)
    password = db.Column(db.String(25), nullable = False)
    name = db.Column(db.String(20), nullable = False)

    def __init__(self, username, email, password, name):
        self.username = username
        self.email = email
        self.password = password
        self.name = name

    def __repr__(self):
        return '<User %r>' % self.username
