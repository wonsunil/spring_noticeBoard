<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sunil.OracleConnection" %>

<html>
<head>
    <title>login-page</title>
    <script src="/js/functions.js"></script>
    <script src="/js/login.js"></script>
</head>
<body>
    <form action="/" method="POST">
        <input type="text" id="email" name="email">
        <input type="password" id="password" name="password">
    </form>
    <li id="check"></li>
</body>
</html>

<%
    OracleConnection orclConn = new OracleConnection();

    
%>