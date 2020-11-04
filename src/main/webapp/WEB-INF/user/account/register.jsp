
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script src="/js/register.js"></script>
    </head>
    <body>
    <form action="#" method="POST">
        <input type="text" id="Email" placeholder="이메일을 입력해주세요." autofocus>
        <input type="text" id="Name" placeholder="이름을 입력해주세요.">
        <input type="password" id="Password" placeholder="비밀번호를 입력해주세요.">
        <input type="password" id="PasswordCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
        <input type="text" id="phone" placeholder="전화번호를 입력해주세요.">
        <input type="submit">
    </form>
    <li id="check"></li>
    </body>
</html>