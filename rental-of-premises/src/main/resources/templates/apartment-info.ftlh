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
    <div class="main-block">
        <h4>Подробная информация об апартаментах</h4>
        <b>Название апартаментов: </b>${apartment.title}<br>
        <b>Описание апартаментов: </b>${apartment.description}<br>
        <b>Страна апартаментов: </b>${apartment.country}<br>
        <b>Город апартаментов: </b>${apartment.city}<br>
        <b>Адрес апартаментов: </b>${apartment.address}<br>
        <b>Цена: </b>${apartment.price}<br>
        <b>Владелец: </b> <a href="/user/${apartment.user.id}"> ${apartment.user.name}</a><br>
        <hr>
        <form action="/" method="get">
            <input type="submit" value="Вернуться назад"/>
        </form><br>

        <form action="/apartment/delete/${apartment.id}" method="post">
            <input type="submit" value="Удалить апартаменты"/>
        </form>
    </div>

</body>
</html>