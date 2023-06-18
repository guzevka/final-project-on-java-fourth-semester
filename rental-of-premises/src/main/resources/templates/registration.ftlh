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
        .main-block{
            padding: 15px;
            margin: 15px;
            display: flex;
            flex-direction: column;
            align-items: center;
            align-content: center;
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
    </div><hr>
    <div class="main-block">
        <h4>Регистрация</h4>
        <form action="/registration" method="post">
            Имя пользователя: <input type="text" name="name"><br><br>
            Эл. почта: <input type="email" name="email"><br><br>
            Номер телефона: <input type="text" name="phoneNumber"><br><br>
            Пароль: <input type="password" name="password"><br><br>
            <input type="submit" value="Зарегистрироваться"/>
        </form>
        <#if errorMessage??>
            <h2 style="color: red">${errorMessage}</h2>
        </#if>
        <form action="/" method="get"><br>
            <input type="submit" value="На главную страницу"/>
        </form><br>
    </div>

</body>
</html>