<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main Page</title>
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div id="wrap">
        <div id="info">
            <div id="user-data">
                <li id="name">이름 : <a href="/user/profile">asdf</a></li>
                <li id="rank">등급 : 일반</li>
<%--                전체 게시글 수 + 전체 댓글 수 + 전체 추천 수--%>
            </div>
            <div id="info_btn">
                <button id="login"><a href="/user/account/login">로그인</a></button>
                <button id="register"><a href="user/account/register">회원가입</a></button>
            </div>
        </div>
    </div>
</body>
</html>
