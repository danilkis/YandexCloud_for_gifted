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
    questions = request.forms.get('questions')

    # Проверка совпадения почты с паттерном
    mail_check = re.match(r"[^@]+@[^@]+\.[^@]+", mail)
    # Вывод ошибки при несовпадении
    if not mail_check:
        message = "Неверный email. Попробуйте еще раз"
    elif not re.search(r'[a-zA-Z]', questions) or re.match(r'^\d+$', questions) or len(questions) < 4:
        message = "Введите корректный вопрос!"

    # Вывод ошибки при не заполненных полях
    elif not name or not mail:
        message = "Введите имя и почту!"
    else:
        date = str(datetime.today().strftime("%Y-%m-%d"))
        # Запись данных в файл JSON
        data = {"name": name, "mail": mail, "date": date, "question":questions}
        with open('data.json', 'r') as file:
            lines = file.readlines()
            for line in lines:
                # Проверка на дубликаты почты и имени
                if json.loads(line)['mail'] == mail:
                    message = "Пользователь с такой почтой уже существует!"
                    break
            else:
                write_to_json(data)
                message = f"Спасибо, {name}! Ответ прийдет на {mail}, Время обращения {date}"
    # Вывод страницы с сообщением
    #pdb.set_trace()
    return template('home.tpl', message=message)