package it.unisa.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class DriverManagerConnectionPool {

	private static List<Connection> freeDbConnections;

	static {
		freeDbConnections = new LinkedList<Connection>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("DB driver not found:"+ e.getMessage());
		} 
	}
	
	private static synchronized Connection createDBConnection() throws SQLException {
		Connection newConnection = null;
		String ip = "localhost";
		String port = "3306";
		String db = "shopbd";
		String username = "root";
		String password = "ciao1998";

		newConnection = DriverManager.getConnection("jdbc:mysql://"+ ip+":"+ 
				port+"/"+db+"?serverTimezone=UTC", username, password);
				//Per sistemare il problema della time zone senza usare il prompt di MySQL
				  //port+"/"+db+"?serverTimezone=UTC", username, password);

		System.out.println("Create a new DB connection");
		//significa che per rendere definitivo un inserimento devo eseguire il commit esplicitamente
		//questo non va fatto per le select che leggono soltanto, ma per gli inserimenti, le cancellazioni e gli update
		newConnection.setAutoCommit(false);
		return newConnection;
	}	
	
	public static synchronized Connection getConnection() throws SQLException {
		Connection connection;

		if (!freeDbConnections.isEmpty()) {
			connection = (Connection) freeDbConnections.get(0);
			freeDbConnections.remove(0);

			try {
				if (connection.isClosed())
					connection = getConnection();
			} catch (SQLException e) {
				connection.close();
				connection = getConnection();
			}
		} else {
			connection = createDBConnection();		
		}

		return connection;
	}
	
	public static synchronized void releaseConnection(Connection connection) 
			throws SQLException {
		if(connection != null) 
			freeDbConnections.add(connection);
	}	
	
	
}
