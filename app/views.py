from app import app
from flask import render_template, request, url_for, redirect, flash
from .models import User


@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        registered_user = User.query.filter_by(username=username,password=password).first()
        if registered_user is None:
            flash('Username or Password is invalid', 'error')
            return redirect(url_for('login'))

    return render_template('login.html', title='login', error=error)

@app.route('/home')
def home():
    return render_template('home.html', title='home')



