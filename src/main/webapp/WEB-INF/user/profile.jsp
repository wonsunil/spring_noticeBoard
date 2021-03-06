<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page import="sunil.noticeBoard.model.Follow" %>
<%@ page import="sunil.noticeBoard.model.Likes" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Content[] contentArray = (Content[]) request.getAttribute("contents");

    String[] user = (String[]) request.getAttribute("user");

    Follow[] followers = (Follow[]) request.getAttribute("follower");
    Follow[] following = (Follow[]) request.getAttribute("following");

    Likes[] likes = (Likes[]) request.getAttribute("likedContents");
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/profile.css">
    <script src="/js/profile.js"></script>
</head>
<body>
<article id="wrap">
    <section id="user-info">
        <div>
            <ul id="user-data">
                <img src="${user[5]}" alt="">
                <li id="email">${user[0]}</li>
            </ul>
            <ul id="user-activity">
                <%
                    if(followers != null && following != null) {
                %>
                <a id="follower">
                    <svg viewBox="0 0 16 16" width="16" height="16" aria-hidden="true">
                        <path fill-rule="evenodd"
                              d="M5.5 3.5a2 2 0 100
                              4 2 2 0 000-4zM2 5.5a3.5
                              3.5 0 115.898 2.549 5.507
                              5.507 0 013.034 4.084.75.75
                              0 11-1.482.235 4.001 4.001
                              0 00-7.9 0 .75.75 0 01-1.482-.236A5.507
                              5.507 0 013.102 8.05 3.49 3.49
                              0 012 5.5zM11 4a.75.75 0 100
                              1.5 1.5 1.5 0 01.666 2.844.75.75
                              0 00-.416.672v.352a.75.75 0
                              00.574.73c1.2.289 2.162 1.2 2.522
                              2.372a.75.75 0 101.434-.44 5.01
                              5.01 0 00-2.56-3.012A3 3 0 0011 4z">
                        </path>
                    </svg>
                    <strong><%=followers.length%></strong> followers</a>
                <li class="dot">.</li>
                <a id="following"><strong><%=following.length%></strong> following</a>
                <li class="dot">.</li>
                <li id="likes">👍 <%=likes.length%></li>
                <%
                    };
                %>
            </ul>
        </div>
        <div id="profile-content">
            ${user[4]}
        </div>
        <%
            if(session.getAttribute("email") != null && session.getAttribute("email").equals(user[0])) {
        %>
        <button id="setting">설정</button>
        <%
            };
        %>
    </section>
    <section id="user-content">
        <div class="container">
            <table class="table table-hover table-striped table-bordered text-center">
                <thead>
                <tr>
                    <th>작성자</th>
                    <th>제목</th>
                    <th>댓글 & 종아요</th>
                </tr>
                </thead>
                <tbody>
            <%
                if(contentArray != null) {
                    for (Content value : contentArray) {
                        String[] content = value.toArray();
            %>
                <tr>
                    <th class="writer"><a href="/user/profile/<%=content[1]%>"><%=content[1]%></a></th>
                    <th class="title"><a href="/content/<%=content[4]%>"><%=content[2]%></a></th>
                    <th class="more">
                        <li class="comments">
                            <span>💬</span><%=content[7]%>
                            <button class="comment"></button>
                        </li>
                        <li class="likes">
                            <span>👍</span><%=content[6]%>
                            <button class="like"></button>
                        </li>
                    </th>
                </tr>
                <%
                        };
                    };
                %>
                </tbody>
            </table>
            <%
                if(followers != null && following == null) {
                    for (Follow follower : followers) {
            %>
            <div class="list-group-item">
                <img src="<%=follower.toArray()[2]%>" alt="프로필 이미지">
                <a href="/user/profile/<%=follower.toArray()[0]%>"><%=follower.toArray()[0]%></a>
            </div>
            <%
                }
            }else if(following != null && followers == null) {
                for (Follow follow : following) {
            %>
            <div class="list-group-item">
                <img src="<%=follow.toArray()[2]%>" alt="프로필 이미지">
                <a href="/user/profile/<%=follow.toArray()[1]%>"><%=follow.toArray()[1]%>
                </a>
            </div>
            <%
                    }
                };
            %>
        </div>
    </section>
    <%
        if(followers != null && following != null) {
    %>
    <button><a href="/main?page=${page.currentPage}">메인</a></button>
    <%
        }else{
    %>
    <button><a href="/user/profile/<%=user[0]%>">프로필</a></button>
    <%
        };
    %>
</article>
</body>
</html>
