<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String method = request.getMethod();

    if (method.equals("GET")) response.sendRedirect("../../main");

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

    String sql = "SELECT * FROM USERS";

    PreparedStatement pstmt = null;
    try {
        pstmt = conn != null ? conn.prepareStatement(sql) : null;
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

    int i = 0;

    while(true) {
        assert rs != null;
        try {
            if (!rs.next()) break;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        i++;
        try {
            out.print(rs.getString(i) +  "/");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    };
%>