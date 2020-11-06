<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.OracleConnection" %>
<%@ page import="sunil.Console" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="sunil.noticeBoard.DataList" %>

<%
    OracleConnection oracleConn = new OracleConnection();
    DataList dataList = new DataList();
    Console console = new Console();

    String method = request.getMethod();

    String[] contentWriterList = new String[0];
    String[] commentWriterList = new String[0];
    String[] likeContentsList = new String[0];

    String email = (String) session.getAttribute("email");

    if(method.equals("GET") || email != null) {
        String sql = "select writer from content where writer='"+email+"'";
        contentWriterList = dataList.getList(sql, contentWriterList);

        String sql2 = "select id from comments where id='"+email+"'";
        commentWriterList = dataList.getList(sql, commentWriterList);

        String sql3 = "select id from likes where id='"+email+"'";
        likeContentsList = dataList.getList(sql, likeContentsList);
    };
%>

<html>
<head>
    <title>Main Page</title>
<%--    <link rel="stylesheet" href="css/main.css">--%>
    <style>
        *{ margin: 0; padding : 0; box-sizing: border-box; }
        li{ list-style: none; }
        a{ text-decoration: none; color: black; }

        html, body{
            width: 100%;
            height: 100%;
        }

        #wrap{
            width: 100%;
            height: 100%;
            display: flex;
        }

        #info{
            width: 15%;
            height: 100%;
            border: 1px solid black;
            background: #e0e0e0;
            position: relative;
        }
        #user-data{
            width: 100%;
            height: 35%;
            background: #f7f7f7;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #wrap > article:nth-of-type(2) { width: 85%; height: 100%; }

        #banner{ width: 100%; height: 35%; }
        #banner-img{ width: 100%; height: 100%; }

        #notice-board{
            width: 100%;
            height: 65%;
            border: 1px solid black;
        }
        .notice-item{
            width: 100%;
            display: flex;
        }
        .notice-item > li{
            width: calc(100%/7);
            text-align: center;
        }
        .notice-item > li:nth-of-type(3) {
            width: calc(100%/4);
        }
    </style>
</head>
<body>
    <div id="wrap">
        <article id="info">
            <section id="user-data">
                <%
                    if(session.getAttribute("email") == null) {
                %>
                <div id="user-btn">
                    <button id="login"><a href="/user/account/login">로그인</a></button>
                    <button id="register"><a href="user/account/register">회원가입</a></button>
                </div>
                <%
                    };
                %>
                <%
                    if(session.getAttribute("email") != null) {
                %>
                <li id="name">이름 : <a href="/user/profile"><%=session.getAttribute("name")%></a></li>
                <li id="rank">등급 : <%=session.getAttribute("rank")%></li>
                <li>게시글 수 : <%=contentWriterList.length%>개</li>
                <li>댓글 수 :  <%=commentWriterList.length%>개</li>
                <li>좋아요 수 : <%=likeContentsList.length%>개</li>
                <br>
                <div id="user-btn">
                    <button id="logout"><a href="/user/account/logout">로그아웃</a></button>
                </div>
                <%
                    };
                %>
            </section>
        </article>
        <article>
            <section id="banner">
                <img src="/images/banner.jpg" alt="banner image" id="banner-img">
            </section>
            <section id="notice-board">
                <%
                    for(String element : contentWriterList) {
                %>
                        <div class="notice-item">
                            <li class="board">게시판</li>
                            <li class="writer">작성자</li>
                            <li class="title">제목</li>
                            <li class="content">내용</li>
                            <li class="comments">댓글 수</li>
                            <li class="likes">좋아요 수</li>
                        </div>
                <%
                    }
                %>
            </section>
        </article>
    </div>
</body>
</html>
