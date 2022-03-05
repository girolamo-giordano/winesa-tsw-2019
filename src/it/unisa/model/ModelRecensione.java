package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

public class ModelRecensione implements ProductModel<Recensione> {

	@Override
	public Recensione doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Recensione> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Recensione product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO recensioni (id_utente,id_product,nomeut,titolo,description,stelle) VALUES (?, ?,?, ?, ?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, product.getId_utente());
			preparedStatement.setInt(2, product.getId_product());
			preparedStatement.setString(3, product.getNomeut());
			preparedStatement.setString(4,product.getTitolo());
			preparedStatement.setString(5, product.getDescrizione());
			preparedStatement.setInt(6, product.getStelle());
			
			System.out.println("doSave: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement inserendo i dati all'interno del database
			preparedStatement.executeUpdate();
			//rendo effettivo l'inserimento (azione necessaria perchè ho settato l'autocommit a false nel driver manager)
			connection.commit();
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
		
	}

	@Override
	public void doUpdate(Recensione product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Recensione product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result=0;
		String deleteSql="DELETE FROM recensioni WHERE CODE=?";
		try {
			connection= DriverManagerConnectionPool.getConnection();
			preparedStatement= connection.prepareStatement(deleteSql);
			preparedStatement.setInt(1,product.getCode());
			System.out.println("doDelete: "+ preparedStatement.toString());
			result= preparedStatement.executeUpdate();
			connection.commit();
		}finally {
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
		return (result!=0);
	}

}
