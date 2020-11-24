<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page import="sunil.noticeBoard.Pagination" %>
<%@ page import="sunil.noticeBoard.model.Follow" %>

<%
    Content[] allContents = (Content[]) request.getAttribute("allContentArray");
    Pagination pagination = (Pagination) request.getAttribute("paging");

    String email = (String) session.getAttribute("email");
    String image = (String) session.getAttribute("image");

    Follow[] follower = (Follow[]) request.getAttribute("follower");
    Follow[] following = (Follow[]) request.getAttribute("following");
%>

<html>
<head>
    <title>Main Page</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/main.css">
    <script src="/js/main.js"></script>
</head>
<body>
<header>
    <div class="container">
        <nav class="navbar navbar-expand-sm text-black">
            <a class="navbar-brand" href="/main">Notice Board</a>
            <div class="collapse navbar-collapse" id="navbarsExample03">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link" href="/main">Home <span class="sr-only">(current)</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="/user/search">Search</a></li>
                    <li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a></li>
                </ul>
                <div id="button-box" class="pull-right">
                    <%
                        if(email == null) {
                    %>
                    <button class="btn btn-light"><a href="/user/account/login">Sign in</a></button>
                    <button class="btn btn-light"><a href="/user/account/register">Sign up</a></button>
                    <%
                        }else {
                    %>
                    <div id="profile">
                        <img src="<%=image%>" alt="">
                        <div class="dropdown">
                            <button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="/user/profile/<%=session.getAttribute("email")%>">Profile</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="/user/account/logout">Sign out</a>
                            </div>
                        </div>
                    </div>
                    <%
                        };
                    %>
                </div>
            </div>
        </nav>
    </div>
</header>
<div id="content">
    <article class="d-flex justify-content-around">
        <section id="follow" class="">
            <ul class="list-group">
                <li>Followers</li>
                <%
                    if(following == null) {
                %>
                <li class="list-group-item">Please login!</li>
                <%
                }else if(following.length == 0) {
                %>
                <li class="list-group-item">0 following!</li>
                <%
                }else {
                    for (Follow follow : follower) {
                %>
                <li class="list-group-item">
                    <img src="<%=follow.toArray()[2]%>" alt="">
                    <a href="/user/profile/<%=follow.toArray()[0]%>"><%=follow.toArray()[0]%>
                    </a>
                </li>
                <%
                        };
                    };
                %>
            </ul>
            <ul class="list-group">
                <li>Following</li>
                <%
                    if(following == null) {
                %>
                <li class="list-group-item">Please login!</li>
                <%
                    }else if(following.length == 0) {
                %>
                <li class="list-group-item">0 following!</li>
                <%
                    }else {
                        for (Follow follow : following) {
                %>
                <li class="list-group-item">
                    <img src="<%=follow.toArray()[2]%>" alt="">
                    <a href="/user/profile/<%=follow.toArray()[1]%>"><%=follow.toArray()[1]%>
                    </a>
                </li>
                <%
                        };
                    };
                %>
            </ul>
        </section>
        <section id="notice-board">
            <div id="additional-function" class="d-flex justify-content-between align-items-start">
                <select name="limit">
                    <option value="10" <%=pagination.getLimit().equals("10") ? "selected" : ""%>>10개</option>
                    <option value="15" <%=pagination.getLimit().equals("15") ? "selected" : ""%>>15개</option>
                    <option value="20" <%=pagination.getLimit().equals("20") ? "selected" : ""%>>20개</option>
                </select>
                <nav>
                    <ul class="pagination">
                        <%
                            if(allContents.length > 10 && allContents.length > Integer.parseInt(pagination.getLimit())) {
                                for (int i = 1, limit = pagination.getLastPage(); i <= limit; i++) {
                        %>
                        <li class="page-item <%=pagination.getCurrentPage() == i ? "active" : ""%>"><a href="?page=<%=i%>" class="page-link"><%=i%></a></li>
                        <%
                                };
                            };
                        %>
                    </ul>
                </nav>
            </div>
            <table class="table table-hover table-striped text-center">
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
            <a href="/content/content-write" id="write" class="btn btn-outline-dark">글쓰기</a>
        </section>
    </article>
</div>
</body>
<script>const email = "${email}";</script>
</html>
