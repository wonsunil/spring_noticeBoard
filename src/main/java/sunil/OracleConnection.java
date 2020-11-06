package sunil;

import sunil.noticeBoard.DataList;

import java.sql.*;

public class OracleConnection {
    Console console = new Console();

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
    };

    public ResultSet getResult() throws SQLException {
        return this.rs;
    };

    public String[] getResultArray(ResultSet rs, String[] originalArr) throws SQLException {
        int i = 0;
        String[] columnNames = new String[rs.getMetaData().getColumnCount()];

        try{
            for(int j = 1; j <= columnNames.length; j++) {
                columnNames[j-1] = rs.getMetaData().getColumnName(j);
            };

            while(rs.next()) {
                String[] newArr = new String[i+1];

                for(int k = 0; k < columnNames.length; k++) {
                    newArr[i] = rs.getString(columnNames[k]);
                };

                System.arraycopy(originalArr, 0, newArr, 0, originalArr.length);

                originalArr = newArr;
                i++;
            };
        } catch (ArrayIndexOutOfBoundsException | SQLException ignored) {

        };

        return originalArr;
    };

    public String[][] getResultArray(ResultSet rs, String[][] originalArr) throws SQLException {
        DataList dataList= new DataList();

        String[] columnNames = new String[rs.getMetaData().getColumnCount()];
        String sql = "select writer from content";
        String[] writerList = new String[0];
        writerList = dataList.getList(sql, writerList);

        try{
            for(int j = 1; j <= columnNames.length; j++) {
                columnNames[j-1] = rs.getMetaData().getColumnName(j);
            };

            String[][] newArr = new String[writerList.length][columnNames.length];

            for(int k = 0; k < writerList.length; k++) {
                rs.next();

                for(int x = 0; x < columnNames.length; x++) {
                    newArr[k][x] = rs.getString(columnNames[x]);
                };
            };

            System.arraycopy(originalArr, 0, newArr, 0, originalArr.length);

            originalArr = newArr;
        } catch (ArrayIndexOutOfBoundsException ignored) {
            console.log("Array index out of bounds exception!");
        } catch (NullPointerException ignored) {
            if(writerList == null) console.log("writerList is null!");

            console.log("something is null!");
        } catch (SQLException ignored) {
            console.log("SQL exception!");
        };

        return originalArr;
    };

    public String[] resizeArray(String[] array) {
        String[] copyArray = new String[array.length + 1];

        for(int i = 0; i < array.length; i++) {
            copyArray[i] = array[i];
        }

        return copyArray;
    };
};
