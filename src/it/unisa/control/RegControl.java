package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModelUt;
import it.unisa.model.UtenteRegistrato;

/**
 * Servlet implementation class RegControl
 */
@WebServlet("/RegControl")
public class RegControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelUt model=new ProductModelUt();

    /**
     * Default constructor. 
     */
    public RegControl() {
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
		String nome=request.getParameter("name");
		String cognome=request.getParameter("cognome");
		String ind=request.getParameter("indirizzo");
		String citta=request.getParameter("citta");
		String email=request.getParameter("email");
		String utente=request.getParameter("username");
		String password=request.getParameter("password");
		if(nome==null || cognome == null ||ind == null || citta==null || email==null || utente==null || password==null)
		{
			response.sendError(402);
			return;
		}
		Collection<UtenteRegistrato> lir;
		try {
			lir=(Collection<UtenteRegistrato>) model.doRetrieveAll(null);
			if(lir != null)
			{
				for(UtenteRegistrato ao:lir)
				{
					if(ao.getUtente().equals(utente))
					{
						response.sendError(410);
						return;
					}
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		UtenteRegistrato ur=new UtenteRegistrato();
		ur.setNome(nome);
		ur.setCognome(cognome);
		ur.setIndirizzo(ind);
		ur.setCitta(citta);
		ur.setEmail(email);
		ur.setUtente(utente);
		ur.setPassword(password);
		try {
			model.doSave(ur);
			response.sendRedirect("regiSuccess.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
