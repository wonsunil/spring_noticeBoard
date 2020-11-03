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

    Class.forName(driver);
    conn = DriverManager.getConnection(url, "sunil", "1234");

    String sql = "SELECT * FROM USERS";

    PreparedStatement pstmt = null;
    pstmt = conn != null ? conn.prepareStatement(sql) : null;

    ResultSet rs = null;

    rs = pstmt.executeQuery();
//    try{
//        try {
//            if (pstmt != null) {
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }catch(NullPointerException e) {
//            e.printStackTrace();
//    };

    String[] arr = new String[50];

    int i = 0;

    while(rs.next()) {
        i++;
        out.print(rs.getString(i) +  "/");
    };

    if(rs != null) {
    }else out.print("error");

%>