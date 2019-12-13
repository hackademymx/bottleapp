from bottle import Bottle, run, request

app = Bottle()

@app.route('/hola', method='GET')
@app.route('/', method='GET')
def hello():
    return "<h1>Hola Mundo</h1><br><h2></h2>"

@app.get('/hola/<name>')
def hello_name(name):
    return f'<h1>Hola mi nombre es: {name}</h1><br><h2>Saludos desde Hackademy</h2>'

if __name__ == "__main__":
    run(app, host='0.0.0.0', port=3000, reloader=True, debug=True)