<%@page import="it.unisa.model.*"%>
<%@page import="java.util.*"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<title>Error 411</title>
<LINK rel= "stylesheet" href="./home.css" type="text/css">
<link rel="stylesheet" href="./jquery.artarax.rating.star.css">
<script src="jquery-3.js"></script>
</head>
<body>
<header class="top"> 
<img src="foto/winesa1.png">
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
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
	<%}if(ar!=null && ur== null){ %>
	<div id="menu">
	<ul>
		<li class="selected"><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp">Artigiani della Vigna</a></li>
		<li><a href="areaadmin.jsp">Area Admin</a></li>
		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
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
<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>		</div>
	</ul>
	</div>
	<%} %>
	
</nav>
<div id="errorpage">
	<img  alt="" src="foto/error411.png" width="500" height="500">
	</div>
 <div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>