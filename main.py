from bottle import Bottle, run, request
import sqlite3

app = Bottle()

@app.route('/hola', method='GET')
def get_list_games():
    return "<h1>Hola Mundo</h1><br><h2>Esto el login</h2>"


run(app, host='0.0.0.0', port=3000, debug=True)