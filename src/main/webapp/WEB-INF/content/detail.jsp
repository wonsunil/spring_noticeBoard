<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String email = (String) session.getAttribute("email");
    String writer = (String) request.getAttribute("writer");
%>

<html>
<head>
    <title>content</title>
    <link rel="stylesheet" href="/css/content_detail.css">
    <style>

    </style>
</head>
<body>
    <li id="notice-board">게시판 : ${boardName}</li>
    <li id="writer">작성자 : ${writer}</li>
    <li id="content-name">제목 : ${contentName}</li>
    <textarea name="" id="content" cols="30" rows="10" disabled>${content}</textarea>
    <%
        if(email != null && email.equals(writer)) {
    %>
        <div>
            <button id="rewrite">수정</button>
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

        form.append("content", data.content);
        form.append("code", "${code}");
        form.append("date", getDate(new Date()));

        try{
            xhr.open(method, url);

            if(data) xhr.send(form);
            xhr.send();
        } catch(err) {};

        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && method === "GET") callback(xhr.response);
        };
    };

    const $textarea = document.querySelector("textarea");
    const $rewriteButton = document.querySelector("#rewrite");

    $rewriteButton?.addEventListener("click", function(event) {
        $textarea.disabled = false;

        if(document.querySelector("#save") !== null) return false;

        $rewriteButton.insertAdjacentHTML("afterend", "<button id='save'>저장</button>");
    });

    const $saveButton = document.querySelector("#save");
    document.body.addEventListener("click", function({ target }) {
        if(target.getAttribute("id") === "save") {
            $textarea.disabled = true;

            executeXhr("/content/rewrite", {method: "POST", data: {content: $textarea.value}});

            target.parentNode.removeChild(target)
        };
    });
</script>
</html>
