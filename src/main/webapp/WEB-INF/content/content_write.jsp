<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/content_write.css">
    <script src="/js/content_write.js"></script>
</head>
<body class="jumbotron">
    <div class="container">
        <select name="" id="">
            <option value="free">자유 게시판</option>
            <option value="life">일상 게시판</option>
            <option value="report">신고 게시판</option>
            <option value="inquire">문의 게시판</option>
            <%
                if(session.getAttribute("rank").equals("admin")) {
            %>
            <option value="notice">공지 사항</option>
            <%
                };
            %>
        </select>
        <div class="container">
            <form action="/content/content-write" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <li id="boardName" name="boardName">자유 게시판</li>
                    <li id="writer" name="writer">작성자 : <%= session.getAttribute("email") %></li>
                </div>
                <div class="form-group">
                    <input id="title" name="contentName" placeholder="제목을 입력해주세요!" autocomplete="off">
                </div>
                <textarea name="" id="content" name="content" cols="30" rows="10"></textarea>
                <div class="form-group">
                    <label for="filename">파일 첨부 : </label>
                    <input type="text" id="filename" placeholder="파일명을 입력해주세요.">
                    <input type="file" id="file">
                </div>
                <input type="submit" class="btn btn-primary" value="글쓰기">
            </form>
            <button><a href="/main" class="btn btn-primary">메인</a></button>
        </div>
    </div>
</body>
</html>
