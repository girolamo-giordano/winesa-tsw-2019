package it.unisa.control;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

//import com.sun.xml.internal.ws.api.message.Attachment;

import it.unisa.model.Cart;
import it.unisa.model.ProductBean;
import it.unisa.model.ProductModelDM;

@WebServlet("/ProductControl")
@MultipartConfig(fileSizeThreshold=1024*1024*2,
maxFileSize=1024*1024*10,
maxRequestSize=1024*1024*50)
public class ProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//Statica perchè mi serve uguale per tutti
	private static ProductModelDM model = new ProductModelDM();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	ArrayList<ProductBean> prodotti= new ArrayList<ProductBean>();
		@SuppressWarnings("unchecked")
		Cart <ProductBean> cart=(Cart<ProductBean>) request.getSession().getAttribute("carrello");
		
		if(cart==null) {
			cart=new Cart<ProductBean>();
			request.getSession().setAttribute("carrello",cart);
		}
		
		String action = request.getParameter("action");
		String pref=request.getParameter("pref");
		String tipo=request.getParameter("tipo");
		
		
		try {
			if(action != null) {
				if(action.equalsIgnoreCase("insert")) {
					String name = request.getParameter("name");
					String description = request.getParameter("descrizione");
					String type= request.getParameter("tipo");
					float price;
					int quantity;
					int anno;
					try {
						price = Float.parseFloat(request.getParameter("prezzo"));
						quantity = Integer.parseInt(request.getParameter("quantita"));
						anno=Integer.parseInt(request.getParameter("anno"));
					}catch(NumberFormatException e)
					{
						response.sendError(411);
						return;
					}
					String regione=request.getParameter("regione");
					if(name==null || description==null || type==null || price==0|| quantity<0|| anno==0 || regione==null)
					{
						response.sendError(406);
						return;
					}
					Part filePart=request.getPart("foto");
					System.out.println(description);
					InputStream is=filePart.getInputStream();
					byte[] bytes=is.readAllBytes();
					Collection<ProductBean>lll;
					lll=(Collection<ProductBean>) model.doRetrieveAll(null);
					if(lll!=null)
					{
						for(ProductBean pp:lll)
						{
							if(pp.getName().equals(name))
							{
								response.sendError(411);
								return;
							}
						}
					}
					ProductBean bean = new ProductBean();
					bean.setName(name);
					bean.setDescription(description);
					bean.SetType(type);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					bean.setAnno(anno);
					bean.setRegione(regione);
					bean.setFoto(bytes);
					
					model.doSave(bean);
					prodotti.add(bean);
					request.getSession().setAttribute("prodotti", prodotti);
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
				}
				else if(action.equalsIgnoreCase("vinobianco"))
				{
					String sort = request.getParameter("sort");
					request.setAttribute("products", model.doRetrieveType("Vino Bianco",sort));
					request.setAttribute("azione","vinobianco");
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
					return;
					
				}
				else if(action.equalsIgnoreCase("vinorosso"))
				{
					String sort = request.getParameter("sort");
					request.setAttribute("products", model.doRetrieveType("Vino Rosso",sort));
					request.setAttribute("azione","vinorosso");
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
					
				}
				else if(action.equalsIgnoreCase("vinorosa"))
				{
					String sort = request.getParameter("sort");
					request.setAttribute("products", model.doRetrieveType("Vino Rosa",sort));
					request.setAttribute("azione","vinorosa");
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
					
				}
				else if(action.equalsIgnoreCase("bollicine"))
				{
					String sort = request.getParameter("sort");
					request.setAttribute("products", model.doRetrieveType("Bollicine",sort));
					request.setAttribute("azione","bollicine");
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
					
				}
				else if(action.equalsIgnoreCase("cerca"))
				{
					String lett=request.getParameter("lett");
					int lungh=lett.length();
					Collection<ProductBean>coll=model.doRetrieveAll(null);
					ArrayList<ProductBean>coll2=new ArrayList<ProductBean>();
					for(ProductBean pb:coll)
					{
						String min=pb.getName().substring(0,lungh);
						if(min.equalsIgnoreCase(lett))
						{
							coll2.add(pb);
						}
					}
					Gson gson = new Gson();
					String listaTipiJson = gson.toJson(coll2);
					response.getWriter().write(listaTipiJson);
					return;
				}
				else if(action.equalsIgnoreCase("details")) {
					int id = Integer.parseInt(request.getParameter("id"));
					
					request.setAttribute("product", model.doRetrieveByKey(id));
				}
				else if(action.equalsIgnoreCase("update")) {
					int id = Integer.parseInt(request.getParameter("id"));
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					float price = Float.parseFloat(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					Part filePart=request.getPart("foto");
					System.out.println(description);
					InputStream is=filePart.getInputStream();
					byte[] bytes=is.readAllBytes();
					ProductBean bean = new ProductBean();
					
					bean.setCode(id);
					bean.setName(name);
					bean.setDescription(description);
					bean.setPrice(price);
					bean.setQuantity(quantity);
					bean.setFoto(bytes);
					
					model.doUpdate(bean);
				} 
				else if(action.equalsIgnoreCase("delete")) {
					int id=Integer.parseInt(request.getParameter("id"));
					model.doRetrieveByKey(id);
					ProductBean bean= model.doRetrieveByKey(id);
					if(bean!=null)
					{
						model.doDelete(bean);
						if(tipo!=null)
						{
							if(tipo.equalsIgnoreCase("vinorosso"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinorosso");
								return;
							}
							if(tipo.equalsIgnoreCase("vinobianco"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinobianco");
								return;
							}
							if(tipo.equalsIgnoreCase("vinorosa"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinorosa");
								return;
							}
							if(tipo.equalsIgnoreCase("bollicine"))
							{
								response.sendRedirect("/esame/ProductControl?action=bollicine");
								return;
							}
						}
							response.sendRedirect("/esame/catalogo.jsp");
					}
				} 
				else if(action.equalsIgnoreCase("addCart")) {
					int id=Integer.parseInt(request.getParameter("id"));
					int qty=Integer.parseInt(request.getParameter("qty"));
					ProductBean bean=model.doRetrieveByKey(id);
					bean.setQuantity(qty);
					float price=bean.getPrice();
					if(bean!=null)
					{
						boolean ch=false;
						List<ProductBean>lp=cart.getItems();
						for(ProductBean pb:lp)
						{	
							if(pb.getCode()==id)
							{
								int q=pb.getQuantity();
								pb.setQuantity(q+qty);
								pb.setPrice(price*qty+pb.getPrice());
								request.getSession().setAttribute("cart", cart);
								ch=true;
							}
						}
						if(!ch)
						{
							bean.setPrice(price*qty);
							cart.addItem(bean);
							request.getSession().setAttribute("cart", cart);
						}
						if(tipo!=null)
						{
							if(tipo.equalsIgnoreCase("vinorosso"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinorosso");
								return;
							}
							if(tipo.equalsIgnoreCase("vinobianco"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinobianco");
								return;
							}
							if(tipo.equalsIgnoreCase("vinorosa"))
							{
								response.sendRedirect("/esame/ProductControl?action=vinorosa");
								return;
							}
							if(tipo.equalsIgnoreCase("bollicine"))
							{
								response.sendRedirect("/esame/ProductControl?action=bollicine");
								return;
							}
							if(tipo.equalsIgnoreCase("selprod"))
							{
								response.sendRedirect("/esame/SelProdContr?id_prod="+id);
								return;
							}
						}
							response.sendRedirect("/esame/catalogo.jsp");
					}
				}
					else if (action.equalsIgnoreCase("deleteCart")) {
					int id=Integer.parseInt(request.getParameter("id"));
					@SuppressWarnings("unchecked")
					Cart <ProductBean> cartt=(Cart<ProductBean>) request.getSession().getAttribute("carrello");
					List<ProductBean>lp=cartt.getItems();
					if(cartt!=null)
					{
						for(ProductBean pb:lp)
						{	
							if(pb.getCode()==id)
							{
								lp.remove(pb);
								request.getSession().setAttribute("cart", cartt);break;
							}
						}
					}
					response.sendRedirect("/esame/carrello.jsp");
					return;
				} else if(action.equalsIgnoreCase("clearCart"))
				{
					cart.deteleAll();
					response.sendRedirect("/esame/carrello.jsp");
					return;
				}
				else {
					request.getSession().setAttribute("carrello",cart);
					request.setAttribute("cart",cart);
					
					String sort = request.getParameter("sort");
					
					try {
						request.removeAttribute("products");
						request.setAttribute("products", model.doRetrieveAll(sort));
					} catch (SQLException e) {
						System.out.println("Error: " + e.getMessage());
						request.setAttribute("error", e.getMessage());
					}
					RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
					dispatcher.forward(request, response);
				}
			}
			else
			{
				request.getSession().setAttribute("carrello",cart);
				request.setAttribute("cart",cart);
				if(pref!= null) {
					 if(pref.equalsIgnoreCase("true"))
						{
							@SuppressWarnings("unchecked")
							ArrayList<ProductBean>lbeans=(ArrayList<ProductBean>)request.getSession(false).getAttribute("preferiti");
							int pl=Integer.parseInt(request.getParameter("code"));
							if(lbeans==null)
							{
								lbeans=new ArrayList<ProductBean>();
								ProductBean beans=model.doRetrieveByKey(pl);
								lbeans.add(beans);
								request.getSession().setAttribute("preferiti",lbeans);
							}
							else
							{
								boolean entro=true;
								ProductBean beans=model.doRetrieveByKey(pl);
								for(ProductBean bb:lbeans)
								{
									if(bb.getCode()==beans.getCode())
									{
										entro=false;
									}
								}
								if(entro)
								{
									lbeans.add(beans);
									request.getSession().setAttribute("preferiti",lbeans);
								}
							}
							
							
						}
					 else if(pref.equalsIgnoreCase("false"))
					 {
						 @SuppressWarnings("unchecked")
						ArrayList<ProductBean>lbeans=(ArrayList<ProductBean>)request.getSession().getAttribute("preferiti");
						 int pl=Integer.parseInt(request.getParameter("code"));
						 for(ProductBean bb:lbeans)
						 {
							 if(bb.getCode()==pl)
							 {
								 lbeans.remove(bb);break;
							 }
						 }
						 request.getSession().setAttribute("preferiti",lbeans);
					 }
					
				}
				
				
				String sort = request.getParameter("sort");
				
				try {
					request.removeAttribute("products");
					request.setAttribute("products", model.doRetrieveAll(sort));
				} catch (SQLException e) {
					System.out.println("Error: " + e.getMessage());
					request.setAttribute("error", e.getMessage());
				}
				RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/catalogo.jsp");
				dispatcher.forward(request, response);


			}
		} catch (SQLException | NumberFormatException e) {
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", e.getMessage());
		}
		if(action==null)
		{
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
