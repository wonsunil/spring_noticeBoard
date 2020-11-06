<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.Console" %>
<%@ page import="sunil.noticeBoard.DataList" %>
<%@ page import="java.util.Arrays" %>

<%
    DataList dataList = new DataList();
    Console console = new Console();

    String[][] allContentList = new String[0][0];
    allContentList = dataList.getList("select * from content", allContentList);
%>

<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="css/main.css">
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
<%--                <li id="name">이름 : <a href="/user/profile"><%=session.getAttribute("name")%></a></li>--%>
<%--                <li id="rank">등급 : <%=session.getAttribute("rank")%></li>--%>
<%--                <li>게시글 수 : ${contentWriterList.length}개</li>--%>
<%--                <li>댓글 수 :  ${contentWriterList.length}개</li>--%>
<%--                <li>좋아요 수 : ${contentWriterList.length}개</li>--%>
<%--                <br>--%>
<%--                <div id="user-btn">--%>
<%--                    <button id="logout"><a href="/user/account/logout">로그아웃</a></button>--%>
<%--                </div>--%>
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
                        for(int i = 0; i < allContentList.length; i++) {
                            console.log(Arrays.toString(allContentList[i]));
                    %>
                        <div class="notice-item" data-index="<%=allContentList[i][3]%>">
                            <li class="board"><%=allContentList[i][0]%></li>
                            <li class="writer"><%=allContentList[i][1]%></li>
                            <li class="title"><%=allContentList[i][2]%></li>
                            <li class="content">내용</li>
                            <li class="comments">
                                <button class="comment"></button>
                                댓글 수
                            </li>
                            <li class="likes">
                                <button class="like"></button>
                                좋아요 수
                            </li>
                        </div>
                    <%

                        }
                    %>
            </section>
        </article>
    </div>
</body>
</html>
