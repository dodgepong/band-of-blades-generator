from flask_mako import render_template
from bob import app


@app.route('/', defaults={'path': ''}, endpoint='app_root')
@app.route('/<path:path>')
def catch_all(path):
    return render_template('index.mako')
