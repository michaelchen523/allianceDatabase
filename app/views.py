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

        cursor.execute("SELECT Username FROM USER WHERE Username='" + username + "' AND PASSWORD='" + password + "';")

        data = cursor.fetchall()
        if len(data) > 0:
            session['logged_in'] = True
            session['user'] = username

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

@app.route('/searchName/<name>/', methods=["GET"])
def searchName(name):
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        categories = session.get('categories')

        conn = mysql.connection
        cursor = conn.cursor()

        cursor.execute("""
        SELECT rev.rating, res.name, res.description, res.Address_State AS State,
    res.Address_City AS City, res.Address_Zip AS Zip, res.Address_Street AS Street,
    res.Address_Number AS Num
FROM (
        SELECT *
        FROM Resource
        WHERE name = %s
    ) res
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS rating
        FROM Reviews
        GROUP BY ID
    ) rev

ORDER BY rev.rating DESC;
        """, (name, ))

        resources = cursor.fetchall()
        print resources

        return render_template('search.html', resources=resources, categories=categories, user=user)

@app.route('/search/<ctgry>/', methods=["GET"])
def search(ctgry):
    print ctgry
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        categories = session.get('categories')

        conn = mysql.connection
        cursor = conn.cursor()

        cursor.execute("""
        SELECT rev.rating, res.name, res.description, res.Address_State AS State,
    res.Address_City AS City, res.Address_Zip AS Zip, res.Address_Street AS Street,
    res.Address_Number AS Num
FROM (
        SELECT *
        FROM Resource
        NATURAL JOIN (
            SELECT ID
            FROM Categories
            WHERE Name = %s
            ) categories
    ) res
NATURAL LEFT JOIN (
        SELECT ID, AVG(Rating) AS rating
        FROM Reviews
        GROUP BY ID
    ) rev

ORDER BY rev.rating DESC;
        """, (ctgry, ))

        resources = cursor.fetchall()
        print resources

        return render_template('search.html', resources=resources, categories=categories, user=user)

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
        id=resource[0][12]
        cursor2 = conn.cursor()
        cursor2.execute("SELECT Phone_Number FROM Phone_Numbers WHERE ID = %s;", (id,))
        cursor3 = conn.cursor()
        cursor3.execute("SELECT * FROM User_Favorites WHERE Username = %s AND ID = %s;", (user, id, ))
        phones=cursor2.fetchall()
        isfav = cursor3.fetchall()
        if len(isfav) > 0:
            favorite = True
        else:
            favorite = False
        categories = session.get('categories')
        return render_template('resource_detail.html', title='resource details',
                               user = user, categories = categories, resource = resource, phones = phones, favorite = favorite)

@app.route('/deletefav/<resourceid>', methods=['GET'])
def deletefav(resourceid):
    user = session.get('user')
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("""DELETE FROM User_Favorites
WHERE Username = %s AND ID = %s;""", (user, resourceid, ))
    conn.commit()
    return redirect(url_for('favorites'))

@app.route('/addfav/<resourceid>', methods=['GET'])
def addfav(resourceid):
    user = session.get('user')
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("""INSERT INTO User_Favorites
    VALUES (%s, %s);""", (user, resourceid, ))
    conn.commit()
    return redirect(url_for('favorites'))

@app.route('/favorites')
def favorites():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        conn = mysql.connection
        cursor = conn.cursor()
        cursor.execute("""SELECT rev.avg_rating AS Rating, res.name AS Name, res.description AS Description, res.Address_State AS State,
    res.Address_City AS city, res.Address_Zip AS Zip, res.Address_Street AS Street, res.Address_Number AS Num
FROM (
    SELECT *
    FROM (
        SELECT ID
        FROM User_Favorites
        WHERE Username = %s
        ) favs
    NATURAL JOIN Resource
    ) res
NATURAL LEFT JOIN (
    SELECT ID, AVG(Rating) AS avg_rating
    FROM Reviews
    GROUP BY ID
    ) rev
ORDER BY rev.avg_rating DESC;""", (user, ))
        resources = cursor.fetchall()
        categories = session.get('categories')
        return render_template('search.html', resources=resources, categories=categories, user=user, favorites = True)

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
        cursor3.execute("SELECT Name FROM Resource WHERE Creator_Username = '" + name + "';")
        resources = cursor3.fetchall()
        return render_template('user_detail.html', title='User Details', user = user,
                               orgdata = orgdata, detailorg = detailorg, categories = categories, resources = resources)

@app.route('/editresource<name>')
def editresource(name):
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        conn = mysql.connection
        resourceName = name
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
            cursor2 = conn.cursor()
            cursor2.execute("UPDATE Resource SET Name = '" + resourceName + "', Address_State = '" + resourceState
                            + "', Address_City = '" + resourceCity + "', Address_Zip = '" + resourceZip + "', Address_Street = '"
                            + resourceStreet + "', Description = '" + resourceDescription + "' WHERE Username = '" +
                            user + "';")
            return redirect(url_for('edit_user'))
    categories = session.get('categories')
    return render_template('edit_add_resource.html', title = "Edit Resource", user = user,
                           categories = categories, resource = resource)

@app.route('/addresource')
def addresource():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        conn = mysql.connection
        cursor = conn.cursor()
        if request.method == 'POST':
            resourceName = request.form['resourceName']
            resourcePhone = request.form['resourcePhone']
            resourceStreet = request.form['resourceStreet']
            resourceCity = request.form['resourceCity']
            resourceState = request.form['resourceState']
            resourceZip = request.form['resourceZip']
            resourceDescription = request.form['resourceDescription']
            cursor3 = conn.cursor()
            cursor3.execute("INSERT INTO Resource (Name, Username, Address_State, Address_City, Address_Zip, Address_Street, Description) VALUES (" +
                            resourceName + ", " + user + ", " + resourceState + ", " + resourceCity + ", " + resourceZip
                            + ", " + resourceStreet + ", " + resourceDescription + ");")
            return redirect(url_for('edit_user'))
    categories = session.get('categories')
    return render_template('edit_add_resource.html', title = "Add Resource", user = user,
                           categories = categories)


