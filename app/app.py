from flask import Flask, send_from_directory
import os
app = Flask(__name__, static_folder='static')

@app.route('/')
def index():
    # serve index.html from repo root or static/
    if os.path.exists('index.html'):
        return send_from_directory('.', 'index.html')
    return send_from_directory('static', 'index.html')

@app.route('/<path:path>')
def static_proxy(path):
    # serve other assets
    if os.path.exists(path):
        return send_from_directory('.', path)
    return send_from_directory('static', path)

# gunicorn runs: app:app
