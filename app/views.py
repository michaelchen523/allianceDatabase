from app import app, mysql
from flask import render_template, request, url_for, redirect, flash, session

@app.route('/')
def index():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        return render_template('home.html', title = 'Alliance')

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
            session['logged_in'] = True
            session['user'] = username
            session['categories'] = [["Housing", "Housing Description"], ["Medical", "Medical Description"], ["Mental Health", "Mental Health Description"],
                                     ["Job Readiness", "Job Readiness Description"], ["Legal", "Legal Description"], ["Employment", "Employment Description"],
                                     ["Transportation", "Transportation Description"], ["Professional Mentors", "Professional Mentors Description"],
                                     ["Childcare", "Childcare Description"], ["Vehicle", "Vehicle Description"], ["Life Skills", "Life Skills Description"]
                                        , ["Survivor Network", "Survivor Network Description"]]
            '''conn = mysql.connection
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Categories;")
            session['categories'] = cursor.fetchall()'''

            return redirect(url_for('home'))
    return render_template("login.html")

@app.route('/home')
def home():
    user = session.get('user')
    categories = session.get('categories')
    return render_template('home.html', title='home', user = user, categories = categories)

@app.route('/edit_user', methods = ['GET', 'POST'])
def edit_user():
    user = session.get('user')
    categories = session.get('categories')
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM USER WHERE Username='" + user + "';")
    userdata = cursor.fetchall()
    cursor2 = conn.cursor()
    cursor2.execute("SELECT Name FROM RESOURCE WHERE Username='" + user + "';")
    userresource = cursor2.fetchall()
    if request.method == 'POST':
        orgName = request.form['orgName']
        orgPhone = request.form['orgPhone']
        orgDescription = request.form['orgDescription']

        '''cursor.execute("UPDATE Users SET Organization = '" + orgName + "', Phone = '" + orgPhone +
                       "', Description = '" + orgDescription + "' WHERE User = '" + user + "';")'''

    return render_template('edit_user.html', title = 'edit profile', user = user,
                           categories = categories, userdata = userdata, userresource = userresource)

@app.route('/search')
def search():
    searchcategory = None
    user = session.get('user')
    categories = session.get('categories')
    if 'searchcategory' in request.args:
        searchcategory = request.args['searchcategory']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM RESOURCE WHERE Category = '" + searchcategory + "';")
    return render_template('search.html', title='search', user = user,
                           categories = categories, searchcategory = searchcategory)

@app.route('/resource_detail')
def resource_detail():
    user = session.get('user')
    resourcename = request.args['resourcename']
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM RESOURCE WHERE Name = '" + resourcename + "';")
    resource = cursor.fetchall()
    categories = session.get('categories')
    return render_template('resource_detail.html', title='resource details',
                           user = user, categories = categories, resource = resource)

@app.route('/organizations')
def organizations():
    user = session.get('user')
    categories = session.get('categories')
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Organization;")
    orgdata = cursor.fetchall()
    return render_template('organizations.html', title='Organizations', user = user,
                           orgdata = orgdata, categories = categories)

@app.route('/user_detail')
def user_detail():
    user = session.get('user')
    categories = session.get('categories')
    detailorg = request.args['detailorg']
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Organization WHERE Name = '" + detailorg + "';")
    orgdata = cursor.fetchall()
    cursor2 = conn.cursor()
    cursor2.execute("SELECT Username FROM User WHERE Organization = '" + detailorg + "';")
    name = cursor2.fetchall()
    name = name[0][0]
    cursor3 = conn.cursor()
    cursor3.execute("SELECT Name FROM Resource WHERE Username = '" + name + "';")
    resources = cursor3.fetchall()
    return render_template('user_detail.html', title='User Details', user = user,
                           orgdata = orgdata, detailorg = detailorg, categories = categories, resources = resources)

@app.route('/edit_add_resource')
def edit_add_resource():
    resource = None
    user = session.get('user')
    if 'resource' in request.args:
        resourceName = request.args['resource']
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Resource WHERE Name = '" + resourceName + "';")
        resource = cursor.fetchall()
    categories = session.get('categories')
    return render_template('edit_add_resource.html', title = "Edit Resource", user = user,
                           categories = categories, resource = resource)
