<%@page import="it.unisa.model.UtenteRegistrato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
<title>Cambia email</title>
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
<form name="mailform" action="ChangeMail" method="post" onsubmit="event.preventDefault();validatemail(this)"> 

<fieldset>
	
		<h2 id=titolo> Cambio Mail</h2>
		
		<fieldset id="primoF">
			<legend>Credenziali</legend>
		<div class="tableRow">
			<label class="rcolor" for="username">E-mail:</label>
			<input type="text" id="username" name="email" value="" placeholder="Inserire nuova mail.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="password">Conferma e-mail:</label>
			<input type="text" id="password" name="email2" value="" placeholder="Conferma email" required> 
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
<script src="javascriptcode.js"></script>
<script src="jquery-3.js"></script>
<script>
function validatemail(obj)
{
	var valid=true;
	var email=document.getElementsByName("email")[0];
	if(!checkEmail(email)){
		$("#username").addClass("error");
		$("#errorna2").remove();
		$("#username").after('<label id="errorna2" >Email Errata</label>');
		valid=false;
		email.classList.add("error");
	}else{
		email.classList.remove("error");
		$("#errorna2").remove();
	}
	var email2=document.getElementsByName("email2")[0];
	if(!checkEmail(email2)){
		valid=false;
		$("#password").addClass("error");
		$("#errorna3").remove();
		$("#password").after('<label id="errorna3" >Email Errata</label>');
		email2.classList.add("error");
	}else{
		email2.classList.remove("error");
		$("#errorna3").remove();
	}
	
	if(email.value!=email2.value){
		alert("Le due mail non coincidono");
		valid=false;
	}
	if(valid)
		obj.submit();
}

</script>
</body>
</html>