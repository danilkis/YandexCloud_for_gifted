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
      font-family: 'Roboto', sans-serif;
    }

    #topbar img {
      max-height: 50px;
    }

    #topbar a {
      color: white;
      margin-left: 20px;
      text-decoration: none;
      transition: all 0.3s ease-in-out;
    }

    #topbar a:hover {
      text-decoration: underline;
      opacity: 0.7;
    }

    /* Body styles */
    body {
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
    }

    h1 {
      margin-top: 50px;
      text-align: center;
      font-size: 36px;
    }

    p {
      text-align: justify;
      font-size: 24px;
      line-height: 1.5;
      margin: 20px;
      padding: 10px;
    }

    .column {
      float: left;
      width: 50%;
    }
    /* Form styles */
form {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 20px;
  padding: 20px;
}

input[type="text"],
input[type="submit"] {
  border: none;
  border-radius: 20px;
  padding: 10px 20px;
  margin: 5px;
  font-size: 24px;
  font-family: 'Roboto', sans-serif;
  border: 2px solid #ccc; /* add grey border to input fields */
}

input[type="submit"] {
  background-color: blue; /* make calculate button blue */
  color: white;
  transition: all 0.3s ease-in-out;
}

input[type="submit"]:hover {
  background-color: #0066cc; /* darken calculate button on hover */
  cursor: pointer;
}
#result {
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Roboto', sans-serif;
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
                <input name="num1" type="text" placeholder="Размер операции"/>
                <input name="num2" type="text" placeholder="Размер скопированных данных"/>
                <input type="submit" value="Calculate" />
            </form>
            <div id="result">
                    <p>Расход RU: {{result}}</p>
            </div>
    </main>
    </body>
    </html>