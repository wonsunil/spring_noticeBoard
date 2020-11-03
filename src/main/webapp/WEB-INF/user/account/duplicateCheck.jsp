<%@ page import="java.rmi.server.ExportException" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String method = request.getMethod();

    if (method.equals("GET")) response.sendRedirect("../../main");

    String email = request.getParameter("email");

    Connection conn = null;
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:7997:orcl";

    try{
        Class.forName(driver);
        conn = DriverManager.getConnection(url, "sunil", "1234");

    }catch(Exception e) {
        e.printStackTrace();
    };

    String sql = String.format("SELECT * FROM USERS");

    PreparedStatement pstmt = null;

    try {
        pstmt = conn != null ? conn.prepareStatement(sql) : null;
    } catch (SQLException throwables) {
        throwables.printStackTrace();
    }
    ResultSet rs = null;

    try{
        try {
            if (pstmt != null) {
                rs = pstmt.executeQuery();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }catch(NullPointerException e) {
            e.printStackTrace();
    };

    if(rs != null) {
        out.print(rs);
    }else out.print("error");

%>