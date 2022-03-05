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
 * Servlet implementation class ChangePsw
 */
@WebServlet("/ChangePsw")
public class ChangePsw extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelUt model= new ProductModelUt();
    static ModelAdm modelA= new ModelAdm();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePsw() {
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
		// TODO Auto-generated method stub
		UtenteRegistrato ur=new UtenteRegistrato();
		ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
		AdminRegistrato ar=new AdminRegistrato();
		ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
		String vpsw=request.getParameter("vpsw");
		String cpsw=request.getParameter("cpsw");
		String npsw=request.getParameter("npsw");
		if(vpsw==null || cpsw== null || npsw==null)
		{
			response.sendError(406);
			return;
		}
		
		if(ur==null && ar==null)
		{
			response.sendError(407);
			return;
		}
		
		if(!(cpsw.equals(npsw)))
		{
			response.sendError(408);
			return;
		}
		
		if(vpsw.equals(npsw))
		{
			response.sendError(408);
			return;
		}
		
		else if(ar == null && ur !=null)
		{
			if(!(vpsw.equals(ur.getPassword())))
			{
				response.sendError(408);
				return;
			}
			ur.setPassword(npsw);
			try {
				model.doUpdate(ur);
				response.sendRedirect("changepasswordsucc.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(ar != null && ur==null)
		{
			if(!(vpsw.equals(ar.getPassword())))
			{
				response.sendError(408);
				return;
			}
			ar.setPassword(npsw);
			try {
				modelA.doUpdate(ar);
				response.sendRedirect("changepasswordsucc.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
