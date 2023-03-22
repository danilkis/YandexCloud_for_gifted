<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <style>
        /* Top bar styles */
        #topbar {
          background-color: #333;
          color: white;
          display: flex;
          align-items: center;
          justify-content: space-between;
          padding: 10px;
        }

        #topbar img {
          max-height: 50px;
        }

        #topbar a {
          color: white;
          margin-left: 20px;
          text-decoration: none;
        }

        #topbar a:hover {
          text-decoration: underline;
        }

        /* Body styles */
        body {
          margin: 0;
          padding: 0;
          font-family: sans-serif;
        }

        h1 {
          margin-top: 50px;
          text-align: center;
          font-size: 36px;
        }

        p {
          text-align: center;
          font-size: 24px;
        }
        .column {
    float: left;
    width: 50%;
}
.monkey {
  height: 70px;
  width: 100px;
  -o-object-fit: contain;
}
    </style>
</head>
<body>
    <div id="topbar">
        <img src="/static/logo.png" alt="Logo">
        <a href="/">Главная</a>
        <a href="/docs">Документация</a>
        <a href="/examples">Примеры</a>
        <a href="/dbcalc">Калькулятор RU</a>
    </div>
    <header>
		<h1>Неофициальная документация Яндекс.Облака</h1>
	</header>
	<main>
	<div class="column">
		<p>Добро пожаловать на сайт неофициальной документации Яндекс.Облака! Здесь вы найдете информацию о том, как использовать облачные технологии Яндекса для хранения, обработки и доставки данных.</p>
		<p>На сайте вы найдете руководства по работе с сервисами Яндекс.Облака, а также примеры использования API и инструкции по настройке среды разработки.</p>
		<p>Наша документация создана сообществом разработчиков и не имеет прямого отношения к Яндексу. Мы стремимся обеспечить максимально полезную и актуальную информацию, поэтому будем благодарны за любую обратную связь и помощь в ее поддержании.</p>
		<p>Следите за обновлениями нашей документации, подписывайтесь на нашу рассылку и присоединяйтесь к нашему сообществу в социальных сетях, чтобы быть в курсе последних новостей и возможностей Яндекс.Облака.</p>
		<p>С уважением, команда неофициальной документации Яндекс.Облака.</p>
		<p><a href="https://cloud.yandex.ru/?utm_source=yandex-s&utm_medium=cpc&utm_campaign=Search_RU_Other_All_LGEN_Brand_cloud|82141964&utm_content=5113133439|&utm_term=yandex%20cloud|13318865489&etext=2202.GPls7HIC0SmydgWOvOe2bsB4AA1AKeY3Aiw-rmUVbz1hdHFuZnpyenpqbmVqdWd0.e774e118083ae685c9fe3323c92a5133561040a9&yclid=1254417644232968257">Официальная документация</a></p>
	</div>
	<div class="column">
        <figure>
            <div class="monkey"><img src="/static/monkey.jpg" alt="documentation_process"></div>
            <figcaption>Существует теория о бесконечных обезъянах. Если посадить бесконечное количесво обезьян за бесконечное количество печатных машинок, рано или поздно они напишут документацию Я.Облака</figcaption>
        </figure>
    </div>
	</main>
</body>
</html>