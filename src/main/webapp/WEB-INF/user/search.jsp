<%@ page import="sunil.noticeBoard.model.User" %>
<%@ page import="sunil.noticeBoard.model.Follow" %>
<%@ page import="sunil.noticeBoard.service.FollowService" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    User[] users = (User[]) request.getAttribute("user");

    FollowService followService = (FollowService) request.getAttribute("service");

    String email = (String) session.getAttribute("email");
%>

<html>
<head>
    <title>User search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/search.css">
    <script src="/js/search.js"></script>
</head>
<body>
    <header>
        <div class="container d-flex align-items-end justify-content-center flex-column">
            <nav class="navbar navbar-expand-sm d-flex flex-column">
                <li class="align-self-start text-white">유저 검색</li>
                <div>
                    <input type="text" placeholder="이메일 또는 이름을 입력해주세요." autocomplete="off" autofocus>
                    <button>검색</button>
                </div>
            </nav>
        </div>
    </header>
    <div id="content">
        <div class="container">
            <li>검색결과</li>
            <hr>
            <section id="search-result">
                <%
                    if(users != null && users.length > 0) {
                %>
                <ul class="list-group">
                <%
                    for(User u : users) {
                %>
                    <li class="list-group-item">
                        <img src="<%=u.toArray()[5]%>" alt="" class="profile-img">
                        <a href="/user/profile/<%=u.toArray()[0]%>"><%=u.toArray()[0]%>
                        </a>
                        <%
                            if(email != null && !email.equals(u.toArray()[0]) &&
                                followService.getFollowWhether(email, u.toArray()[0])
                            ) {
                        %>
                        <button><a href="/user/unfollow/<%=u.toArray()[0]%>">팔로우 끊기</a></button>
                        <%
                            }else if(email == null || !email.equals(u.toArray()[0])) {
                        %>
                        <button>팔로우</button>
                        <%
                            };
                        %>
                    </li>
                <%
                    }
                %>
                </ul>
                <%
                    }else if(users != null && users.length == 0) {
                %>
                    <li><strong>해당 이메일 또는 이름을 사용중인 유저가 없습니다!</strong></li>
                <%
                    }else if(users == null) {
                %>
                <li><strong>검색을 통해 친구를 찾아보세요!</strong></li>
                <%
                    };
                %>
            </section>
            <section id="associate-result">

            </section>
        </div>
    </div>
</body>
</html>
