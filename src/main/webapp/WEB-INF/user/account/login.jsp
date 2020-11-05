<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sunil.OracleConnection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.sql.ResultSet" %>

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

<%
    String method = request.getMethod();

    if(method.equals("POST")) {
        String email = request.getParameter("email");
        String pw = request.getParameter("password");
        String kind = "select";

        OracleConnection oracleConn = new OracleConnection();

        try {
            oracleConn.setPstmt("SELECT email, name, rank FROM USERS where email='"+email+"' and password='"+pw+"'", kind);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        };

        if(oracleConn.getResult() != null) {
            oracleConn.getResult().next();
            String resultemail = oracleConn.getResult().getString("email");
            String resultname = oracleConn.getResult().getString("name");
            String resultrank = oracleConn.getResult().getString("rank");

            session.setAttribute("email", resultemail);
            session.setAttribute("name", resultname);
            session.setAttribute("rank", resultrank);
            response.sendRedirect("/main");
        };
    };
%>