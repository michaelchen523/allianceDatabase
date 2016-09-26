from flask import (
    Flask,
    render_template
)

from flask_sqlalchemy import SQLAlchemy

#Create the app!
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:soccer523@localhost:3306/alliance'
db = SQLAlchemy(app)

class User(db.Model):
    username = db.Column(db.String(20), nullable = False, unique=True, primary_key=True)
    email = db.Column(db.String(30), nullable = False)
    password = db.Column(db.String(20), nullable = False)
    name = db.Column(db.String(20), nullable = False)

    def __init__(self, username, email, password, name):
        self.username = username
        self.email = email
        self.password = password
        self.name = name

    def __repr__(self):
        return '<User %r>' % self.username

app.config.update(
    DEBUG = True
)


@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

if __name__ == "__main__":
    app.run()
