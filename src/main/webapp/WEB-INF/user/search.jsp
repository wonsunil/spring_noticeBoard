<%@ page import="sunil.noticeBoard.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    User[] users = (User[]) request.getAttribute("user");
    String[] user = new String[0];

    if(users != null && users.length > 0) {
        user = users[0].toArray();
    };
%>

<html>
<head>
    <title>User search</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
                        out.println(user[0]);
                %>
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
