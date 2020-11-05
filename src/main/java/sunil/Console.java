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
    public void log(boolean text) {
        System.out.println(text);
    };

    public void log(String[] arr) {
        for (String element : arr) {
            if(element != null) {
                this.log(element);

            };
        }
    };
    public void log(int[] arr) {
        for (int j : arr) {
            this.log(j);
        }
    };

    public void log(ResultSet rs) throws SQLException {
        int i = 1;

        try{
            while(rs.next()) {
                this.log(rs.getString(i));
                i++;
            };
        } catch (ArrayIndexOutOfBoundsException e) {

        };
    };
    public void log(ResultSet rs, String[] arr) throws SQLException {
        try{
            while(rs.next()) {
                for(String element : arr) {
                    this.log(rs.getString(element));
                }
            };
        } catch (ArrayIndexOutOfBoundsException e) {

        };
    };
    public void log(ResultSet rs, String text) throws SQLException {
        try{
            while(rs.next()) {
                this.log(rs.getString(text));
            };
        } catch (ArrayIndexOutOfBoundsException e) {

        };
    };
}
