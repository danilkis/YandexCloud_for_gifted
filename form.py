import re
from datetime import datetime
import json
import pdb
from bottle import route, run, template, static_file, request


def is_valid_email(email):
    pattern = r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'''
    return re.match(pattern, email) is not None
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

    # Вывод ошибки при несовпадении
    if not is_valid_email(mail):
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


