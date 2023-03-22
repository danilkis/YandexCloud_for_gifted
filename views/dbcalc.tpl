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
        h2 {
          margin-top: 50px;
          text-align: center;
          font-size: 28px;
        }
        h3 {
          margin-top: 10px;
          text-align: center;
          font-size: 20px;
        }
        p {
          text-align: center;
          font-size: 24px;
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
		<h1>Калькулятор Request Units</h1>
	</header>
	<main>
	<p>Тарификация операций с данными в топиках YDB с использованием Request Units YDB применяется для топиков, использующих режим тарификации по фактическому использованию (On-demand). В этом режиме по умолчанию создаются топики через YDB CLI/SDK, а также при создании потока CDC.

Если топик создается как хранилище для потока данных Data Streams, он по умолчанию получает режим тарификации по выделенным ресурсам. Для находящихся в режиме по выделенным ресурсам топиков начисление Request Units YDB не производится, оплата делается на почасовой основе в рамках сервиса Yandex Data Streams.

Смена режима тарификации может быть произведена для любого топика явно вызовом команды YDB CLI ydb topic alter или метода SDK.

</p>
	<form action="/dbcalc" method="post">
            <input name="num1" type="text" />
            <input name="num2" type="text" />
            <input type="submit" value="Calculate" />
        </form>
        <div id="result">
                <p>Result: {{result}}</p>
        </div>
	</main>
</body>
</html>