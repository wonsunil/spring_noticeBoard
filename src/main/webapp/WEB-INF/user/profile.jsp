<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Content[] contentArray = (Content[]) request.getAttribute("contents");
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/profile.css">
<%--    <script src="/js/profile.js"></script>--%>
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
            <li>${user[4]}</li>
        </div>
        <%
            if(session.getAttribute("email") != null) {
        %>
        <button id="setting">설정</button>
        <%
            };
        %>
    </section>
    <section id="user-content">
        <div id="contents">
            <%
                for(int i = 0, length = contentArray.length; i < length; i++) {
                    String[] content = contentArray[i].toArray();
            %>
                <div class="notice-item" data-index="<%=content[4]%>">
                    <li class="writer"><a href="/user/profile?email=<%=content[1]%>"><%=content[1]%></a></li>
                    <li class="title"><a href="/content/detail?contentName=<%=content[2]%>"><%=content[2]%></a></li>
                    <div class="content"><%=content[3]%></div>
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
                }
            %>
        </div>
    </section>
</article>
<article id="popups">
    <div id="rank-info-popup"> <%-- 등급 정보 / 현재 등급 & 다음 등급까지 남은 ? --%>
        <div class="popup">

        </div>
        <div class="blind"></div>
    </div>
</article>
</body>
</html>
