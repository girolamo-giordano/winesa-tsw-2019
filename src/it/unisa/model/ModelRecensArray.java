package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public class ModelRecensArray implements ProductModelArray<Recensione> {

	@Override
	public ArrayList<Recensione> doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		//Bean da restituire in output
		ArrayList<Recensione> lpb=new ArrayList<Recensione>();
		//Stringa di selezione parametrica dal database
		String selectSQL = "SELECT * FROM recensioni WHERE id_product = ?";
		
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
				Recensione pb = new Recensione();
				//Setto tutti i parametri
				pb.setTitolo(rs.getString("titolo"));
				pb.setStelle(rs.getInt("stelle"));
				pb.setDescrizione(rs.getString("description"));
				pb.setNomeut(rs.getString("nomeut"));
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
	public Collection<Recensione> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void doSave(Recensione product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Recensione product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doDelete(Recensione product) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
