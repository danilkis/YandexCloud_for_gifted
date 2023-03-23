<!DOCTYPE html>
<html>
<head>
    <title>Примеры работы</title>
    <link rel="stylesheet" type="text/css" href="/css/examples.css">
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
		<h1>Примеры</h1>
	</header>
	<main>
	<div class="column">
		<h1>Примеры работы с Managed service for YDB</h1>
		<p>Примеры взяты с сайта</p>
		<p><a href="https://ydb.tech/ru/docs/reference/ydb-sdk/example/python/">Приложение на Python</a></p>
		<h3>Скачивание и запуск</h3>
		<p>Приведенный ниже сценарий запуска использует git и Python3. Предварительно должен быть установлен YDB Python SDK.
Создайте рабочую директорию и выполните в ней из командной строки команды клонирования репозитория с github.com и установки необходимых пакетов Python:</p>
		<code>git clone https://github.com/ydb-platform/ydb-python-sdk.git
python3 -m pip install iso8601</code>
		<p>Далее из этой же рабочей директории выполните команду запуска тестового приложения, которая будет отличаться в зависимости от того, к какой базе данных необходимо подключиться.</p>
		<p>Для соединения с развернутой локальной базой данных YDB по сценарию Docker в конфигурации по умолчанию выполните следующую команду:</p>
		<code>YDB_ANONYMOUS_CREDENTIALS=1 \
python3 ydb-python-sdk/examples/basic_example_v1/ -e grpc://localhost:2136 -d /local</code>
        <h3>Инициализация соединения с базой данных</h3>
        <p>Для взаимодействия с YDB создается экземпляр драйвера, клиента и сессии:
<li>Драйвер YDB отвечает за взаимодействие приложения и YDB на транспортном уровне. Драйвер должен существовать на всем протяжении жизненного цикла работы с YDB и должен быть инициализирован перед созданием клиента и сессии.
<li>Клиент YDB работает поверх драйвера YDB и отвечает за работу с сущностями и транзакциями.
<li>Сессия YDB содержит информацию о выполняемых транзакциях и подготовленных запросах и содержится в контексте клиента YDB.
<li>Фрагмент кода приложения для инициализации драйвера:</p>
<code id="Py_code">def run(endpoint, database, path):
    driver_config = ydb.DriverConfig(
        endpoint, database, credentials=ydb.construct_credentials_from_environ(),
        root_certificates=ydb.load_ydb_root_certificate(),
    )
    with ydb.Driver(driver_config) as driver:
        try:
            driver.wait(timeout=5)
        except TimeoutError:
            print("Connect failed to YDB")
            print("Last reported errors by discovery:")
            print(driver.discovery_debug_details())
            exit(1)</code>
            <p>Фрагмент кода приложения для создания сессии:</p>
		    <code id="Py_code2">session = driver.table_client.session().create()</code>
		<p>Больше примеров на сайте</p>
		<script src="https://cdn.rawgit.com/google/code-prettify/master/loader/run_prettify.js"></script>

  <script>
    // JavaScript code to highlight the Python code within the <code> element
    var code = document.getElementById('Py_code');
    code.innerHTML = code.innerHTML.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
    code.innerHTML = '<pre class="prettyprint lang-python">' + code.innerHTML + '</pre>';
    PR.prettyPrint();
  </script>
	</main>
</body>
</html>