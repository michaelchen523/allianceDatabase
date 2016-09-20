from flask import (
    Flask,
    render_template
)

#Create the app!
app = Flask(__name__)

app.config.update(
    DEBUG = True
)

@app.route('/')
def index():
    return render_template('index.html', title = 'Alliance')

if __name__ == "__main__":
    app.run()
