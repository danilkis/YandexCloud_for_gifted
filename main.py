from bottle import route, run, template, static_file
@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')

@route('/')
def home():
    return template('home')

@route('/about')
def about():
    return template('about')

@route('/contact')
def contact():
    return template('contact')

@route('/docs')
def docs():
    return template('docs')

# Run the web application
if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True)
