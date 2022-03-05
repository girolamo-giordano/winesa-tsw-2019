package it.unisa.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.unisa.model.DriverManagerConnectionPool;

public class PhotoControlAcq {
	
	public synchronized static byte[] load(String id) throws SQLException {
		Connection connection=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		byte[] bt=null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			String sql="SELECT foto FROM prodacq WHERE code= " + id;
			System.out.println(sql);
			stmt= connection.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			if(rs.next()) {
				bt=rs.getBytes("foto");
			}
		}catch(SQLException sqlException) {
			
		}
			finally {
				try {
					if(stmt!= null)
						stmt.close();
				} catch(SQLException sqlException)
				{
					
				}finally {
					if(connection != null)
						DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
		return bt;
	}
}
