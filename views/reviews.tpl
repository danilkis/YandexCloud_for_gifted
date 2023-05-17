<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="/css/reviews.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <title>Reviews</title>
</head>
<body>
     <div class="back-button">
        <a href="/"><i class="fas fa-angle-left"></i>Назад</a>
    </div>

     <h1>Отзывы</h1>

    <div id="reviews">
        % for review in reviews:
            <div class="review-card">
                <h3>{{ review['nickname'] }}</h3>
                <p>{{ review['email'] }}</p>
                <p>{{ review['content'] }}</p>
            </div>
        % end
    </div>

    <h2>Написать отзыв</h2>
    <div class="message">{{ message }}</div>
    <div class="form-container">
        <form action="/add_review" method="post">
            <label for="nickname">Никнейм</label>
            <input type="text" id="nickname" name="nickname" required><br>

            <label for="email">Email</label>
            <input type="text" id="email" name="email" required><br>

            <label for="review">Отзыв</label>
            <input type="text" id="review" name="review" required><br>

            <input type="submit" value="Отправить">
        </form>
    </div>
</body>
</html>