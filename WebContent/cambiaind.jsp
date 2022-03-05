<%@page import="it.unisa.model.UtenteRegistrato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<title>Cambia indirizzo</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>
<%
	UtenteRegistrato ur=new UtenteRegistrato();
	ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
%>
 
<nav>

<div id="menu">
	<ul>
		<li ><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
	</ul>
	</div>
</nav>

<div id="form">
<form name="mailform" action="ChangeInd" method="post"> 

<fieldset>
	
		<h2 id=titolo> Cambio indirizzo</h2>
		
		<fieldset id="primoF">
			<legend>Credenziali</legend>
		<div class="tableRow">
			<label class="rcolor" for="username">Nuovo indirizzo:</label>
			<input type="text" id="username" name="indir" value="" placeholder="Inserire nuovo indirizzo..." required> 
		</div>
			
		</fieldset>
		
		
			<input class="submit" type="submit" value="Cambia">
			<input class ="reset" type="reset">
		
	</fieldset>
	</form> 
	
	<div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</body>
</html>