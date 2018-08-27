package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectarBD {

	static String url = "jdbc:postgresql://localhost:5432/cursojava";
	static String usuario = "postgres";
	static String password = "123456";
	static Connection connection = null;

	public static Connection Conectar() {
		try {
			Class.forName("org.postgresql.Driver");
			connection = DriverManager.getConnection(url, usuario, password);
			System.out.println("conectou");

		} catch (SQLException | ClassNotFoundException e) {

			e.printStackTrace();
		}
		return connection;
	}
}
