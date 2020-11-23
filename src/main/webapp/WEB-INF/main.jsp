<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page import="sunil.noticeBoard.Pagination" %>

<%
    Content[] allContents = (Content[]) request.getAttribute("allContentArray");
    Content[] writtenContentArray = (Content[]) request.getAttribute("writtenContentArray");

    Pagination pagination = (Pagination) request.getAttribute("paging");
%>

<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="/css/main.css">--%>
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

        #wrap > article:nth-of-type(2) { width: 85%; height: 100%; }

        #notice-board{
            width: 100%;
            height: 65%;
            border: 1px solid black;
            position: relative;
        }

        #additional-function{
            width: auto;
            height: 50px;
            margin-top: 25px;
        }

        #alert{
            width: 300px;
            height: 100px;
            background: white;
            border: 1px solid black;
            text-align: center;
            position: absolute;
            top: 0;
            left: 45%;
        }
        #alert > li{
            height: 70%;
            line-height: 70px;
            font-size: 18px;
        }
        #alert > button{
            width: 70px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            background: #4995fa;
            color: white;
            outline: none;
            cursor: pointer;
            position: absolute;
            right: 0;
            bottom: 0;
            margin: 7px;
        }
    </style>
    <link rel="stylesheet" href="/css/index.css">
    <script src="/js/main.js"></script>
    <style>
        #wrap > article:nth-of-type(2) {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <nav class="navbar navbar-expand-sm text-black">
            <a class="navbar-brand" href="index">Expand at sm</a>
            <div class="collapse navbar-collapse" id="navbarsExample03">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                    <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li>
                </ul>
                <div id="button-box" class="pull-right">
                    <button class="btn btn-default"><a href="/user/account/logout">Sign out</a></button>
                </div>
            </div>
        </nav>
        <section id="user-data">
<%--            <li id="name">이름 : <a href="/user/profile/<%=session.getAttribute("email")%>"><%=session.getAttribute("name")%></a></li>--%>
<%--            <li id="rank">등급 : <%=session.getAttribute("rank")%></li>--%>
<%--            <li>게시글 수 : <%=writtenContentArray.length%>개<li>--%>
<%--            <br>--%>
<%--            <div id="user-btn">--%>
<%--                <button id="logout"><a href="/user/account/logout">로그아웃</a></button>--%>
<%--            </div>--%>
        </section>
    </div>
</header>
<div id="wrap">
    <article>
        <section id="notice-board">
            <div id="additional-function">
                <select name="limit" id="">
                    <option value="10" <%=pagination.getLimit().equals("10") ? "selected" : ""%>>10개</option>
                    <option value="15" <%=pagination.getLimit().equals("15") ? "selected" : ""%>>15개</option>
                    <option value="20" <%=pagination.getLimit().equals("20") ? "selected" : ""%>>20개</option>
                </select>
            </div>
            <table class="table table-hover table-striped text-center" style="border: 1px solid black;">
                <thead>
                    <tr>
                        <th>게시판</th>
                        <th>작성자</th>
                        <th>제목</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    try {
                        for (int i = pagination.getStartIndex(), limit = pagination.getLastIndex(); i < limit; i++) {
                            String[] content = allContents[i].toArray();
                %>
                    <tr>
                        <th><%=content[0]%></th>
                        <th><a href="/user/profile/<%=content[1]%>"><%=content[1]%></a></th>
                        <th><a href="/content/<%=content[4]%>"><%=content[2]%></a></th>
                    </tr>

                <%
                        }
                    } catch (ArrayIndexOutOfBoundsException ignored) {

                    };
                %>
                </tbody>
            </table>
            <a href="/content/content-write" id="write" class="btn btn-default">글쓰기</a>
            <div class="text-center">
                <ul class="pagination">
                    <%
                        if(allContents.length > 10 && allContents.length > Integer.parseInt(pagination.getLimit())) {
                            // 페이징 처리를 위한 앵커태그 생성부
                            for (int i = 1, limit = pagination.getLastPage(); i <= limit; i++) {
                    %>
                    <li class=<%=pagination.getCurrentPage() == i ? "current-page" : ""%>><a href="?page=<%=i%>"><%=i%></a></li>
                    <%
                            };
                        };
                    %>
                </ul>
            </div>
        </section>
    </article>
</div>
</body>
<script>
    const email = "${email}";
</script>
</html>
