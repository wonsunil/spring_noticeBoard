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
    <li id="notice-board">게시판 : ${boardName}</li>
    <li id="writer">작성자 : ${writer}</li>
    <li id="content-name">제목 : ${contentName}</li>
    <textarea name="" id="content" cols="30" rows="10" disabled>${content}</textarea>
    <textarea name="" id="change" class="editing" cols="30" rows="10">${content}</textarea>
    <%
        if(email != null && email.equals(writer)) {
    %>
        <div>
            <button id="rewrite">수정</button>
        </div>
        <div>
            <button id="delete">삭제</button>
        </div>
    <%
        };
    %>
    <button><a href="/main">메인</a></button>
</body>
<script>
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

        form.append("noticeBoard", "${boardName}");
        form.append("writer", "${writer}");
        form.append("contentName", "${contentName}");
        form.append("content", data.content);
        form.append("contentCode", "${code}");
        form.append("updatedDate", getDate(new Date()));

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
