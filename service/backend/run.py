import os

from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/')
def index():
    return "<h1> Index </h1>"


@app.route('/api/hello_world')
def hello_world():
    return jsonify({"message": "Terraform Practice 2025"}), 200


if __name__ == "__main__":
    debug_mode = os.getenv('FLASK_DEBUG', 'False').lower() == 'true'
    app.run(host="0.0.0.0", port=5002, debug=debug_mode)
