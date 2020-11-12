<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Title</title>
    <style>
        *{ margin: 0; padding: 0; }
        a{ text-decoration: none; }
        li{ list-style: none; }

        #wrap {
            width: 90%;
            height: 100%;
            display: flex;
            flex-wrap: wrap;
            position: absolute;
            left: 5%;
        }

        #user-info{
            width: 20%;
            height: 100%;
        }

        #user-activity{
            display: flex;
            padding: 5px;
            box-sizing: border-box;
        }
        #user-activity > li{
            margin-right: 5px;
        }

        #user-content{
            width: 80%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        #follow{
            width: 100%;
            height: 35%;
        }

        .contents{
            width: 100%;
            display: flex;
            border: 1px solid black;
            text-align: center;
        }
        .contents > li{
            width: calc(100%/9);
            border-right: 1px solid black;
        }
        .contents > li.content{
            width: calc(100%/2);
        }
    </style>
    <script src="/js/profile.js"></script>
</head>
<body>
<article id="wrap">
    <section id="user-info">
        <ul id="user-profile">
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
        <div id="profile-doc">
            <%-- 유저 본인이 작성 / 마크다운으로 가능하게 하고 싶음 --%>
        </div>
        <div id="contents"> <%-- 문서 로딩시 자동으로 추가됨 --%>

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
<script>
    const $email = document.querySelector("#email");
    const email = $email.innerHTML.trim().split(":")[1].trim();

    const xhr = new XMLHttpRequest();

    xhr.responseType = "json";
    xhr.open("GET", "user/user-follower?="+email);
    xhr.send();

    xhr.onreadystatechange = function() {
        if(xhr.readyState === 4) {
            console.log(xhr.response);
        };
    };
</script>
</html>
