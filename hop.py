#!/usr/bin/python3
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
@app.route('/home')
def index():
    return render_template("code.html")


@app.route('/about')
def about():
    return 'information on site'


@app.route('/user/<string:name>/<int:id>')
def user(name, id):
    return "Имя пользователя и id " + name + "-" + str(id)


if __name__ == "__main__":
    app.run(debug=True, host='localhost', port=7000)
