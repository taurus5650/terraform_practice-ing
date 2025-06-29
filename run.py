import os

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return "<h1> AWS & Terraform Practice</h1>"


if __name__ == "__main__":
    debug_mode = os.getenv('FLASK_DEBUG', 'False').lower() == 'true'
    app.run(host="0.0.0.0", port=5002, debug=debug_mode)
