<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String email = (String) session.getAttribute("email");
    String writer = (String) request.getAttribute("writer");
%>

<html>
<head>
    <title>content</title>
    <link rel="stylesheet" href="/css/content_detail.css">
<%--    <script src="/js/content_detail.js"></script>--%>
</head>
<body>
    <div id="wrap">
        <h1 id="title">${contentName}</h1>
        <h3 id="writer">${updatedDate.substring(0, 10)} by <a href="/user/profile?email=${writer}" target="_blank">${writer}</a></h3>
        <div id="content"></div>
    </div>
    <article id="more">
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
        <section id="comment-box">

        </section>
        <section>

        </section>
    </article>
</body>
<script>
    const content = `${content}`;
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

        form.append("noticeBoard", "${boardName}");
        form.append("writer", "${writer}");
        form.append("contentName", "${contentName}");
        form.append("content", data.content);
        form.append("contentCode", "${code}");

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

    const $textarea = document.querySelector("#content");
    const $rewriteButton = document.querySelector("#rewrite");

    $rewriteButton?.addEventListener("click", function(event) {
        if(document.querySelector("#save") !== null) return false;

        let replaceContent = content.replaceAll("<li>", "");
        replaceContent = replaceContent.replaceAll("</li>", "");
        replaceContent = replaceContent.replaceAll("<br/>", "\n\n");

        $content.style.display = "none";
        $wrap.insertAdjacentHTML("beforeend", "<textarea>" + replaceContent + "</textarea>");
        $rewriteButton.insertAdjacentHTML("afterend", "<button id='save'>저장</button>");
    });

    document.body.addEventListener("click", function({ target }) {
        if(target.getAttribute("id") === "save") {
            const $textarea = document.querySelector("textarea");

            let text = "";

            $textarea.value.split("\n").filter( v => v != "").map(v => {
                text += "<li>" + v + "<li><br/>";
            });

            $content.innerHTML = text;
            $content.style.display = "block";

            $textarea.parentNode.removeChild($textarea);
            executeXhr("/content/rewrite", {method: "POST", data: {content: text}});

            target.parentNode.removeChild(target);
        };
        if(target.getAttribute("id") === "delete") {
            executeXhr("/content/delete", {method: "DELETE",  data: {content: $textarea.value}});

            location.href = "/main";
        };
    });
</script>
</html>
