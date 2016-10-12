from app import app
from flask import render_template, request, url_for, redirect, flash



@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if registered_user is None:
            flash('Username or Password is invalid', 'error')
            return redirect(url_for('login'))

    return render_template('login.html', title='login', error=error)

@app.route('/home')
def home():
    return render_template('home.html', title='home')

@app.route('/edit_user')
def edit_user():
    return render_template('edit_user.html', title = 'profile')

@app.route('/search')
def search():
    return render_template('search.html', title='search')

@app.route('/resource_detail')
def resource_detail():
    return render_template('resource_detail.html', title='Resource Details')

@app.route('/organizations')
def organizations():
    return render_template('organizations.html', title='Organizations')

@app.route('/user_detail')
def user_detail():
    return render_template('user_detail.html', title='User Details')

@app.route('/edit_add_resource')
def edit_add_resource():
    return render_template('edit_add_resource.html', title = "Edit Resource")

