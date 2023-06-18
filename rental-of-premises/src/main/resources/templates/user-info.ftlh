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
        <h3>Подробная информация о пользователе ${user.name}</h3>
        <b>Почта пользователя: </b> ${user.email} <br>
        <b>Номер телефона пользователя: </b> ${user.phoneNumber} <br>
        <h4>Апартаменты пользователя ${user.name}</h4>
        <#list apartments as apartment>
            <div>
                <p><b>${apartment.title}</b> ${apartment.price} руб. </p>
                <form action="/apartment/${apartment.id}" method="get">
                    <input type="submit" value="Подробнее">
                </form>
            </div>
        <#else>
            <h3>Апартаментов не имеется</h3>
        </#list>
        <hr>
        <form action="/" method="get">
            <input type="submit" value="Вернуться назад"/>
        </form><br>
    </div>

</body>
</html>