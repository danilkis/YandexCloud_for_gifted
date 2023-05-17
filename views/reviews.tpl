<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="/css/reviews.css">
  <title>Reviews</title>
</head>
<body>
    <div id="topbar">
        <img src="/static/logo.png" alt="Logo">
        <a href="/">Главная</a>
        <a href="/docs">Документация</a>
        <a href="/examples">Примеры</a>
        <a href="/dbcalc">Калькулятор RU</a>
        <a href="/reviews">Отзывы</a>
    </div>
    <header>
		<h1>Неофициальная документация Яндекс.Облака</h1>
	</header>
	<main>
  <h1>Reviews</h1>
  <ul>
    {% for review in reviews %}
      <li>
        <h2>{{ review.title }}</h2>
        <p>{{ review.body }}</p>
        <p>Rating: {{ review.rating }}</p>
      </li>
    {% endfor %}
  </ul>
  <form action="/add_review" method="post">
    <input type="text" name="title" placeholder="Title">
    <textarea name="body" rows="5" cols="50" placeholder="Body"></textarea>
    <input type="number" name="rating" placeholder="Rating">
    <input type="email" name="email" placeholder="Email">
    <input type="submit" value="Add Review">
  </form>
</body>
</html>