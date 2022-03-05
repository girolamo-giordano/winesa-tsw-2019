package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ModelProductBuy implements ProductModelArray<ProductBuy> {

	@Override
	public ArrayList<ProductBuy> doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Bean da restituire in output
		ArrayList<ProductBuy> lpb=new ArrayList<ProductBuy>();
		//Stringa di selezione parametrica dal database
		String selectSQL = "SELECT * FROM prodacq WHERE id_utente = ?";
		
		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			//Eseguo il preparedStatement e ne salvo l'output anche se so che l'output è uno solo
			ResultSet rs = preparedStatement.executeQuery();
			
			//Visito la risposta col while anche se so che avrò un unico valore, lo faccio per sicurezza
			while(rs.next()) {
				ProductBuy pb = new ProductBuy();
				//Setto tutti i parametri
				pb.setCode(rs.getInt("code"));
				pb.setCodut(rs.getInt("id_utente"));
				pb.setCodpr(rs.getInt("id_product"));
				pb.setName(rs.getString("name"));
				pb.setDescription(rs.getString("description"));
				pb.SetType(rs.getString("tipo"));
				pb.setPrice(rs.getFloat("price"));
				pb.setQuantity(rs.getInt("quantity"));
				pb.setAnno(rs.getInt("anno"));
				pb.setRegione(rs.getString("regione"));
				pb.setFoto(rs.getBytes("foto"));
				lpb.add(pb);
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
		
		return lpb;
	}

	@Override
	public Collection<ProductBuy> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(ProductBuy product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Stringa di inserimento parametrica dal database
		//Non inserisco a mano code perchè è un int autoincrement
		String selectSQL = "INSERT INTO prodacq (id_utente,id_product,name, description, tipo,price, quantity,anno,regione,foto) VALUES (?,?, ?,?,?, ?, ?, ?,?,?)";
		
		/*Stringa per provare a generare un'errore
		 String selectSQL = "INSERT INTO product2 (name, description, price, quantity) VALUES (?, ?, ?, ?)";
		 */

		//Mi serve per rilasciare sicuramente le risorse
		try {
			//Istanzio una connessione usando il mio DriverManager
			connection = DriverManagerConnectionPool.getConnection();
			//Preparo lo statement
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1,product.getCodut());
			preparedStatement.setInt(2, product.getCodpr());
			preparedStatement.setString(3, product.getName());
			preparedStatement.setString(4, product.getDescription());
			preparedStatement.setString(5,product.getType());
			preparedStatement.setFloat(6, product.getPrice());
			preparedStatement.setInt(7, product.getQuantity());
			preparedStatement.setInt(8, product.getAnno());
			preparedStatement.setString(9, product.getRegione());
			preparedStatement.setBytes(10, product.getFoto());
			
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(ProductBuy product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(ProductBuy product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
