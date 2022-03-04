package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author os_hoangpn
 */
public class ConnectDB {

    public static Connection connect = null;

    /**
     * Check Driver connect to MySQL
     */
    public Connection openConnect(){
    	String jdbcURL = "jdbc:mysql://localhost:3306/bookstoreonline?useSSL=false";
		String jdbcUsername = "root";
		String jdbcPassword = "";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connect = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (Exception e) {
			System.out.println("Connection to database failed");
			e.printStackTrace();
		}
		return connect;
    }

}