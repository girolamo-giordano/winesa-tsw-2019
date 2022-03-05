package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LastRecensioni {
	
private ArrayList<Recensione> lipro=new ArrayList<Recensione>();
	
	public LastRecensioni() {
		
	}
	
	public ArrayList<Recensione> getLast() throws SQLException
	{
		int codes = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM recensioni";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				codes=rs.getInt("code");
			}
			String selectSQLl = "SELECT * FROM recensioni WHERE CODE = ?";
			
			for(int i=0;i<4;i++)
			{
				Recensione bean = new Recensione();
				try {
					connection = DriverManagerConnectionPool.getConnection();
					preparedStatement = connection.prepareStatement(selectSQLl);
					preparedStatement.setInt(1, codes);
					
					
					ResultSet rss = preparedStatement.executeQuery();
					
					while(rss.next()) {
						bean.setCode(rss.getInt("code"));
						bean.setId_utente(rss.getInt("id_utente"));
						bean.setId_product(rss.getInt("id_product"));
						bean.setNomeut(rss.getString("nomeut"));
						bean.setTitolo(rss.getString("titolo"));
						bean.setDescrizione(rss.getString("description"));
						bean.setStelle(rss.getInt("stelle"));
					}
					codes--;
					lipro.add(bean);
				}finally {
					
				}
			}
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
	
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return lipro;
	}

}
