<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>


<link rel="icon" href="foto/favicon.ico">
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="success.css" type="text/css">


</head>
<body>
<header class="top"> 
<img src="foto/winesa1.png">
</header>

<form>
<div class="succText"> Logout effettuato con successo, sarai reindirizzato alla homepage
<%
	request.getSession(false).setAttribute("utente",null);
	request.getSession(false).setAttribute("admin",null);
%> </div>
<script>
  setTimeout(function() {
      document.location = "home.jsp";
  }, 2000);
</script>
</form>
 <div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
