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
        <h4>Апартаменты по всей России</h4>
        <hr>
        <h3>Добавить новые апартаменты:</h3>
        <form action="/apartment/create" method="post" enctype="multipart/form-data">
            Название апартаментов: <input type="text" name="title"/><br><br>
            Описание апартаментов: <input type="text" name="description"/><br><br>
            Страна апартаментов: <input type="text" name="country"/><br><br>
            Город апартаментов: <input type="text" name="city"/><br><br>
            Адрес апартаментов: <input type="text" name="address"/><br><br>
            Цена: <input type="number" name="price"/><br><br>
            <input type="submit" value="Добавить апартаменты"/>
        </form>
        <form action="/" method="get">
            <input type="submit" value="Вернуться назад"/>
        </form>
    </div>

</body>
</html>