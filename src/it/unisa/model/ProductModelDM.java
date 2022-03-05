package it.unisa.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.sql.Connection;


public class ProductModelDM implements ProductModel<ProductBean> {
	@Override
	public ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ProductBean bean = new ProductBean();
		String selectSQL = "SELECT * FROM product WHERE CODE = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				bean.setCode(rs.getInt("code"));
				bean.setName(rs.getString("name"));
				bean.setDescription(rs.getString("description"));
				bean.SetType(rs.getString("tipo"));
				bean.setPrice(rs.getFloat("price"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setAnno(rs.getInt("anno"));
				bean.setRegione(rs.getString("regione"));
				bean.setFoto(rs.getBytes("foto"));
			}	
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return bean;
	}

	@Override
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		String selectSQL = "SELECT * FROM product";
		
		if(order != null && !order.equals(""))
			selectSQL += " ORDER BY " + order;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("code"));
				bean.setName(rs.getString("name"));
				bean.setDescription(rs.getString("description"));
				bean.SetType(rs.getString("tipo"));
				bean.setPrice(rs.getFloat("price"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setAnno(rs.getInt("anno"));
				bean.setRegione(rs.getString("regione"));
				bean.setFoto(rs.getBytes("foto"));
				
				products.add(bean);
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
	public void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String selectSQL = "INSERT INTO product (name, description, tipo,price, quantity,anno,regione,foto) VALUES (?,?, ?, ?, ?, ?,?,?)";
		
		

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setString(3,product.getType());
			preparedStatement.setFloat(4, product.getPrice());
			preparedStatement.setInt(5, product.getQuantity());
			preparedStatement.setInt(6, product.getAnno());
			preparedStatement.setString(7, product.getRegione());
			preparedStatement.setBytes(8, product.getFoto());
			
			System.out.println("doSave: " + preparedStatement.toString());
			
			preparedStatement.executeUpdate();
			connection.commit();
		} finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			} finally {
				
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
	}

	@Override
	public void doUpdate(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		String updateSQL = "UPDATE product SET name = ?, description = ?, price = ?, quantity = ?, anno=?,regione=?,foto=? WHERE code = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, product.getName());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setFloat(3, product.getPrice());
			preparedStatement.setInt(4, product.getQuantity());
			preparedStatement.setInt(5, product.getAnno());
			preparedStatement.setString(6, product.getRegione());
			preparedStatement.setBytes(7, product.getFoto());
			preparedStatement.setInt(8, product.getCode());
			
			System.out.println("doUpdate: " + preparedStatement.toString());
			
			preparedStatement.executeUpdate();
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
	public boolean doDelete(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result=0;
		int pass=2;
		String deleteSql="DELETE FROM product WHERE CODE=?";
		String deleteSql2="DELETE FROM recensioni WHERE id_product=?";
		try {
			while(pass>0)
			{
				if(pass==2)
				{
					connection= DriverManagerConnectionPool.getConnection();
					preparedStatement=connection.prepareStatement(deleteSql2);
					preparedStatement.setInt(1, product.getCode());
					preparedStatement.executeUpdate();
					connection.commit();
					preparedStatement.close();
					pass=1;
				}
				if(pass==1)
				{
					connection= DriverManagerConnectionPool.getConnection();
					preparedStatement= connection.prepareStatement(deleteSql);
					preparedStatement.setInt(1,product.getCode());
					System.out.println("doDelete: "+ preparedStatement.toString());
					result= preparedStatement.executeUpdate();
					connection.commit();
					pass=0;
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
		return (result!=0);
	}
	
	public Collection<ProductBean> doRetrieveType(String order,String ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> products = new LinkedList<ProductBean>();
		String selectSQL = "SELECT * FROM product WHERE tipo = ?";
		if(ordine != null && !ordine.equals(""))
			selectSQL += " ORDER BY " + ordine;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1,order);
			
			System.out.println("doRetrieveAll: " + preparedStatement.toString());
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("code"));
				bean.setName(rs.getString("name"));
				bean.setDescription(rs.getString("description"));
				bean.SetType(rs.getString("tipo"));
				bean.setPrice(rs.getFloat("price"));
				bean.setQuantity(rs.getInt("quantity"));
				bean.setAnno(rs.getInt("anno"));
				bean.setRegione(rs.getString("regione"));
				bean.setFoto(rs.getBytes("foto"));
				
				products.add(bean);
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
}
