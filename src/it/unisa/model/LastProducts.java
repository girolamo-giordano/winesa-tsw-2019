package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class LastProducts {
	
	private ArrayList<ProductBean> lipro=new ArrayList<ProductBean>();
	
	public LastProducts() {
		
	}
	
	public ArrayList<ProductBean> getLast() throws SQLException
	{
		int codes = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM product";
		
	
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				codes=rs.getInt("code");
			}
			String selectSQLl = "SELECT * FROM product WHERE CODE = ?";
			
			for(int i=0;i<4;i++)
			{
				ProductBean bean = new ProductBean();
				try {
					connection = DriverManagerConnectionPool.getConnection();
					preparedStatement = connection.prepareStatement(selectSQLl);
					preparedStatement.setInt(1, codes);
					
				
					ResultSet rss = preparedStatement.executeQuery();
					
					while(rss.next()) {
						bean.setCode(rss.getInt("code"));
						bean.setName(rss.getString("name"));
						bean.setDescription(rss.getString("description"));
						bean.SetType(rss.getString("tipo"));
						bean.setPrice(rss.getFloat("price"));
						bean.setQuantity(rss.getInt("quantity"));
						bean.setAnno(rss.getInt("anno"));
						bean.setRegione(rss.getString("regione"));
						bean.setFoto(rss.getBytes("foto"));
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
