package it.unisa.model;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ModelRecensione;
import it.unisa.model.Recensione;

/**
 * Servlet implementation class RecensControl
 */
@WebServlet("/RecensControl")
public class RecensControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ModelRecensione model=new ModelRecensione();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecensControl() {
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
		int id_u=Integer.parseInt(request.getParameter("id_u"));
		int id_p=Integer.parseInt(request.getParameter("id_p"));
		String descr=request.getParameter("comments");
		int stelle=Integer.parseInt(request.getParameter("vstelle"));
		String titolo=request.getParameter("titr");
		String nomeut=request.getParameter("nomeut");
		if(id_u==0||id_p==0||descr==null||stelle==0|| titolo==null||nomeut==null)
		{
			response.sendError(406);
			return;
		}
		Recensione rec=new Recensione();
		rec.setId_product(id_p);
		rec.setId_utente(id_u);
		rec.setDescrizione(descr);
		rec.setTitolo(titolo);
		rec.setStelle(stelle);
		rec.setNomeut(nomeut);
		try {
			model.doSave(rec);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/buysuccess.jsp");
			//Chiamo il forward perchè non ho modificato la response, ma solo la request
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
