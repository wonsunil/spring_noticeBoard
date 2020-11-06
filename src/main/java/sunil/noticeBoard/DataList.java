package sunil.noticeBoard;

import sunil.OracleConnection;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DataList {
    public String[] getList(String sql, String[] resultArray) throws SQLException {
        OracleConnection oracleConn = new OracleConnection();

        oracleConn.setPstmt(sql, "select");
        ResultSet rs = oracleConn.getResult();
        resultArray = oracleConn.getResultArray(rs, resultArray);
        rs.close();

        return resultArray;
    };

    public String[][] getList(String sql, String[][] resultArray) throws SQLException {
        OracleConnection oracleConn = new OracleConnection();

        oracleConn.setPstmt(sql, "select");
        ResultSet rs = oracleConn.getResult();
        resultArray = oracleConn.getResultArray(rs, resultArray);
        rs.close();

        return resultArray;
    };
};
