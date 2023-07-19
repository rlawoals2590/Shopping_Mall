package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;

public class Util {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521/xe",
				"system",
				"pass");
		return conn;
	}
	
	public static String getParamNN(String param) {
		if(param == null)
			return "";
		return param;
	}
}