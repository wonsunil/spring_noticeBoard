<%@ page import="sunil.noticeBoard.model.Likes" %>
<%@ page import="sunil.noticeBoard.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String[] contents = (String[]) request.getAttribute("content");
    Likes[] likes = (Likes[]) request.getAttribute("likes");
    User[] users = (User[]) request.getAttribute("users");

    String email = (String) session.getAttribute("email");
    String writer = contents[1];
%>

<html>
<head>
    <title>content</title>
<%--    <link rel="stylesheet" href="/css/content_detail.css">--%>
    <script src="/js/content_detail.js"></script>
    <style>

    </style>
</head>
<body>
<div id="wrap">
    <h1 id="title">${content[2]}</h1>
    <h3 id="writer">${content[5].substring(0, 10)} by <a href="/user/profile?email=${content[1]}" target="_blank">${content[1]}</a></h3>
    <%
        if(likes == null) {
    %>
    <div id="content"></div>
    <%
        };
    %>
    <%
        if(likes != null) {
            for (User user : users) {
    %>
    <div class="profile">
        <a href="/user/profile/<%=user.toArray()[0]%>"><img class="profile-img" src="<%=user.toArray()[5]%>" alt=""></a>
        <li><a href="/user/profile/<%=user.toArray()[0]%>" target="_blank"><%=user.toArray()[0]%></a></li>
    </div>
    <%
            }
        };
    %>
</div>
<article id="more">
    <%
        if(likes == null) {
    %>
    <div>
        <li id="likes" class="box">
            <%
                if(email == null) {
            %>
            <button id="like">🤍 Likes</button>
            <%
                }else if(email != null && users == null) {
            %>
            <button id="like">🤍 Likes</button>
            <%
                };
            %>
            <%
                if(email != null && users != null) {
                    for(User user : users) {
                        if(email.equals(user)){

            %>
            <button id="like">❤️Likes</button>
            <%
                        };
                    }
                };
            %>
            <button><a href="/content/${content[4]}/likes">${content[6]}</a></button>
        </li>
        <li id="comments" class="box">
            <button id="comment">💬 Comments</button>
            <button>${content[7]}</button>
        </li>
    </div>
    <%
        };
    %>
    <div>
        <%
            if(email != null && email.equals(writer)) {
        %>
        <button id="rewrite">수정</button>
        <button id="delete">삭제</button>
        <%
            };
        %>
        <button><a href="/main">메인</a></button>
    </div>
</article>
</body>
<script>
    const content = `${content[3]}`;
    const $content = document.querySelector("#content");
    const $wrap = document.querySelector("#wrap");

    $content?.insertAdjacentHTML("beforeend", content);

    const getDate = function(date) {
        const year = date.getFullYear();

        let month = (1 + date.getMonth());
        month = month >= 10 ? month : '0' + month;

        let day = date.getDate();
        day = day >= 10 ? day : '0' + day;

        return  year + "/" + month + "/" + day;
    };
    const executeXhr = function(url, {method, data}, callback) {
        const xhr = new XMLHttpRequest();
        const form = new FormData();

        form.append("noticeBoard", "${content[0]}");
        form.append("writer", "${content[1]}");
        form.append("contentName", "${content[2]}");
        form.append("content", data.content);
        form.append("contentCode", "${content[4]}");

        if(method === "POST")
            form.append("updatedDate", getDate(new Date()));

        if(method === "DELETE") {
            form.append("updatedDate", `${content[5].substring(0, 10)}`);
            form.append("deletedDate", getDate(new Date()));
        };

        try{
            xhr.open(method, url);

            if(method === "POST" || method === "DELETE") xhr.send(form);
            xhr.send();
        } catch(err) {};

        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && method === "GET") callback(xhr.response);
        };
    };
</script>
</html>
