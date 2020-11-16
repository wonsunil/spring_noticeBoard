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
            <div id="additional-function">
                <button id="write"><a href="/content/content-write">글쓰기</a></button>
                <input type="text" id="search-content" placeholder="게시글 검색">
            </div>

            <%
                // 게시글 출력부분 / limit 10개
                try {
                    for (int i = 0, limit = 10; i < limit; i++) {
                        String[] content = allContents[i].toArray();
            %>
            <div class="notice-item" data-index="<%=content[4]%>">
                <li class="board"><%=content[0]%></li>
                <li class="writer"><a href="/user/profile?email=<%=content[1]%>"><%=content[1]%></a></li>
                <li class="title"><a href="/content/detail?contentName=<%=content[2]%>"><%=content[2]%></a></li>
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
            <div id="paging">
            <%
                if(allContents.length > 10) {
                // 게시글이 10개가 넘으면 페이징 처리를 위한 앵커태그 생성부
                    for (int i = 1, limit = allContents.length % 10 + 1; i <= limit; i++) {
            %>
                <li class="page-nation"><a href="?page=<%=i%>"><%=i%></a></li>
            <%
                    };
                };
            %>
            </div>
        </section>
    </article>
</div>
</body>
<script>
    const email = "${email}";

    const $write = document.querySelector("#write");
    $write.addEventListener("click", function(event) {
        if(email == "") {
            event.preventDefault();

            alert("로그인한 유저만 접근 가능합니다");

            return location.href = "/user/account/login";
        };
    });

    HTMLElement.prototype.contentRender = function(arr) {
        arr.map(item => {
            this.insertAdjacentHTML("beforeend", `
                <div class="contents" data-code=${item.contentCode}>
                <li class="board">${item.boardName}</li>
                <li class="writer">${item.writer}</li>
                <li class="title">${item.contentName}</li>
                <li class="content">${item.content}</li>
                </div>
            `
            );
        });
    };

    const xhr = new XMLHttpRequest();

    xhr.responseType = "json";

    const $search = document.querySelector("#search-content");

    $search.addEventListener("keyup", function({ target, key }) {
        if(key === "Enter") {
            xhr.open("GET", "/content/user-content-name?contentName="+target.value+"");
            xhr.send();

            console.log(target.value)
        };
    });
</script>
</html>
