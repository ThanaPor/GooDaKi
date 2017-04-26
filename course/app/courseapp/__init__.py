# #!/usr/bin/env python3

from flask import Flask, jsonify, request
import psycopg2

app = Flask(__name__)
app.config.from_object(__name__)
db = psycopg2.connect(host="course-db", database="goodaki", user="goodaki", password="goodaki")

import courseapp.controller as controller
import courseapp.model as model

@app.route('/')
def hello():
    return "Hello, This is GooDaKi course app"

@app.route('/api/demo')
def api_demo_get():
    return jsonify(dict(success=True, msg='reply message'))

@app.route('/api/demo_post', methods=["POST"])
def api_demo_post():
    json = request.get_json()
    return jsonify(json)
