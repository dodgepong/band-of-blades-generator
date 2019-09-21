# stdlib
import sys

# application
from bob import app, configure_app

if __name__ == '__main__':

    mode = 'debug'
    if len(sys.argv) == 2:
        mode = sys.argv[1]

    if mode not in ('debug', 'prod'):
        print("Please specify either debug or prod for environment config")

    configure_app(mode)

    debug = True if mode == 'debug' else False
    app.run(debug=debug, host='0.0.0.0', port=5000)
