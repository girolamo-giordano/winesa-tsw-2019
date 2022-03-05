package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;

/**
 * Servlet implementation class GetInfoVino
 */
@WebServlet("/GetInfoVino")
public class GetInfoVino extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ProductModelDM pmd=new ProductModelDM();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInfoVino() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		String tipi=request.getParameter("tipi");
		String anno=request.getParameter("anno");
		if(action != null)
		{
			Collection<ProductBean> lbeans=new LinkedList<ProductBean>();
			try {
				lbeans=pmd.doRetrieveAll(null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(tipi != null)
			{
				boolean trovato=true;
				ArrayList<ProductBean> lis=new ArrayList<ProductBean>();
				ArrayList<ProductBean> lis2=new ArrayList<ProductBean>();
				ArrayList<ProductBean> lis3=new ArrayList<ProductBean>();
				for(ProductBean pb:lbeans)
				{
					if(pb.getType().equals(tipi))
					{
						lis.add(pb);
					}
				}
				for(int i=0;i<lis.size();i++)
				{
					if(lis2.isEmpty())
					{
						lis2.add(lis.get(0));
					}
					for(int j=0;j<lis2.size();j++)
					{
						if(lis.get(i).getAnno()==lis2.get(j).getAnno())
							trovato=false;
					}
					if(trovato)
					{
						lis2.add(lis.get(i));
					}
					trovato=true;
				}
				if(anno != null)
				{
					for(int i=0;i<lis.size();i++)
					{
						if(lis3.isEmpty())
						{
							lis3.add(lis.get(0));
						}
						for(int j=0;j<lis3.size();j++)
						{
							if(lis.get(i).getAnno()!=Integer.parseInt(anno) || lis.get(i).getRegione().equals(lis3.get(j).getRegione()))
									trovato=false;
						}
						if(trovato)
						{
							lis3.add(lis.get(i));
						}
						trovato=true;
					}
					Gson gson = new Gson();
					String listaTipiJson = gson.toJson(lis3);
					response.getWriter().write(listaTipiJson);
					return;
				}
				Gson gson = new Gson();
				String listaTipiJson = gson.toJson(lis2);
				response.getWriter().write(listaTipiJson);
			}
				
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regioni=request.getParameter("regioni");
		String tipi=request.getParameter("tipi");
		String anni=request.getParameter("anni");
		Collection<ProductBean> lbeans=new LinkedList<ProductBean>();
		ArrayList<ProductBean> lis=new ArrayList<ProductBean>();
		try {
			lbeans=pmd.doRetrieveAll(null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(tipi.equals("----"))
		{
			
		}
		else
		{
			if(anni.equals("----"))
			{
				for(ProductBean aa:lbeans)
				{
					if(aa.getType().equals(tipi))
						lis.add(aa);
				}
				request.setAttribute("products", lis);
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				if(regioni.equals("----"))
				{
					for(ProductBean aa:lbeans)
					{
						if(aa.getType().equals(tipi) && aa.getAnno()==Integer.parseInt(anni))
						{
							lis.add(aa);
						}
					}
					request.setAttribute("products", lis);
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
				}
				else
				{
					for(ProductBean aa:lbeans)
					{
						if(aa.getType().equals(tipi) && aa.getAnno()==Integer.parseInt(anni) && aa.getRegione().equals(regioni))
						{
							lis.add(aa);
						}
					}
					request.setAttribute("products", lis);
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
				}
			}
		}
	}

}
