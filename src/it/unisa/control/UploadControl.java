package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import it.unisa.model.DriverManagerConnectionPool;

/**
 * Servlet implementation class UploadControl
 */
@WebServlet("/UploadControl")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
		maxFileSize=1024*1024*10,
		maxRequestSize=1024*1024*50)
public class UploadControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart=request.getPart("file");
		String description=request.getParameter("name");
		System.out.println(description);
		InputStream is=filePart.getInputStream();
		byte[] bytes=is.readAllBytes();
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String insertSql="INSERT INTO foto"+"(foto)"+"VALUES(?)";
		try {
			connection=DriverManagerConnectionPool.getConnection();
			preparedStatement=connection.prepareStatement(insertSql);
			preparedStatement.setBytes(1, bytes);
			preparedStatement.executeUpdate();
			connection.commit();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally //uso il try solo per il finally, così da rilasciare tutte le risorse
		{
			try { //potrebbe esserci un eccezione alla preparedstatement riguardante la connessione
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

		ServletOutputStream sos=response.getOutputStream();
		if(bytes!=null)
		{
			sos.write(bytes);
			response.setContentType("image/*");
		}
		sos.close();
	}

}
