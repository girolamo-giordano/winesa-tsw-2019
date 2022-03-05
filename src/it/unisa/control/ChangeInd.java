package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModelUt;
import it.unisa.model.UtenteRegistrato;

/**
 * Servlet implementation class ChangeInd
 */
@WebServlet("/ChangeInd")
public class ChangeInd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelUt model=new ProductModelUt();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInd() {
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
		UtenteRegistrato ur=new UtenteRegistrato();
		ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
		String indir=request.getParameter("indir");
		if(indir==null)
		{
			response.sendError(406);
			return;
		}
		if(ur==null)
		{
			response.sendError(407);
			return;
		}
		else
		{
			ur.setIndirizzo(indir);
			try {
				model.doUpdate(ur);
				response.sendRedirect("changemailsucc.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
	}

}
