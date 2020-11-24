<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Content[] contentArray = (Content[]) request.getAttribute("contents");

    String[] user = (String[]) request.getAttribute("user");
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
                <li id="follower">0 followers</li>
                <li id="following">0 following</li>
                <li id="likes">👍0</li>
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
            <ul class="list-group">
                <%
                    for (Content value : contentArray) {
                        String[] content = value.toArray();
                %>
                <div class="list-group-item border border-dark border-bottom-0">
                    <li class="writer"><a href="/user/profile/<%=content[1]%>"><%=content[1]%></a></li>
                    <li class="title"><a href="/content/<%=content[4]%>"><%=content[2]%></a></li>
                    <div class="more">
                        <li class="comments">
                            <span>💬</span><%=content[7]%>
                            <button class="comment"></button>
                        </li>
                        <li class="likes">
                            <span>👍</span><%=content[6]%>
                            <button class="like"></button>
                        </li>
                    </div>
                </div>
                <%
                    };
                %>
            </ul>
        </div>
    </section>
</article>
</body>
</html>
