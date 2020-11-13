<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.noticeBoard.model.Content" %>

<%
    Content[] allContents = (Content[]) request.getAttribute("allContentArray");
    Content[] writtenContentArray = (Content[]) request.getAttribute("writtenContentArray");
%>

<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/main.js"></script>
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
            <li id="name">이름 : <a href="/user/profile?email=<%= (String) session.getAttribute("email")%>"><%=session.getAttribute("name")%>
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
<%--            <select id="align-option">--%>
<%--                <option value="updated_date">날짜순</option>--%>
<%--                <option value="liked">좋아요순</option>--%>
<%--            </select>--%>
            <button><a href="/content/content-write">글쓰기</a></button>
            <%
                try {
                    for (int i = 0, limit = allContents.length; i < limit; i++) {
                        String[] content = allContents[i].toArray();
            %>
            <div class="notice-item" data-index="<%=content[4]%>">
                <li class="board"><%=content[0]%></li>
                <li class="writer"><a href="/user/profile?<%=content[1]%>"><%=content[1]%></a></li>
                <li class="title"><%=content[2]%></li>
                <li class="content"><%=content[3]%></li>
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
                } catch (ArrayIndexOutOfBoundsException ignored) {

                };
            %>
        </section>
    </article>
</div>
</body>
<script>
    const email = "${email}";

    const $write = document.querySelector("#notice-board > button");
    $write.addEventListener("click", function(event) {
        if(email == "") {
            event.preventDefault();

            alert("로그인한 유저만 접근 가능합니다");

            return location.href = "/user/account/login";
        };
    });
</script>
</html>
