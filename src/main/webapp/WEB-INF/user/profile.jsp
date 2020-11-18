<%@ page import="sunil.noticeBoard.model.Content" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Content[] contentArray = (Content[]) request.getAttribute("contents");
%>

<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="/css/profile.css">--%>
    <script src="/js/profile.js"></script>
    <style>
        *{ margin: 0; padding: 0; }
        a{ text-decoration: none; color: black; }
        li{ list-style: none; }

        #wrap {
            width: 70%;
            height: 100%;
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            position: absolute;
            left: 15%;
        }

        #user-info{
            width: 100%;
            height: 30%;
            background: #ededed;
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
            width: 100%;
            height: auto;
            display: flex;
            margin-top: 50px;
        }

        #contents{
            width: 100%;
        }
        .notice-item{
            width: calc(100%/3);
            height: 45px;
            display: flex;
            flex-wrap: wrap;
            text-align: center;
            line-height: 45px;
            box-sizing: border-box;
        }
        .notice-item > li, .content{
            width: calc(100%/9);
            display: block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
        .notice-item > .content{ width: calc(100%/2); }
        .notice-item > li > a{ width: 100%; overflow: hidden; text-overflow: ellipsis; }
    </style>
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
        <div id="contents">
            <%
                for(int i = 0, length = contentArray.length; i < length; i++) {
                    String[] content = contentArray[i].toArray();
            %>
                <div class="notice-item" data-index="<%=content[4]%>">
                    <li class="writer"><a href="/user/profile?email=<%=content[1]%>"><%=content[1]%></a></li>
                    <li class="title"><a href="/content/detail?contentName=<%=content[2]%>"><%=content[2]%></a></li>
                    <div class="content"><%=content[3]%></div>
                    <li class="comments">
                        <span>💬</span><%=content[7]%>
                        <button class="comment"></button>
                    </li>
                    <li class="likes">
                        <span>👍</span><%=content[6]%>
                        <button class="like"></button>
                    </li>
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
