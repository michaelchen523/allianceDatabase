from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'AllianceDb'
app.config['MYSQL_HOST'] = 'localhost'

app.secret_key= "secretKey1"

mysql = MySQL(app)

from app import views
