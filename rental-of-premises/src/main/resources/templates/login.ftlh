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
    </div>
    <hr>
    <div class="main-block">
        <h4>Авторизация</h4>
        <form action="/login" method="post">
            Эл. почта: <input type="email" name="username"><br><br>
            Пароль: <input type="password" name="password"><br><br>
            <input type="submit" value="Вход"/>
        </form>
        <form action="/registration" method="get">
            <input type="submit" value="Зарегистрироваться"/>
        </form>

        <form action="/" method="get"><br>
            <input type="submit" value="На главную страницу"/>
        </form><br>
    </div>

</body>
</html>
