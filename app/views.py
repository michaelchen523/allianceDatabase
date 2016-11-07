from app import app, mysql
from flask import render_template, request, url_for, redirect, flash, session

@app.route('/')
def index():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        return redirect('home')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = mysql.connection
        cursor = conn.cursor()

        cursor.execute("SELECT Username, Name FROM USER WHERE Username='" + username + "' AND PASSWORD='" + password + "';")

        data = cursor.fetchall()
        if len(data) > 0:
            session['logged_in'] = True
            session['user'] = username
            session['name'] = data[0][1]

            cursor2 = conn.cursor()
            cursor2.execute("SELECT * FROM Category_Names;")
            session['categories'] = cursor2.fetchall()

            return redirect(url_for('home'))
    return render_template("login.html")

@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    return redirect('login')


@app.route('/home')
def home():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        name = session.get('name')

        categories = session.get('categories')

        return render_template('home.html', title='home', user=user,
                                categories=categories, name=name)

@app.route('/edit_user', methods = ['GET', 'POST'])
def edit_user():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        categories = session.get('categories')
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM USER WHERE Username='" + user + "';")
        userdata = cursor.fetchall()
        cursor2 = conn.cursor()
        cursor2.execute("SELECT Name FROM RESOURCE WHERE Creator_Username='" + user + "';")
        userresource = cursor2.fetchall()
        if request.method == 'POST':
            orgName = request.form['orgName']
            orgPhone = request.form['orgPhone']
            orgDescription = request.form['orgDescription']

            cursor.execute("UPDATE Users SET Organization = '" + orgName + "', Phone = '" + orgPhone +
                           "', Description = '" + orgDescription + "' WHERE Username = '" + user + "';")
            return redirect(url_for('edit_user'))

        return render_template('edit_user.html', title = 'edit profile', user = user,
                               categories = categories, userdata = userdata, userresource = userresource)

@app.route('/search/<ctgry>/', methods=["GET"])
def search(ctgry):
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        categories = session.get('categories')

        conn = mysql.connection
        cursor = conn.cursor()

        cursor.execute("""
        SELECT rev.rating,
               resource.name,
               resource.description
        FROM (
                SELECT res.Name AS name,
                       res.Description AS description,
                       res.ID AS ID
                FROM Resource AS res
                JOIN (
                        SELECT *
                        FROM Categories
                        WHERE Name = %s
                    ) category
                ON  category.ID = res.ID
            ) resource
        JOIN (
                SELECT ID, AVG(Rating) AS rating
                FROM Reviews
                GROUP BY ID
            ) rev

        ON rev.ID = resource.ID

        ORDER BY rev.rating;
        """, (ctgry, ))

        resources = cursor.fetchall()
        print len(resources)
        print resources

        return render_template('search.html', resources=resources, categories=categories)

@app.route('/resource_detail')
def resource_detail():
    if not session.get('logged_in'):
        return redirect('login')
    else:
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
    if not session.get('logged_in'):
        return redirect('login')
    else:
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
    if not session.get('logged_in'):
        return redirect('login')
    else:
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
    if not session.get('logged_in'):
        return redirect('login')
    else:
        resource = None
        user = session.get('user')
        conn = mysql.connection
        if 'resource' in request.args:
            resourceName = request.args['resource']
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Resource WHERE Name = '" + resourceName + "';")
            resource = cursor.fetchall()
        if request.method == 'POST':
            resourceName = request.form['resourceName']
            resourcePhone = request.form['resourcePhone']
            resourceStreet = request.form['resourceStreet']
            resourceCity = request.form['resourceCity']
            resourceState = request.form['resourceState']
            resourceZip = request.form['resourceZip']
            resourceDescription = request.form['resourceDescription']
            if resource != None:
                cursor2 = conn.cursor()
                cursor2.execute("UPDATE Resource SET Name = '" + resourceName + "', Address_State = '" + resourceState
                                 + "', Address_City = '" + resourceCity + "', Address_Zip = '" + resourceZip + "', Address_Street = '"
                                 + resourceStreet + "', Description = '" + resourceDescription + "' WHERE Username = '" +
                                 user + "';")
                return redirect(url_for('edit_user'))
            else:
                cursor3 = conn.cursor()
                cursor3.execute("INSERT INTO Resource (Name, Username, Address_State, Address_City, Address_Zip, Address_Street, Description) VALUES (" +
                                resourceName + ", " + user + ", " + resourceState + ", " + resourceCity + ", " + resourceZip
                                + ", " + resourceStreet + ", " + resourceDescription + ");")
                return redirect(url_for('edit_user'))
        categories = session.get('categories')
        return render_template('edit_add_resource.html', title = "Edit Resource", user = user,
                               categories = categories, resource = resource)
