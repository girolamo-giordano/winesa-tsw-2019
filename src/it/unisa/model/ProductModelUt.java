package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ProductModelUt implements ProductModel<UtenteRegistrato> {
	

	@Override
	public UtenteRegistrato doRetrieveByKey(int code) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<UtenteRegistrato> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<UtenteRegistrato> products = new LinkedList<UtenteRegistrato>();
		String selectSQL = "SELECT * FROM utente";
		
		if(order != null && !order.equals(""))
			selectSQL += " ORDER BY " + order;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				UtenteRegistrato ur1= new UtenteRegistrato();
				ur1.setCode(rs.getInt("code"));
				ur1.setUtente(rs.getString("utente"));
				ur1.setPassword(rs.getString("password"));
				ur1.setCitta(rs.getString("citta"));
				ur1.setCognome(rs.getString("cognome"));
				ur1.setEmail(rs.getString("email"));
				ur1.setIndirizzo(rs.getString("indirizzo"));
				ur1.setNome(rs.getString("name"));
				
				products.add(ur1);
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return products;
	}

	@Override
	public void doSave(UtenteRegistrato ur) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String insertSQL="INSERT INTO utente "+ " (NAME,COGNOME,EMAIL,INDIRIZZO,CITTA,UTENTE,PASSWORD) "+ " VALUES (?, ?, ?, ?,?,?,?)";
		
		try {
			connection=DriverManagerConnectionPool.getConnection();
			preparedStatement=connection.prepareStatement(insertSQL);
			preparedStatement.setString(1,ur.getNome());
			preparedStatement.setString(2,ur.getCognome());
			preparedStatement.setString(3,ur.getEmail());
			preparedStatement.setString(4,ur.getIndirizzo());
			preparedStatement.setString(5,ur.getCitta());
			preparedStatement.setString(6,ur.getUtente());
			preparedStatement.setString(7,ur.getPassword());
			
			System.out.println("doSave: "+preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			connection.commit();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally 
	{
		try { 
		if(preparedStatement != null)
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		try {
			DriverManagerConnectionPool.releaseConnection(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(UtenteRegistrato ur) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		String updateSQL="UPDATE utente SET"+" name=?, cognome=?, email=?, indirizzo=?, citta=?, utente=?, password=? "+" WHERE utente = ?";
		try {
				connection=DriverManagerConnectionPool.getConnection();
				preparedStatement=connection.prepareStatement(updateSQL);
				preparedStatement.setString(1,ur.getNome());
				preparedStatement.setString(2,ur.getCognome());
				preparedStatement.setString(3,ur.getEmail());
				preparedStatement.setString(4,ur.getIndirizzo());
				preparedStatement.setString(5,ur.getCitta());
				preparedStatement.setString(6,ur.getUtente());
				preparedStatement.setString(7, ur.getPassword());
				preparedStatement.setString(8,ur.getUtente());
				System.out.println("doUpdate: "+preparedStatement.toString());
				preparedStatement.executeUpdate();
				
				connection.commit();

		}
		finally 
		{
			try { 
			if(preparedStatement != null)
				preparedStatement.close();
			}finally {
			DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}

	@Override
	public boolean doDelete(UtenteRegistrato product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
