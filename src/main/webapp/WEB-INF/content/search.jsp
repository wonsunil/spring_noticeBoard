<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Content[] contents = (Content[]) request.getAttribute("contents");
%>

<html>
<head>
    <title>User search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/search.css">
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
                <li class="list-group-item">
                    <a href="/user/profile/<%=content.toArray()[1]%>"><%=content.toArray()[1]%></a>
                    <a href="/content/detail/<%=content.toArray()[4]%>"><%=content.toArray()[4]%></a>
                </li>
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
<script>
    const $searchInput = document.querySelector("input");
    $searchInput.addEventListener("keyup", ({ target, key }) => {
        const value = target.value;

        if(key !== "Enter") return false;
        if(value === "") return false;

        location.href = "/content/search/" + value;
    });
</script>
</html>
