<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="sunil.OracleConnection" %>
<%@ page import="java.util.Arrays" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>register-page</title>
        <script src="/js/functions.js"></script>
        <script src="/js/register.js"></script>
    </head>
    <body>
    <form action="#" method="POST">
        <input type="text" id="Email" name="Email" placeholder="이메일을 입력해주세요." autofocus>
        <input type="text" id="Name" name="Name" placeholder="이름을 입력해주세요.">
        <input type="password" id="Password" name="Password" placeholder="비밀번호를 입력해주세요.">
        <input type="password" id="PasswordCheck" placeholder="비밀번호를 한번 더 입력해주세요.">
        <input type="text" id="phone" name="Phone" placeholder="전화번호를 입력해주세요.">
        <input type="submit">
    </form>
    <li id="check"></li>
    </body>
</html>

<%
    String method = request.getMethod();

    if(method.equals("POST")) {
//        String email = request.getParameter("Email");
//        String name = request.getParameter("Name");
//        String pw = request.getParameter("Password");
//        String phone = request.getParameter("Phone");
//
//        OracleConnection oracleConn = new OracleConnection();
//        String[] arr = {email, name, pw, phone, "Noamal"};
//
//        oracleConn.setPstmt("INSERT INTO USER_INFO values (?, ?, ?, ?, ?)", "insert", Arrays.toString(arr));
//
//        if(oracleConn.getResult() != null) {
//            response.sendRedirect("/main");
//        };
    };
%>