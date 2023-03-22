from bottle import route, run, template, static_file, request
@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')

@route('/')
def home():
    return template('home')

@route('/dbcalc')
def dbcalc():
    result = None
    # code to retrieve result from database goes here
    return template('dbcalc', result=result)
    return template('dbcalc')

@route('/examples')
def faq():
    return template('examples')
@route('/dbcalc', method='POST')
def do_calculation():
    num1 = float(request.forms.get('num1'))
    num2 = float(request.forms.get('num2'))
    result = num1 * num2
    return template('dbcalc', result=str(result))
@route('/docs')
def docs():
    return template('docs')
# Run the web application
if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True)
