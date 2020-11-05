package sunil;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Console {
    public void log(String text) {
        System.out.println(text);
    };
    public void log(int text) {
        System.out.println(text);
    };

    public void log(String[] arr) {
        for (String element : arr) {
            this.log(element);
        }
    };
    public void log(int[] arr) {
        for (int j : arr) {
            this.log(j);
        }
    };

    public void log(ResultSet rs, String[] arr) throws SQLException {
        if(rs.next()) {
            this.log(rs.getString("writer"));

            for(String element : arr) {
                this.log(rs.getString(element));
            }
        };
    };
}
