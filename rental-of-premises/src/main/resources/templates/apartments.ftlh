<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
    <title>APARTMENTS</title>
    <style>
        *{
            margin: 0 auto;
            padding: 0;

        }
        body{
            background-color: #F6F6F6;
            color: #8785A2;
            font-size: 25px;
        }
        .head{
            background-color: #FFC7C7;
            display: flex;
            align-content: space-around;
            align-items: center;
        }
        .nav-user{
            padding: 10px;
            margin: 10px;
            display: flex;
            align-content: space-around;
            align-items: center;
        }
        .main-block{
            border: 1px black solid;
            display: flex;
            flex-direction: column;
            align-content: center;
            margin: 10px;
            padding: 10px;
        }
        .one-block{
            padding: 10px;
            margin: 10px;
        }
        .two-block{
            padding: 10px;
            margin: 10px;
            display: flex;
            align-content: space-around;
            flex-wrap: wrap;
        }
        .block{
            padding:5px;
            margin: 5px;
            background-color: #FFE2E2;
            border: solid 1px #8785A2;
            border-radius:20px;
        }
        input{
            border: 1px solid #8785A2;
            border-radius: 10px;
            color: #8785A2;
            font-size: 15px;
            padding: 10px;
        }
        input:hover{
            background-color: #FFC7C7;
            font-size:18px;
            padding: 12px;
        }
    </style>
</head>
<body>

    <div class="head">
        <h2>rental of premises </h2>
    </div>

    <div class="nav-user">
        <#if user.email??>
            <h3>Имя пользователя: <i>${user.name}</i></h3>
            <form action="/logout" method="post">
                <input type="submit" value="Выйти"/>
            </form>
            <#if user.isAdmin()>
               <!-- <a href="/admin">Панель администратора</a> --!>
                <form action="/admin" method="get">
                    <input type="submit" value="Панель администратора">
                </form>
            </#if>

        <#else>
            <!--<a href="/login">Войти</a>--!>
            <form action="/login" method="get">
                <input type="submit" value="Войти">
            </form>
        </#if>



        <form action="/profile" method="get">
            <input type="submit" value="Профиль">
        </form>
    </div>

    <div class="main-block">
        <div class="one-block">
            <h4>Апартаменты по всей России</h4>

            <#if user.email??>
            <form action="/apartment/create" method="get">
                <input type="submit" value="Добавить апартаменты">
            </form>
            </#if>

            <form action="/" method="get">
                Поиск по названию апартаментов: <input type="text" name="title"><br>
                <input type="submit" value="Поиск">
            </form>
        </div>

        <div class="two-block">
            <#list apartments as apartment>
                <div class="block">
                    <p><b>${apartment.title}</b> ${apartment.price} руб. </p>
                    <!-- <p><a href="/apartment/${apartment.id}">Подробнее...</a></p>
                    <a href="/rents/new/${apartment.id}">Арендовать</a> --!>
                    <form action="/apartment/${apartment.id}" method="get">
                        <input type="submit" value="Подробнее">
                    </form>
                    <form action="/rents/new/${apartment.id}" method="get">
                        <input type="submit" value="Арендовать">
                    </form>
                </div>
            <#else>
                <h3>Апартаментов не имеется</h3>
            </#list>
        </div>

    </div>

</body>
</html>