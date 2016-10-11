from flask import Flask
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config.from_object('config')
app.secret_key= "secretKey1"

mysql = MySQL(app)

from app import views, models
