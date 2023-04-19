import re
from datetime import datetime

from bottle import route, run, template, static_file, request
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
    date = str(datetime.today().strftime("%Y-%m-%d"))
    # Return a message with the user's name, email, and date
    if mail and name and mail_check:
        message = f"Спасибо, {name}! Новости будут приходить на {mail}, Время обращения {date}"

    # Вывод страницы с сообщением
    return template('home.tpl', message=message)