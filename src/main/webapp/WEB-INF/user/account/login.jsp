<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>login-page</title>
    <script src="/js/functions.js"></script>
    <script src="/js/login.js"></script>
</head>
<body>
    <form action="/user/account/login" method="POST">
        <input type="text" id="email" name="email">
        <input type="password" id="password" name="password">
        <input type="submit">
    </form>
    <li id="check"></li>
</body>
</html>