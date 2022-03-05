<%@page import="it.unisa.model.*"%>
<%@page import="it.unisa.control.*"%>
<%@page import="it.unisa.model.ProductBean"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="prodosel.css" rel="stylesheet" type="text/css">
<link href="home.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="jquery.artarax.rating.star.css">
<title>Info prodotto</title>
<link rel="icon" href="foto/favicon.ico">
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>
<% 
String azione=(String)request.getAttribute("azione");
ProductBean pbbb=new ProductBean();
pbbb.setQuantity(1);
AdminRegistrato ar=new AdminRegistrato();
ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
%>

<%
	UtenteRegistrato ur=new UtenteRegistrato();
	ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
%>
<nav>
	<%if(ur==null && ar==null) {%>
	<div id="menu">
	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li ><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>
		<li class="selected"><a href="catalogo.jsp">Catalogo</a></li>
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
		<li><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li><a href="areaadmin.jsp">Area Admin</a></li>
		<li class="selected"><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
	<%}else if(ur!=null){ %>
<div id="menu">
	<ul>
		<li ><a href="home.jsp">Home</a></li>
		<li ><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>
		<li class="selected"><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
	<%} %>
</nav>

<%
AdminRegistrato arr=new AdminRegistrato();
arr=(AdminRegistrato)request.getSession(false).getAttribute("admin");
ProductBean pb=(ProductBean)request.getAttribute("prodcom");
ArrayList<Recensione>lrec=new ArrayList<Recensione>();
lrec=(ArrayList<Recensione>)request.getAttribute("lisrec");
if(pb != null)
{

%>

<div id="scheda">
<div id="fotoProd">
	<img id="pic" alt="Errore" src="./GetPicture?id=<%=pb.getCode() %>">
	
	
	<div id="recensioneScheda">
<h2> Recensioni </h2>
<%
}
if(lrec != null)
{
	if(lrec.size()>0)
	{
		for(Recensione r:lrec)
		{
			
%>
<div id="borderDiv">
<table class="schemainfo">
	<tr>
		<td>Utente:<%=r.getNomeut() %></td>
	</tr>
	<tr>
	<td> Titolo:<%=r.getTitolo() %> </td>
	</tr>
	<tr>
	<td> Stelle:<div class="rating-star">
	<%int j=5;
	for(int i=0;i<r.getStelle();i++)
			{
			 j--; %>
	  <span class="hover" data-id="003" data-val="1" ></span>
	  <%} %>
	  <% 
	  for(int i=0;i<j;i++)
	  { %>
		  

	  <span data-id="003" data-val="1" ></span>
	<%  }
	  %>
		</div>
	</td>
	</tr>
	<tr>
	<td> Descrizione:<%=r.getDescrizione() %> </td>
	</tr>
	
</table>
</div>
<%
	}
}
else
	{
%>
	<h2>Nessuna Recensione</h2>

<%
	}
}
%>
</div>
</div>

<div id="infoProd">
<div id="NomePrezzo">
<h1 style="font-weight: bold; text-transform: uppercase;" > <%=pb.getName()%><br> </h1>
<h2 style="font-weight: bold; color: #956a4b"> <%=pb.getPrice() %> &#8364<br> </h2>
</div>





<ul class="schemainfo">

<li> <strong>Descrizione: </strong><%=pb.getDescription()%> </li>
<li> <strong> Tipo: </strong><%=pb.getType()%> </li>
<li> <strong> Annata:</strong> <%=pb.getAnno()%> </li>
<li> <strong> Regione:</strong> <%=pb.getRegione() %></li>

</ul>

<%
	if(arr==null)
	{		
%>

<div id="pulsante">
<input type="number" min="1" step="1" max="126" data-size="large" name="qty" id="qty" maxlength="12" value="1" title="Qtà" onchange="codeRef(this,'<%=pbbb%>')">
<div id="buy"> <a id="pr"><button id="acquista" name="nome" 
onclick="codeRef('<%=pb.getCode()%>','<%=azione%>')"> <img id="imgCar" src="foto/aggiungi-al-carrello.png" style="width: 135px; height: 50px;"> </button> </a> </div>
</div>
<%
	}
%>
<script src="jquery-3.js" type="text/javascript"></script>
<script type="text/javascript">
function codeRef(obj,obj2)
{
	var t= document.getElementById("qty").value;
	$.ajax({
		  url: "ProductControl",
		  type: "GET",
		  data: "action=addCart&id="+obj+"&tipo=selprod"+"&qty="+t,
		  success:function(result){
		  }
		});	
}


</script>

</div>
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