<%@ page import="sunil.noticeBoard.model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: LEE.CHANGJUN
  Date: 2020-11-10
  Time: 오후 3:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        List<User> memberList = (List<User>) request.getAttribute("memberList");
        User[] memberArray = memberList.toArray(new User[memberList.size()]);
    %>
    <li><%=memberArray[0].toArray()[0]%></li>
</body>
</html>
