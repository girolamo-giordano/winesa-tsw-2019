package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.Cart;
import it.unisa.model.ModelProductBuy;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductBuy;
import it.unisa.model.ProductModelDM;
import it.unisa.model.UtenteRegistrato;

/**
 * Servlet implementation class BuyControl
 */
@WebServlet("/BuyControl")
public class BuyControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ModelProductBuy model =new ModelProductBuy();
	static ProductModelDM model2=new ProductModelDM();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyControl() {
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
		@SuppressWarnings("unchecked")
		Cart<ProductBean> cart=(Cart<ProductBean>)request.getSession().getAttribute("cart");
		if(cart==null)
		{
			response.sendError(409);
			return;
		}
		List<ProductBean>prodcart=cart.getItems();
		
		if(ur==null)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			for(ProductBean prod:prodcart)
			{
				ProductBean pb2=new ProductBean();
				ProductBuy pb=new ProductBuy();
				pb.setQuantity(prod.getQuantity());
				pb.setName(prod.getName());
				pb.SetType(prod.getType());
				pb.setDescription(prod.getDescription());
				pb.setFoto(prod.getFoto());
				pb.setPrice(prod.getPrice());
				pb.setCodut(ur.getCode());
				pb.setCodpr(prod.getCode());
				System.out.println(prod.getCode());
				try {
					pb2=model2.doRetrieveByKey(prod.getCode());
					int quant=prod.getQuantity();
					int quant2=pb2.getQuantity();
					if(pb2.getQuantity()<pb.getQuantity())
					{
						response.sendError(404);
						return;
					}
					pb2.setQuantity(quant2-quant);
					model2.doUpdate(pb2);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				try {
					model.doSave(pb);
					response.sendRedirect("buysuccess.jsp");
					return;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			request.getSession(false).setAttribute("cart", null);
			try {
				request.getSession(false).setAttribute("prodacq", model.doRetrieveByKey(ur.getCode()));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
