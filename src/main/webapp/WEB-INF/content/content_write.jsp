<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/content_write.css">
    <script src="/js/content_write.js"></script>
</head>
<body>
    <select name="" id="">
        <option value="free">자유 게시판</option>
        <option value="life">일상 게시판</option>
        <option value="report">신고 게시판</option>
        <option value="inquire">문의 게시판</option>
    </select>
    <form action="/content/content-write" method="POST" enctype="multipart/form-data">
        <li id="boardName" name="boardName">자유 게시판</li>
        <li id="writer" name="writer">작성자 : <%= session.getAttribute("email") %></li>
        <input id="title" name="contentName" placeholder="제목">
        <il id="date" name="date">작성일 : <%= format.format(new Date())%></il>
        <textarea name="" id="content" name="content" cols="30" rows="10"></textarea>
        <li>파일 첨부 : </li><input type="file">
        <input type="submit" value="글쓰기">
    </form>
</body>
</html>
