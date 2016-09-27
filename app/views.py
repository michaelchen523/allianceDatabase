from app import app
from flask import render_template
@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

@app.route('/login')
def login():
    return render_template('login.html', title='login')
