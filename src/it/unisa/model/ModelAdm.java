package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ModelAdm implements ProductModel<AdminRegistrato> {

	@Override
	public AdminRegistrato doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<AdminRegistrato> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<AdminRegistrato> products = new LinkedList<AdminRegistrato>();
		//Stringa di selezione dal database
		String selectSQL = "SELECT * FROM admins";
		
		//Controllo se il parametro order è valido e, in tal caso, eseguo l'ordinamento direttamente dal database
		if(order != null && !order.equals(""))
			selectSQL += " ORDER BY " + order;
		
		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement e ne salvo l'output
			ResultSet rs = preparedStatement.executeQuery();
			
			//Visito tupla per tupla la risposta
			while(rs.next()) {
				AdminRegistrato ar1= new AdminRegistrato();
				ar1.setUtente(rs.getString("utente"));
				ar1.setPassword(rs.getString("password"));
				ar1.setEmail(rs.getString("email"));
				ar1.setNome(rs.getString("name"));
				ar1.setCognome(rs.getString("cognome"));
				
				//Aggiungo il bean che ho appena creato alla Collezione
				products.add(ar1);
			}	
		} finally {
			try {
				//Rilascio il preparedStatement
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				//Se rilascio fuori dal try finally più interno la connessione se venisse lanciata un'eccezione
				//dalla chiusura di preparedStatement la connessione non verrebbe rilasciata
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return products;
	}

	@Override
	public void doSave(AdminRegistrato product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(AdminRegistrato ar) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE admins SET"+" name=?, cognome=?, email=?, utente=?, password=?  "+" WHERE utente = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				
				preparedStatement.setString(1,ar.getNome());
				preparedStatement.setString(2,ar.getCognome());
				preparedStatement.setString(3,ar.getEmail());
				preparedStatement.setString(4,ar.getUtente());
				preparedStatement.setString(5, ar.getPassword());
				preparedStatement.setString(6,ar.getUtente());
				System.out.println("doUpdate: "+preparedStatement.toString());
				preparedStatement.executeUpdate();
				
				connection.commit();

		}
		finally //uso il try solo per il finally, così da rilasciare tutte le risorse
		{
			try { //potrebbe esserci un eccezione alla preparedstatement riguardante la connessione
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}

	@Override
	public boolean doDelete(AdminRegistrato product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
