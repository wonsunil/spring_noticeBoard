<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String email = (String) session.getAttribute("email");
    String writer = (String) request.getAttribute("writer");
%>

<html>
<head>
    <title>content</title>
    <link rel="stylesheet" href="/css/content_detail.css">
    <script src="/js/content_detail.js"></script>
</head>
<body>
<div id="wrap">
    <h1 id="title">${content[2]}</h1>
    <h3 id="writer">${content[5].substring(0, 10)} by <a href="/user/profile?email=${content[1]}" target="_blank">${content[1]}</a></h3>
    <div id="content"></div>
</div>
<article id="more">
    <div>
        <li id="likes" class="box">
            <span>👍 Likes</span>
            <button id="like">${content[6]}</button>
        </li>
        <li id="comments" class="box">
            <span>💬 Comments</span>
            <button id="comment">${content[7]}</button>
        </li>
    </div>
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

    $content.insertAdjacentHTML("beforeend", content);

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
            form.append("updatedDate", `${updatedDate}`.substring(0, 10));
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
