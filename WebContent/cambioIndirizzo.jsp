<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Indirizzo cambiato con successo</title>
<link rel="icon" href="foto/favicon.ico">
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="success.css" type="text/css">


</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

<form>
<div class="succText">Indirizzo cambiato con successo, verrai reindirizzato alla tua area utente</div>
<script>
  setTimeout(function() {
      document.location = "areautente.jsp";
  }, 2000);
</script>
</form>
 <div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>

</body>
</html>