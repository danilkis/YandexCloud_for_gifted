import re
from datetime import datetime

from bottle import route, run, template, static_file, request
@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')

@route('/')
def home():
    message = " "
    return template('home',message=message)


@route('/css/<filename>')
def server_static(filename):
    return static_file(filename, root='./css')

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
    result = (num1 * 128) * num2
    return template('dbcalc', result=str(result))
@route('/docs')
def docs():
    return template('docs')
# Run the web application
@route('/', method='post')
def my_form():
    message = " "
    # Получение полей ввода из формы
    mail = request.forms.get('email')
    name = request.forms.get('name')

    # Проверка совпадения почты с паттерном
    mail_check = re.match(r"[^@]+@[^@]+\.[^@]+", mail)

    # Вывод ошибки при несовпадении
    if not mail_check:
        message = "Неверный email. Попробуйте еще раз"

    # Вывод ошибки при не заполненных полях
    if not name or not mail:
        message = "Введите имя и почту!"

    # Return a message with the user's name, email, and date
    if mail and name and mail_check:
        message = f"Спасибо, {name}! Новости будут приходить на {mail}"

    # Вывод страницы с сообщением
    return template('home.tpl', message=message)
if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True)
