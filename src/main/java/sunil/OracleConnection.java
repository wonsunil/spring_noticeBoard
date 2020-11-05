package sunil;

import java.sql.*;

public class OracleConnection {
    private ResultSet rs = null;
    private final String url = "jdbc:oracle:thin:@localhost:7997:orcl";
    private final Connection conn = DriverManager.getConnection(url, "sunil", "1234");;
    private PreparedStatement pstmt = null;

    public OracleConnection() throws SQLException {

    }

    public void main(String[] args) {
        try {
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
        } catch (ClassNotFoundException ignored) {

        }
    };

    public <any> void console(any text) {
        System.out.println(text);
    };

    public void setPstmt(String sql, String kind) throws SQLException {
        if(kind != null) {
            try{
                console(sql);
                pstmt = conn.prepareStatement(sql);

                rs = pstmt.executeQuery();
            } catch (SQLSyntaxErrorException ignored) {
                ignored.printStackTrace();
            };
        };
    };
    public void setPstmt(String sql, String kind, String values) throws SQLException {
        values = values.replace("[", "");
        values = values.replace("]", "");
        String[] valueArray = values.replace(" ", "").split(",");

        for(int i = 0; i < values.length(); i++) {
            try{
                sql = sql.replaceFirst("\\?", "'" + valueArray[i] + "'");
            } catch (ArrayIndexOutOfBoundsException ignored) {

            }
        }

        try{
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            pstmt = conn.prepareStatement("commit");
            pstmt.executeQuery();
            pstmt.close();
        } catch (NullPointerException ignored) {
            console("Null Pointer Exception!");

            if(this.pstmt == null) {
                console("Prepared Statement is null!");
            };

            if(this.rs == null) {
                console("Result is null!");
            };
        } catch (SQLSyntaxErrorException ignored) {

        };
    }

    public ResultSet getResult() throws SQLException {
        return this.rs;
    };
}
