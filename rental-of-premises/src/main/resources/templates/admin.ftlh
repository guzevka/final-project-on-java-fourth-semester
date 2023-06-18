<!DOCTYPE html>
<html>
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
    <hr>
    <h4>Панель администратора</h4>
    <table border="1">
    <tr>
        <th>Email</th>
        <th>Номер телефона</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
        <th>Редактирование</th>
        <th>Подробная информация</th>
    </tr>
    <#list users as user>
    <tr>
        <th>${user.email}</th>
        <th>${user.phoneNumber}</th>
        <th><#if user.active>true<#else>false</#if></th>
        <th><#list user.roles as role>${role}</#list></th>
        <th>
            <form action="/admin/user/ban/${user.id}" method="post">
                <input type="submit" value="Бан">
            </form>
        </th>
        <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
        <th><a href="/user/${user.id}">Подробная информация</a></th>
    </tr>
    <#else>
    <h3>Пользователей нет</h3>
    </#list>
</table>
<form action="/" method="get">
    <input type="submit" value="Вернуться назад"/>
</form><br>
</body>
</html>