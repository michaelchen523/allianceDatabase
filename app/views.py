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

        cursor.execute("SELECT Username FROM User WHERE Username='" + username + "' AND Password='" + password + "';")

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
        conn = mysql.connection
        user = session.get('user')
        if request.method == 'POST':
            password = request.form['password']
            email = request.form['email']

            cursor3 = conn.cursor()
            cursor3.execute(
            """
            UPDATE User
            SET Email = %s, Password = %s
            WHERE Username = %s;
            """, (email, password, user)
            )
            conn.commit()
            return redirect('edit_user')
        else:
            categories = session.get('categories')
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM User WHERE Username='" + user + "';")
            userdata = cursor.fetchall()
            cursor2 = conn.cursor()
            cursor2.execute("SELECT Name, ID FROM Resource WHERE Creator_Username='" + user + "';")
            userresource = cursor2.fetchall()
            return render_template('edit_user.html', title = 'edit profile', user = user,
                                   categories = categories, userdata = userdata, userresource = userresource)

@app.route('/searchName/<name>/', methods=["GET", "POST"])
def searchName(name):
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        categories = session.get('categories')

        conn = mysql.connection
        cursor = conn.cursor()
        name = "%" + name + "%"
        cursor.execute("""
        SELECT rev.rating, res.name, res.description, res.Address_State AS State,
    res.Address_City AS City, res.Address_Zip AS Zip, res.Address_Street AS Street,
    res.Address_Number AS Num
FROM (
        SELECT *
        FROM Resource
        WHERE name LIKE %s
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
        cursor.execute("SELECT * FROM Resource WHERE Name = '" + resourcename + "';")
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



@app.route('/editresource<name>', methods=['GET', 'POST'])
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
        id=resource[0][12]
        cursor2 = conn.cursor()
        cursor2.execute("SELECT Phone_Number FROM Phone_Numbers WHERE ID = %s;", (id,))
        phones = cursor2.fetchall()
        cursor3 = conn.cursor()
        cursor3.execute("SELECT Name FROM Categories WHERE ID = %s;", (id,))
        resource_categories = cursor3.fetchall()
        for category in resource_categories:
            if category == 'Childcare':
                pass
            elif category == 'Education':
                pass
            elif category == 'Employment':
                pass
            elif category == 'For_Children':
                pass
            elif category == 'Housing':
                pass
            elif category == 'Job_Readiness':
                pass
            elif category == 'Legal':
                pass
            elif category == 'Life_Skills':
                pass
            elif category == 'Medical':
                pass
            elif category == 'Mental_Health':
                pass
            elif category == 'Mentors':
                pass
            elif category == 'Networks':
                pass
            elif category == 'Supplies':
                pass
            elif category == 'Transportation':
                pass
            elif category == 'Vehicle':
                pass

        if request.method == 'POST':
            resourceName = request.form['resourceName']
            resourcePhone = request.form['resourcePhone']
            resourceStreet = request.form['resourceStreet']
            resourceCity = request.form['resourceCity']
            resourceState = request.form['resourceState']
            resourceZip = request.form['resourceZip']
            resourceDescription = request.form['resourceDescription']
            requestCategories = request.form.getlist('check')

            if 'Childcare' in request.args:
                cminage = request.form['childcare-min-age']
                cmaxage = request.form['childcare-max-age']
                cmincost = request.form['childcare-min-cost']
                cmaxcost = request.form['childcare-max-cost']
                ctype = request.form['childcare-type']

                cursor4 = conn.cursor()
                cursor4.execute("SELECT * FROM Childcare WHERE ID = %s", (id))
                chilcareCheck = cursor4.fetchall()

                if len(childcareCheck) > 0:
                    #update
                    cursor4.execute("UPDATE Childcare SET AgeMax = %s, AgeMin = %s, CostMax = %s, CostMin = %s WHERE ID = %s;", (cmaxage, cminage, cmaxcost, cmincost, id))
                    conn.commit()

                    cursor4.execute("SELECT * FROM Childcare WHERE ID = %s", (id))
                    child_typecheck = cursor4().fetchall()

                    for y in child_typecheck:
                        if y not in ctype:
                            cursor4.execute("DELETE FROM Child_Type WHERE Child_Type = %s AND ID = %s", (y, id))
                            conn.commit()
                    for x in ctype:
                            if x not in child_typecheck:
                                cursor4.execute("INSERT INTO Child_Type VALUES (%s, %s)", (x, id))
                                conn.commit()

  
                else:
                    #create new
                    cursor4.execute("INSERT INTO Childcare (AgeMax, AgeMin, CostMax, CostMin, ID) VALUES (%s, %s,  %s, %s, %s);", (cmaxage, cminage, cmaxcost, cmincost, id))
                    conn.commit()

                    for x in ctype:
                        cursor4.execute("INSERT INTO Child_Type VALUES (%s, %s);", (x, id))
                        conn.commit()

            if 'Education' in request.args:
                emincost = request.form['education-min-cost']
                emaxcost = request.form['education-max-cost']
                eprereqs = request.form['education-prereqs']
                etype = request.form['education-type']

                cursor5 = conn.cursor()
                cursor5.execute("SELECT * FROM Education WHERE ID = %s", (id))
                educationCheck = cursor5.fetchall()

                if len(educationCheck) > 0:
                    #update
                    cursor5.execute("UPDATE Education SET CostMax = %s, CostMin = %s, Prerequisites = %s WHERE ID = %s;", (emaxcost, emincost, eprereqs, id))
                    conn.commit()

                    cursor5.execute("SELECT * FROM Education_Type WHERE ID = %s", (id))
                    edutypecheck = cursor5().fetchall()

                    for y in edutypecheck:
                        if y not in etype:
                            cursor5.execute("DELETE FROM Education_Type WHERE Education_Type = %s AND ID = %s", (y, id))
                            conn.commit()
                    for x in etype:
                            if x not in edutypecheck:
                                cursor5.execute("INSERT INTO Education_Type VALUES (%s, %s)", (x, id))
                                conn.commit()

                else:
                    #create new
                    cursor5.execute("INSERT INTO Education VALUES (%s, %s,  %s, %s);", (emaxcost, emincost, eprereqs, id))
                    conn.commit()

                    for x in etype:
                        cursor5.execute("INSERT INTO Education_Type VALUES (%s, %s);", (x, id))
                        conn.commit()

            if 'Employment' in request.args:
                eminsalary = request.form['employment-min-salary']
                emaxsalary = request.form['employment-max-salary']
                emptype = request.form['emp-type']
                empskills = request.form['emp-skills']
                empchildcare = request.form['childcare']

                cursor6 = conn.cursor()
                cursor6.execute("SELECT * FROM Employment WHERE ID = %s", (id))
                employmentcheck = cursor6.fetchall();

                if len(employmentcheck) > 0:
                    #update
                    cursor6.execute("UPDATE Employment SET SalaryMax = %s, SalaryMin = %s, Childcare = %s WHERE ID = %s;", (emaxsalary, eminsalary, empchildcare, id))
                    conn.commit()

                    cursor6.execute("SELECT * FROM Emp_Type WHERE ID = %s", (id))
                    emptypecheck = cursor6().fetchall();

                    for x in emptype:
                        if x not in emptypecheck:
                            cursor6.execute("INSERT INTO Emp_Type VALUES (%s, %s)", (x, id))
                            conn.commit()
                    for y in emptypecheck:
                        if y not in emptype:
                            cursor6.execute("DELETE FROM Emp_Type WHERE Emp_Type = %s AND ID = %s", (y, id))

                    cursor6.execute("SELECT * FROM Emp_Skills WHERE ID = %s", (id))
                    empskillcheck = cursor6().fetchall();

                    for x in empskills:
                        if x not in empskillcheck:
                            cursor6.execute("INSERT INTO Emp_Skills VALUES (%s, %s)", (x, id))
                            conn.commit()
                    for y in empskillcheck:
                        if y not in empskills:
                            cursor6.execute("DELETE FROM Emp_Skills WHERE Emp_Skills = %s AND ID = %s", (y, id))
  
                else:
                    #create new
                    cursor6.execute("INSERT INTO Employment VALUES (%s, %s,  %s, %s);", (emaxsalary, eminsalary, empchildcare, id))

                    for x in emptype:
                        cursor6.execute("INSERT INTO Emp_Type VALUES (%s, %s);", (x, id))

                    for y in empskills:
                        cursor6.execute("INSERT INTO Emp_Skills VALUES (%s, %s);", (y, id))

                conn.commit()

            if 'For_Children' in request.args:
                fcminage = request.form['for-children-min-age']
                fcmaxage = request.form['for-children-max-age']
                fctype = request.form['for-children-type']

                cursor7 = conn.cursor()
                cursor7.execute("SELECT * FROM For_Children WHERE ID = %s", (id))



            if 'Housing' in request.args:
                hcapacity = request.form['housing-capacity']
                hgender = request.form['housing-gender']
                hminage = request.form['housing-min-age']
                hmaxage = request.form['housing-max-age']
                htype = request.form['housing-type']
                hserves = request.form['housing-serves']
                hchildren = request.form['takesChildren']

            if 'Job_Readiness' in request.args:
                jrtraining = request.form['Training']
                jrcounseling = request.form['Counseling']

            if 'Legal' in request.args:
                legtype = request.form['legal-type']

            if 'Life_Skills' in request.args:
                lscostmin = request.form['life-skills-min-cost']
                lscostmax = request.form['life-skills-max-cost']
                lstype = request.form['life-skills-type']

            if 'Medical' in request.args:
                medinsurance = request.form['medical-insurance']
                medtype = request.form['medical-type']

            if 'Mental_Health' in request.args:
                mentalinsurance = request.form['mental-health-insurance']
                mentaltype = request.form['mental-type']

            if 'Mentors' in request.args:
                mentorcostmin = request.form['mentors-min-cost']
                mentorcostmax = request.form['mentors-max-cost']
                mentortype = request.form['mentor-type']

            if 'Networks' in request.args:
                netmale = request.form['Male']
                netfemale = request.form['Female']
                netall = request.form['All']
                netother = request.form['Other']
                netagemin = request.form['networks-min-age']
                netagemax = request.form['networks-max-age']
                netmem = request.form['network-members']
                netsub = request.form['network-subject']

            if 'Supplies' in request.args:
                supptype = request.form['supply-type']
                suppcostmin = request.form['supply-min-cost']
                suppcostmax = request.form['supply-max-cost']

            if 'Transportation' in request.args:
                transcostmin = request.form['transportation-min-cost']
                transcostmax = request.form['transportation-max-cost']
                transtype = request.form['transp-type']

            if 'Vehicle' in request.args:
                vehiclecostmin = request.form['vehicle-min-cost']
                vehiclecostmax = request.form['vehicle-max-cost']
                vehicletype = request.form['vehicle-type']



            return redirect(url_for('edit_user'))
    categories = session.get('categories')
    return render_template('edit_add_resource.html', title = "Edit Resource", user = user,
                           categories = categories, resource = resource, phones = phones)

@app.route('/addresource', methods = ['GET', 'POST'])
def addresource():
    if not session.get('logged_in'):
        return redirect('login')
    else:
        user = session.get('user')
        conn = mysql.connection
        cursor = conn.cursor()
        if request.method == 'POST':
            resourceName = request.form['resourceName']
            resourceState = request.form['resourceState']
            resourceCity = request.form['resourceCity']
            resourceZip = request.form['resourceZip']
            resourceStreet = request.form['resourceStreet']
            resourceWebsite = request.form['resourceWebsite']
            resourceDescription = request.form['resourceDescription']
            resourcePhone = request.form.getlist('resourcePhone')
            print(resourcePhone)
            streetsplit = resourceStreet.split(" ");
            streetNum = streetsplit[0]
            streetName = " ".join(map(str,streetsplit[1:]))
            resourceNonCitizen = 1
            resourceDocumentation = 1
            resourceEligibility = request.form['resourceEligibility']
            resourceCategories = request.form.getlist('checkedCategory')
            print(resourceCategories)
            cursor3 = conn.cursor()
            # still need to check that certain fields aren't null
            # still need to fix radio buttons
            # still need to do sub categories
            cursor3.execute("""INSERT INTO Resource (Name, Creator_Username, Address_State, Address_City,
                Address_Zip, Address_Street, Address_Number, Website, Non_Citizen, Documentation, Eligibility,
                Description) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);""", 
                (resourceName, user, resourceState, resourceCity, resourceZip, streetName, streetNum,
                    resourceWebsite, resourceNonCitizen, resourceDocumentation, resourceEligibility, resourceDescription,))
            conn.commit()
            cursor5 = conn.cursor()
            cursor5.execute("SELECT ID FROM Resource WHERE Name='" + resourceName + "';")
            ids = cursor5.fetchall()
            id = ids[0][0]
            cursor4 = conn.cursor()
            cursor6 = conn.cursor()
            for phone in resourcePhone:
                cursor4.execute(""" INSERT INTO Phone_Numbers
                VALUES (%s, 'Cell', %s)""", (phone, id,))
                conn.commit()
            for category in resourceCategories:
                print(category)
                cursor6.execute("""INSERT INTO Categories
                VALUES (%s, %s);""", (category, id,))
                conn.commit()
            return redirect(url_for('edit_user'))
    categories = session.get('categories')
    return render_template('edit_add_resource.html', title = "Add Resource", user = user,
                           categories = categories)

@app.route('/deleteresource<id>', methods=['GET'])
def deleteresource(id):
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Resource WHERE ID = %s;", (id,))
    conn.commit()
    return redirect(url_for('edit_user'))