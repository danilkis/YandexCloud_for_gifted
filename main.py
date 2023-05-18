import json
import bottle
import re
from bottle import route, run, template, static_file, request

# Функция для загрузки отзывов из файла JSON
def load_reviews():
    with open('reviews.json', 'r') as file:
        return json.load(file)

# Функция для сохранения отзывов в файл JSON
def save_reviews(reviews):
    with open('reviews.json', 'w') as file:
        json.dump(reviews, file, indent=4)

# Маршрут для обслуживания статических файлов
@route('/static/<filename:path>')
def send_static(filename):
    return static_file(filename, root='./static')

# Главная страница
@route('/')
def home():
    message = " "
    return template('home.tpl', message=message)

# Маршрут для обслуживания файлов CSS
@route('/css/<filename>')
def server_static(filename):
    return static_file(filename, root='./css')

# Проверка правильности формата ника с помощью регулярного выражения
def is_valid_nickname(nickname):
    return bool(re.match(r'^[a-zA-Z0-9_-]{3,16}$', nickname))

# Проверка правильности формата email с помощью регулярного выражения
def is_valid_email(email):
    pattern = r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'''
    return bool(re.match(pattern, email))
@route('/dbcalc')
def dbcalc():
    result = None
    # code to retrieve result from database goes here
    return template('dbcalc', result=result)
    return template('dbcalc')
@route('/dbcalc', method='POST')
def do_calculation():
    num1 = float(request.forms.get('num1'))
    num2 = float(request.forms.get('num2'))
    result = (num1 * 128) * num2
    return template('dbcalc', result=str(result))
# Маршрут для добавления нового отзыва (обработка POST-запроса)
@route('/add_review', method='POST')
def add_review():
    reviews = load_reviews()
    nickname = request.forms.get('nickname')
    email = request.forms.get('email')
    review = request.forms.get('review')

    # Проверяем правильность формата ника с помощью регулярного выражения
    if not is_valid_nickname(nickname):
        return template('reviews.tpl', reviews=reviews,
                        message="Неправильный формат. Длина от 3 до 16 символов и может содержать только буквы, цифры и _ -")

    # Проверяем правильность формата email с помощью регулярного выражения
    if not is_valid_email(email):
        return template('reviews.tpl', reviews=reviews,
                        message="Неверный формат почты")

    # Добавляем новый отзыв в список отзывов
    reviews.append({'nickname': nickname, 'email': email, 'content': review})
    save_reviews(reviews)
    return bottle.redirect('/reviews')

# Маршрут для отображения страницы с отзывами
@route('/reviews')
def reviews():
    message = ""
    reviews = load_reviews()
    return template('reviews', reviews=reviews, message=message)

# Маршрут для отображения страницы с документацией
@route('/docs')
def docs():
    return template('docs')
@route('/examples')
def docs():
    return template('examples')

# Запуск веб-приложения
if __name__ == '__main__':
    run(host='localhost', port=8080, debug=True)
