from app import app, mysql
from flask import render_template, request, url_for, redirect, flash



@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = mysql.connection
        cursor = conn.cursor()

        cursor.execute("SELECT Username FROM USER WHERE Username='" + username + "' AND PASSWORD='" + password + "';")

        data = cursor.fetchall()

        if len(data) > 0:
            return render_template("home.html")

        return render_template("login.html")




    return render_template('login.html', title='login')

@app.route('/home')
def home():
    return render_template('home.html', title='home')
