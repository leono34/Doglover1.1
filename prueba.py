from flask import Flask, render_template, flash, redirect, \
    url_for, session, request, logging
# Libreria que se conecta con MYSQL
from flask_mysqldb import MySQL
# Controles para el uso de formularios en Flask
from wtforms import Form, StringField, TextAreaField, \
    PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

app = Flask(__name__)
app.debug = True
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'mascotas'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

app.run(debug=True)
