<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String method = request.getMethod();

    if (method.equals("GET")) response.sendRedirect("../../main");

    String email = request.getParameter("email");

    Connection conn = null;
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:7997:orcl";

    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    try {
        conn = DriverManager.getConnection(url, "sunil", "1234");
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    PreparedStatement pstmt = null;
    try {
        pstmt = conn != null ? conn.prepareStatement("select * from users") : null;
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    ResultSet rs = null;

    try {
        assert pstmt != null;
        rs = pstmt.executeQuery();
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }

    int i = 1;

    while(true) {
        assert rs != null;
        try {
            if (!rs.next()) break;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        };
        try {
            if(rs.getString("Email").equals(email)) {
                out.print("중복된 이메일입니다.");

                break;
            };
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        };
        i++;
    };
%>