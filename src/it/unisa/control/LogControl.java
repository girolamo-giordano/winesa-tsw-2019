package it.unisa.control;

import java.util.Collection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AdminRegistrato;
import it.unisa.model.ModelAdm;
import it.unisa.model.ModelProductBuy;
import it.unisa.model.ProductBuy;
import it.unisa.model.ProductModelUt;
import it.unisa.model.UtenteRegistrato;

/**
 * Servlet implementation class LogControl
 */
@WebServlet("/LogControl")
public class LogControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ModelProductBuy model =new ModelProductBuy();
	static ProductModelUt model1=new ProductModelUt();
	static ModelAdm model2=new ModelAdm();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogControl() {
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
		String utc=request.getParameter("sceltaP");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		if(username==null || password==null)
		{
			response.sendError(406);
			return;
		}
		if(utc.equals("Utente"))
		{
			UtenteRegistrato ur= new UtenteRegistrato();
			ArrayList<ProductBuy>lpb=new ArrayList<ProductBuy>();
			Collection<UtenteRegistrato> coll=new LinkedList<UtenteRegistrato>();
			try {
				coll=model1.doRetrieveAll(null);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			ur.setUtente(username);
			ur.setPassword(password);
			boolean logged=false;
				for(UtenteRegistrato ur1:coll)
				{
					if((ur.getUtente().equals(ur1.getUtente())) && (ur.getPassword().equals(ur1.getPassword())))
							{
								ur.setCode(ur1.getCode());
								ur.setCitta(ur1.getCitta());
								ur.setEmail(ur1.getEmail());
								ur.setIndirizzo(ur1.getIndirizzo());
								ur.setNome(ur1.getNome());
								ur.setCognome(ur1.getCognome());
								logged=true;
								try {
									lpb=model.doRetrieveByKey(ur.getCode());
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								request.getSession().setAttribute("utente",ur);
								request.getSession().setAttribute("prodacq",lpb);
								response.sendRedirect("loginsucc.jsp");
							}
				}
				if(!logged)
				{
					response.sendError(406);
					return;
				}
		}
		if(utc.equals("Admin"))
		{
			AdminRegistrato ar= new AdminRegistrato();
			ar.setUtente(username);
			ar.setPassword(password);
			Collection<AdminRegistrato> coll=new LinkedList<AdminRegistrato>();
			boolean logged=false;
			try {
				coll=model2.doRetrieveAll(null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for(AdminRegistrato ar1:coll)
			{
					if((ar.getUtente().equals(ar1.getUtente())) && (ar.getPassword().equals(ar1.getPassword())))
							{
								ar.setEmail(ar1.getEmail());
								ar.setNome(ar1.getNome());
								ar.setCognome(ar1.getCognome());
								logged=true;
								request.getSession().setAttribute("admin",ar);
								response.sendRedirect("loginsucc.jsp");
							}
				if(!logged)
				{
					response.sendError(406);
					return;
				}
			}
		}
	}

}
