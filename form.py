import re
from datetime import datetime
import json
import pdb
from bottle import route, run, template, static_file, request

# Функция для записи данных в файл JSON
def write_to_json(data):
    with open('data.json', 'a') as file:
        json.dump(data, file)
        file.write('\n')

@route('/', method='post')
def my_form():
    # Получение полей ввода из формы
    mail = request.forms.get('email')
    name = request.forms.get('name')

    # Проверка совпадения почты с паттерном
    mail_check = re.match(r"[^@]+@[^@]+\.[^@]+", mail)
    # Вывод ошибки при несовпадении
    if not mail_check:
        message = "Неверный email. Попробуйте еще раз"

    # Вывод ошибки при не заполненных полях
    elif not name or not mail:
        message = "Введите имя и почту!"
    else:
        date = str(datetime.today().strftime("%Y-%m-%d"))
        # Запись данных в файл JSON
        data = {"name": name, "mail": mail, "date": date}
        with open('data.json', 'r') as file:
            lines = file.readlines()
            for line in lines:
                # Проверка на дубликаты почты и имени
                if json.loads(line)['mail'] == mail:
                    message = "Пользователь с такой почтой уже существует!"
                    break
            else:
                write_to_json(data)
                message = f"Спасибо, {name}! Новости будут приходить на {mail}, Время обращения {date}"
    # Вывод страницы с сообщением
    #pdb.set_trace()
    return template('home.tpl', message=message)