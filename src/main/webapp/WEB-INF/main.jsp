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
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/main.js"></script>
    <style>
        #wrap > article:nth-of-type(2) {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<div id="wrap">
    <article id="info">
        <section id="user-data">
            <%
                if (session.getAttribute("email") == null) {
            %>
            <div id="user-btn">
                <button id="login"><a href="/user/account/login">로그인</a></button>
                <button id="register"><a href="user/account/register">회원가입</a></button>
            </div>
            <%
                };
            %>
            <%
                if (session.getAttribute("email") != null) {
            %>
            <li id="name">이름 : <a href="/user/profile/<%=session.getAttribute("email")%>"><%=session.getAttribute("name")%>
            </a></li>
            <li id="rank">등급 : <%=session.getAttribute("rank")%>
            </li>
            <li>게시글 수 : <%=writtenContentArray.length%>개
            <li>
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
