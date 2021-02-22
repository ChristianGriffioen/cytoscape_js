from flask import Flask, render_template, url_for

import random



app = Flask(__name__)

random.seed(0)
@app.route('/')
def home():
    return render_template('/index.html')

if __name__ == '__main__':
    app.run(debug=True)
