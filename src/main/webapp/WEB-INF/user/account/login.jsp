<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>login-page</title>
    <link rel="stylesheet" href="/css/login.css">
    <script src="/js/login.js"></script>
</head>
<body>
    <form action="/user/account/login" method="POST">
        <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." autocomplete="off">
        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
        <input type="submit" value="Sign in">
    </form>
</body>
</html>