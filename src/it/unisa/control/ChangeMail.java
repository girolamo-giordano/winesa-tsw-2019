package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AdminRegistrato;
import it.unisa.model.ModelAdm;
import it.unisa.model.ProductModelUt;
import it.unisa.model.UtenteRegistrato;

/**
 * Servlet implementation class ChangeMail
 */
@WebServlet("/ChangeMail")
public class ChangeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelUt model =new ProductModelUt();
	static ModelAdm model2=new ModelAdm();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeMail() {
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
		AdminRegistrato ar= new AdminRegistrato();
		ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
		String email=request.getParameter("email");
		String email2=request.getParameter("email2");
		if(email == null || email2== null)
		{
			response.sendError(406);
			return;
		}
		
		if(!(email.equals(email2)))
		{
			response.sendError(408);
			return;
		}
		if(ur==null && ar== null)
		{
			response.sendError(407);
			return;
		}
		else if(ur== null && ar!=null)
		{
			ar.setEmail(email);
			try {
				model2.doUpdate(ar);
				response.sendRedirect("changemailsucc.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		else if(ar== null && ur!= null)
		{
			ur.setEmail(email);
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
