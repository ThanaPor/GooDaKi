# #!/usr/bin/env python3

from flask import Flask, jsonify, request
from pymongo import MongoClient

app = Flask(__name__)
app.config.from_object(__name__)
client = MongoClient('chunk-db', 28001)

import chunkapp.controller as controller
import chunkapp.model as model

@app.route('/')
def hello():
    return "Hello, This is GooDaKi chunk app"

@app.route('/api/demo')
def api_demo_get():
    return jsonify(dict(success=True))

@app.route('/api/demo_post', methods=["POST"])
def api_demo_post():
    json = request.get_json()
    return jsonify(json)
