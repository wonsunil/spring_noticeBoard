<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page import="sunil.noticeBoard.service.LikesService" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    LikesService likesService = (LikesService) request.getAttribute("service");
    Content[] contents = (Content[]) request.getAttribute("contents");

    String email = (String) session.getAttribute("email");
%>

<html>
<head>
    <title>User search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/search.css">
    <script src="/js/content_search.js"></script>
</head>
<body>
<header>
    <div class="container d-flex align-items-end justify-content-center flex-column">
        <nav class="navbar navbar-expand-sm d-flex flex-column">
            <li class="align-self-start text-white">게시글 검색</li>
            <div>
                <input type="text" placeholder="게시글 이름을 입력해주세요." autocomplete="off" autofocus>
                <button>검색</button>
            </div>
        </nav>
    </div>
</header>
<div id="content">
    <div class="container">
        <li>검색결과</li>
        <hr>
        <section id="search-result">
            <%
                if(contents != null && contents.length > 0) {
            %>
            <ul class="list-group">
                <%
                    for(Content content : contents) {
                %>
                <div class="list-group-item">
                    <li><%=content.toArray()[0]%></li>
                    <li><a href="/user/profile/<%=content.toArray()[1]%>"><%=content.toArray()[1]%></a></li>
                    <li><a href="/content/detail/<%=content.toArray()[4]%>"><%=content.toArray()[2]%></a></li>
                    <%
                        if(email != null && !email.equals(content.toArray()[0]) &&
                                likesService.getLikeWhether(email, content.toArray()[0])
                        ) {
                    %>
                    <button><a href="/content/unlike/<%=content.toArray()[0]%>">좋아요 해제</a></button>
                    <%
                    }else if(email == null || !email.equals(content.toArray()[0])) {
                    %>
                    <button><a href="/content/like/<%=content.toArray()[0]%>">좋아요</a></button>
                    <%
                        };
                    %>
                </div>
            <%
                    }
                }else if(contents != null && contents.length == 0) {
            %>
                <li>검색결과가 없습니다!</li>
            <%
                }else {
            %>
                <li>게시글을 검색해보세요!</li>
            <%
                };
            %>
            </ul>
        </section>
    </div>
</div>
</body>
</html>
