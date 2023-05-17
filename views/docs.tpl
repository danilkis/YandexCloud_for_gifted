<!DOCTYPE html>
<html>
<head>
    <title>Немного о YDB</title>
    <link rel="stylesheet" type="text/css" href="/css/docs.css">
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
		<h1>Основы YDB</h1>
	</header>
	<main>
	<h2>Serverless</h2>
	<p>Serverless — бессерверные вычисления, которые помогают разрабатывать приложения, хранить данные и настраивать интеграцию с другими платформами без создания виртуальных машин и обслуживания инфраструктуры.
Платформа Yandex Cloud предоставит отказоустойчивое и автоматически масштабируемое окружение для вашего кода и данных внутри экосистемы serverless, взяв на себя задачи по обслуживанию, обеспечению безопасности и непрерывной работы.</p>
		<h2>YDB</h2>
		<p>YDB — это распределенная отказоустойчивая Distributed SQL СУБД. YDB обеспечивает высокую доступность, горизонтальную масштабируемость, а также строгую консистентность и поддержку ACID-транзакций. Для запросов используется диалект SQL (YQL).</p>
		<p>Инфраструктура Yandex Cloud защищена в соответствии с Федеральным законом Российской Федерации «О персональных данных» № 152-ФЗ. </p>
            <h2>Термины</h2>
            <h3>Кластер</h3>
		<p>Кластер YDB — множество узлов YDB, между которыми распределяется нагрузка, коммуницирующих друг с другом через сеть. На одном кластере может обслуживаться множество баз данных, под каждую БД выделяются определенные узлы кластера. Одна БД целиком располагается на одном кластере.Кластер YDB может быть однодатацентровым или геораспределенным. Минимальный однадатацентровый кластер состоит из одного узла.</p>
		<h3>Регионы и зоны доступности</h3>
		<p>Зона доступности — центр обработки данных, или его изолированный сегмент, в пределах которого обеспечивается минимальное физическое расстояние между узлами, и минимизируются возможности сбоев одновременно с другими зонами доступности.
Широкий географический регион — территория, расстояние между зонами доступности в которой не превышает 500 км.

Геораспределенный кластер YDB содержит узлы, находящиеся в разных зонах доступности в пределах широкого географического региона. YDB осуществляет синхронную запись в каждую из зон доступности, обеспечивая полноценное продолжение работы при потере любой одной зоны доступности.

В геораспределенных кластерах существует возможность выбора политики распределения вычислительных ресурсов по датацентрам. Это позволяет балансировать между минимальным временем выполнения операций и минимальным временем простоя в случае выхода из строя одного из датацентров.

</p>
		<p><a href="https://cloud.yandex.ru/?utm_source=yandex-s&utm_medium=cpc&utm_campaign=Search_RU_Other_All_LGEN_Brand_cloud|82141964&utm_content=5113133439|&utm_term=yandex%20cloud|13318865489&etext=2202.GPls7HIC0SmydgWOvOe2bsB4AA1AKeY3Aiw-rmUVbz1hdHFuZnpyenpqbmVqdWd0.e774e118083ae685c9fe3323c92a5133561040a9&yclid=1254417644232968257">Официальная документация</a></p>
	</main>
</body>
</html>