<%@page import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
<%@page import="it.unisa.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<link href="home.css" rel="stylesheet" type="text/css">
<link href="carrello.css" rel="stylesheet" type="text/css">
<meta charset="ISO-8859-1">
<title>Carrello</title>
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

<%
	UtenteRegistrato ur=new UtenteRegistrato();
	ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
	AdminRegistrato ar=new AdminRegistrato();
	ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
	ArrayList<Recensione>lrec=new ArrayList<Recensione>();
	ArrayList<ProductBean>lpb=new ArrayList<ProductBean>();
	final ProductModelDM pddm=new ProductModelDM();
%>
 
<nav>
	<%if(ur==null && ar==null) {%>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>
		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="Login.jsp">Login</a></li>
			<li><a href="registrazione.jsp">Registrati</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png" style="height: 28px; width: 24px"> </a></li>
		</div>
	</ul>
	</div>
	
	<%}else if(ur!=null){ %>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>
		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
			<li id="carr"><a href="carrello.jsp"><img  src ="foto/carrello2.png" style="height: 28px; width: 24px"> </a></li>
		</div>
	</ul>
	</div>
	<%} %>
</nav>



<%
	Cart<ProductBean> cart=(Cart<ProductBean>)request.getSession().getAttribute("cart");
	List<ProductBean>prodcart=null;
	if(cart!=null)
	{
		prodcart=cart.getItems();
	}
%>

<div id="carrello">
<h2>Carrello</h2>
		<form action="BuyControl" method="post">
		<table id=tavola>
		<tr>
			
			<th id="prodotto">PRODOTTO</th>
			<th>Quantità</th>
			<th>Prezzo</th>
		</tr>

		<tr>
		
		<%
		float prezfin=0;
			if(prodcart != null && prodcart.size()>0){
			for(ProductBean prod:prodcart)
			{
				prezfin+=prod.getPrice();
		%>
		
		
			<tr id="sing">
				
				<td id=fotoNome><img alt="" src="./GetPicture?id= <%=prod.getCode() %> ">
				<h3 id="nome"><%=prod.getName()%></h3></td>
				
				
				<td id=quant><%=prod.getQuantity() %></td>
				<td><%=prod.getPrice() %> &#8364 </td>
				<td><a href="ProductControl?action=deleteCart&id=<%=prod.getCode()%>" title="Elimina prodotto dal carrello" style=" color: red; font-weight: bolder;">X</a>
			</tr>
			
			
		
		<%
			}
			}
		
		%>
		
		</div>
		</table>
		
			<div id="totale">Totale: <%=Math.round(prezfin)%> &#8364 </div>
		
		
		<input type="hidden" name="action" value=<%=prezfin %>>
		
		<div id="continua" >
		<input class="submit" type="submit" value="Acquista">
			<%
	if(cart!=null)
	{
		if(prodcart.size()>0){
		%>
		<button> <a href="ProductControl?action=clearCart">Cancella Prodotti Nel Carrello</a> </button>
		<%
		}
		%>
		</form>
	
 
 <%} %>
 </div>
 </div>
 
 <div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>