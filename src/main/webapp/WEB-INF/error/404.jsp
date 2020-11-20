<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>404</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            text-align: center;
            background: #ededed;
        }

        h1{
            margin-top: 200px;
            font-size: 100px;
        }
        li{
            list-style: none;
            font-size: 40px;
            margin-bottom: 30px;
        }
        button{
            width: 130px;
            height: 50px;
            background: black;
        }
        button > a{
            background: inherit;
            display: block;
            color: white;
            text-decoration: none;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <h1>404</h1>
    <li>Page not found</li>
    <button><a href="/main">go to main</a></button>
</body>
</html>
