# stdlib
import os

# third party
from flask import Flask
from flask_mako import MakoTemplates

# application

app = Flask(__name__)  # pylint: disable=invalid-name


def configure_app(mode='debug'):
    MakoTemplates(app)

    debug = mode == 'debug'
    if debug:
        app.env = 'development'


# TODO: should we respect the flask 'ENV' value here instead?
# http://flask.pocoo.org/docs/1.0/config/#builtin-configuration-values
if 'CONFIG_MODE' in os.environ:
    configure_app(os.environ['CONFIG_MODE'])


# Intentional circular import required by Flask
# For more info, read here: http://flask.pocoo.org/docs/1.0/patterns/packages/
import bob.views
