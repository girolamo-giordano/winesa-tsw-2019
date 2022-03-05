package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ModelRecensArray;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;
import it.unisa.model.Recensione;

/**
 * Servlet implementation class SelProdContr
 */
@WebServlet("/SelProdContr")
public class SelProdContr extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelDM model=new ProductModelDM();
	static ModelRecensArray model2=new ModelRecensArray();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelProdContr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_prod=Integer.parseInt(request.getParameter("id_prod"));
		ProductBean pb=new ProductBean();
		ArrayList<Recensione>lrec=new ArrayList<Recensione>();
		try {
			pb=model.doRetrieveByKey(id_prod);
			if(pb.getType()==null)
			{
				response.sendError(404);
				return;
			}
			lrec=model2.doRetrieveByKey(id_prod);
			request.setAttribute("prodcom", pb);
			request.setAttribute("lisrec",lrec);
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/prodosel.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
