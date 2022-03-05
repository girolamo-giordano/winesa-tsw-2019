package it.unisa.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import it.unisa.model.*;


public class PhotoControl {
	
	public synchronized static byte[] load(String id) throws SQLException {
		Connection connection=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		byte[] bt=null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			String sql="SELECT foto FROM product WHERE code= " + id;
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
	
	public synchronized static void upload(String idA, String foto) throws SQLException 
	{
		Connection con= null;
		PreparedStatement stmt = null;
		try {
			con= DriverManagerConnectionPool.getConnection();
			stmt = con.prepareStatement("UPDATE product SET foto=? WHERE code=?");
			File file= new File(foto);
			try {
				 FileInputStream fis= new FileInputStream(file);
				 stmt.setBinaryStream(1, fis,fis.available());
				 stmt.setString(2, idA);
				 stmt.executeUpdate();
				 con.commit();
			}catch(IOException e) {
				
			}
		}finally {
			try {
				if(stmt  != null)
					stmt.close();
			}catch(SQLException sqlException) {
				
			}finally {
				if(con != null)
					DriverManagerConnectionPool.releaseConnection(con);
			}
		}
		
	}

}
