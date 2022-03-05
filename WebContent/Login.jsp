<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% 	
	String username=(String)request.getAttribute("username");
	if(username==null) username="";
	
	String password =(String) request.getAttribute("password");
	if(password==null) password="";
	
%>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="login.css" type="text/css">
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>
<% 
	String errore=(String) request.getAttribute("errore");
	if(errore!=null){
%>
	<div> <%=errore%></div>
<%
	}
 
	String message=(String) request.getAttribute("message");
	if(message!=null){
%>
	<div> <%=message%></div>
<%
	}
%>

<nav>
	<div id="menu">
	<ul>
		<li ><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp">Artigiani della Vigna</a></li>
		<li class="dropdown"><a href="areautente.jsp">Area Utente</a>
		
 			 <div class="dropdown-content">
   				 <a href="areautente.jsp#tableContainer">I miei dati</a>
    				<a href="areautente.jsp#schedaVini">I miei ordini</a>
    					<a href="areautente.jsp#pref">I miei preferiti</a>
    		</div>
		</li>
		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li class="selected"><a href="Login.jsp">Login</a></li>
			<li ><a href="registrazione.jsp">Registrati</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
</nav>
<div id="form">
<form name="loginform" action="LogControl" method="post"> 

<fieldset>
	
		<h2 id=titolo> Login</h2>
		
		<fieldset id="primoF">
			<legend>Credenziali</legend>
		<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="username" name="username" value="<%=username %>" placeholder="Inserire usernome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="password" name="password" value="<%=password %>" placeholder="Inserire password.." required>
		</div>
		
		<div id="mostra"> <input type="checkbox" onclick="myFunction()"> Mostra Password </div>
		
		<div id="button">
		<input type="radio" id="radiobutton" name="sceltaP" value="Admin" checked="checked"> 
		<label class="rcolor" for="radio"> Admin </label>

		<input type="radio" id="radiobutton" name="sceltaP" value="Utente">
		<label class="rcolor" for="radio"> Utente </label>
		
		</div>
			
		</fieldset>
		
		
			<input class="submit" type="submit" value="Login">
			<input class ="reset" type="reset"> <br>
		</form>
		
		<div id="reg"> <h2 id="RegText"> Sei nuovo su WineSa?</h2> 
		
		 <a href="registrazione.jsp"> <input type="button" id="regBut" value="REGISTRATI"> </a>  </div>
	</fieldset>
	
	
	<div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</div>
<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
</body>
</html>