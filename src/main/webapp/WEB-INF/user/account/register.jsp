<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>register-page</title>
        <link rel="stylesheet" href="/css/register.css">
        <script src="/js/register.js"></script>
    </head>
    <body>
    <form action="/user/account/register" method="POST">
        <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요." autofocus="autofocus" autocomplete="off">
        <input type="text" id="name" name="name" placeholder="이름을 입력해주세요." autocomplete="off">
        <input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
        <input type="password" id="passwordCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
        <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요." autocomplete="off">
        <input type="submit">
    </form>
    </body>
</html>