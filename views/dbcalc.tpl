    <!DOCTYPE html>
    <html>
    <head>
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="/css/dbcalc.css">
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