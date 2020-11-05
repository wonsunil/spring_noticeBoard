<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.OracleConnection" %>
<%@ page import="sunil.Console" %>
<%@ page import="java.sql.ResultSet" %>

<%
    OracleConnection oracleConn = new OracleConnection();
    Console console = new Console();

    String method = request.getMethod();

    String[] contentWriterList = new String[0];
    String[] commentWriterList = new String[0];
    String[] likeContentsList = new String[0];

    if(method.equals("GET")) {
        String email = (String) session.getAttribute("email");

        if(email == null) response.sendRedirect("/user/account/login");

        String sql = "select writer from content where writer='"+email+"'";

        oracleConn.setPstmt(sql, "select");
        ResultSet rs = oracleConn.getResult();

        contentWriterList = oracleConn.getResultArray(rs, contentWriterList);
        rs.close();

        String sql2 = "select id from comments where id='"+email+"'";
        oracleConn.setPstmt(sql2, "select");
        ResultSet rs2 = oracleConn.getResult();
        commentWriterList = oracleConn.getResultArray(rs, commentWriterList);
        rs2.close();

        String sql3 = "select id from likes where id='"+email+"'";
        oracleConn.setPstmt(sql3, "select");
        ResultSet rs3 = oracleConn.getResult();
        likeContentsList = oracleConn.getResultArray(rs, likeContentsList);
        rs3.close();
    };
%>

<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div id="wrap">
        <div id="info">
            <div id="user-data">
                <li id="name">이름 : <a href="/user/profile"><%=session.getAttribute("name")%></a></li>
                <li id="rank">등급 : <%=session.getAttribute("rank")%></li>
                <li>게시글 수 : <%=contentWriterList.length%>개</li>
                <li>댓글 수 :  <%=commentWriterList.length%>개</li>
                <li>좋아요 수 : <%=likeContentsList.length%>개</li>
                <%--전체 게시글 수 + 전체 댓글 수 + 전체 추천 수--%>
            </div>
            <div id="info_btn">
                <button id="login"><a href="/user/account/login">로그인</a></button>
                <button id="register"><a href="user/account/register">회원가입</a></button>
            </div>
        </div>
    </div>
</body>
</html>
