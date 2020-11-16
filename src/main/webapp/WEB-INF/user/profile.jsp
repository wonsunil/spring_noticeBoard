<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/profile.css">
    <script src="/js/profile.js"></script>
</head>
<body>
<article id="wrap">
    <section id="user-info">
        <ul id="user-data">
            <li id="email">이메일 : ${email}</li>
            <li id="name">이름 : ${name}</li>
            <li id="phone">전화번호 : ${phone}</li>
            <li id="rank">등급 : ${rank}</li>
        </ul>
        <ul id="user-activity">
            <li id="follower">0 followers</li>
            <li id="following">0 following</li>
            <li id="liked">0개</li>
        </ul>
    </section>
    <section id="user-content">
        <div id="profile">
            <%-- 기본 프로필만 있고 유저가 프로필 작성 --%>
        </div>
        <div id="contents">
            <%-- 문서 로딩시 자동으로 추가됨 --%>
            <%-- 정렬기능 추가 예정 --%>
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
