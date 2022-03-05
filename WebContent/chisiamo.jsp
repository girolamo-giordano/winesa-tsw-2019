<%@page import="it.unisa.model.UtenteRegistrato"%>
<%@page import="it.unisa.model.AdminRegistrato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico" />
<meta charset="ISO-8859-1">
<title>Artigiani della vigna</title>
<link rel= "stylesheet" href="chisiamo.css" type="text/css">
<link rel= "stylesheet" href="home.css" type="text/css">
</head>
<meta charset="UTF-8">
<body>
<script src="jquery-3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    $(window).scroll( function(){
	        $('.fadein').each( function(i){
	            
	            var bottom_of_element = $(this).offset().top + $(this).outerHeight();
	            var bottom_of_window = $(window).scrollTop() + $(window).height();
	            
	            if( bottom_of_window > bottom_of_element ){
	                $(this).animate({'opacity':'1'},1000);
	            }
	            
	        }); 
	    });
	});

</script>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

<%
	UtenteRegistrato ur=new UtenteRegistrato();
	ur=(UtenteRegistrato)request.getSession(false).getAttribute("utente");
	AdminRegistrato ar=new AdminRegistrato();
	ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
%>
 
<nav>
	<%if(ur==null && ar==null) {%>
	<div id="menu">
	<ul>
		<li><a href="home.jsp">Home</a></li>
		<li  class="selected"><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
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
		<li><a href="home.jsp">Home</a></li>
		<li  class="selected"><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
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
		<li ><a href="home.jsp">Home</a></li>
		<li  class="selected"><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
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
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
	<%} %>
</nav>






<div id="tableContainer">

<div id="foto1">
<img src="foto/vigne.jpg" style="width:1200px;">
</div>

	<div id="tableRow">

<div id="firstP">
<div class="fadein">
	CHE COS&#8217HANNO IN COMUNE <br>
Ogni artigiano della vigna condivide caratteristiche che lo rende unico e valori importanti sia per lui che per noi. 
In particolare:Vero rispetto per la natura. Non in senso astratto o necessariamente ecologista, ma adeguandosi ai cicli 
delle stagioni, alle leggi naturali del clima e delle piogge, creando vini che cambiano a seconda dell&#8217anno, 
mai uguali a se stessi.

Attenzione al territorio. Danno spazio ai vitigni autoctoni del territorio, non per seguire il mercato ma perch&egrave
privilegiano l&#8217autenticit&agrave e hanno il coraggio di essere coerenti.

Orgogliosi di essere fuori dal trend. Non vedrai un artigiano della vigna che cambia per seguire le tendenze del mercato. 
Se cambia &egrave per fare ancor meglio il suo vino, con attenzione e precisione ancora maggiori.

Dimensioni contenute. Sono piccole cantine, spesso nate da una tradizione familiare che ancora le guida. La produzione &egrave 
limitata a poche bottiglie, a volte per scelta, a volte per necessit&agrave, ma sempre per amore della qualit&agrave.

Vigne di propriet&agrave. Gli artigiani della vigna fanno il vino sulle proprie colline, quelle ricevute in eredit&agrave dai loro padri, 
perch&egrave le conoscono da sempre e ne sono lo specchio, metro per metro e filare dopo filare.
</div>
	
	
	<div id="linea" class="fadein">
	<img src="foto/calice.png">
	
</div>
  <div class="fadein">
PERCH&Egrave CI PIACCIONO
<br>
Per il loro coraggio e la loro forza tranquilla. Per il valore dei loro vini, che altrimenti rimarrebbe nascosto, conosciuto solo a chi lo va a cercare o lo incontra per caso, viaggiando in una strada dimenticata. Perch&egrave rappresentano il bello di scoprire un altro vino, fatto con logiche differenti, fuori dai territori pi&ugrave battuti.
	<div id="linea" class="fadein">
	<img src="foto/calice.png">
	</div>
	</div>

<div class="fadein">
CHE COS&#8217HANNO IN COMUNE
<br>
Ogni artigiano della vigna condivide caratteristiche che lo rende unico e valori importanti sia per lui che per noi. In particolare:

Vero rispetto per la natura. Non in senso astratto o necessariamente ecologista, ma adeguandosi ai cicli delle stagioni, alle leggi naturali del clima e delle piogge, creando vini che cambiano a seconda dell&#8217anno, mai uguali a se stessi.

Attenzione al territorio. Danno spazio ai vitigni autoctoni del territorio, non per seguire il mercato ma perch&egrave privilegiano l&#8217autenticit&agrave e hanno il coraggio di essere coerenti.

Orgogliosi di essere fuori dal trend. Non vedrai un artigiano della vigna che cambia per seguire le tendenze del mercato. Se cambia &egrave per fare ancor meglio il suo vino, con attenzione e precisione ancora maggiori.

Dimensioni contenute. Sono piccole cantine, spesso nate da una tradizione familiare che ancora le guida. La produzione &egrave limitata a poche bottiglie, a volte per scelta, a volte per necessit&agrave, ma sempre per amore della qualit&agrave.

Vigne di propriet&agrave. Gli artigiani della vigna fanno il vino sulle proprie colline, quelle ricevute in eredit&agrave dai loro padri, perch&egrave le conoscono da sempre e ne sono lo specchio, metro per metro e filare dopo filare.
</div>
<div id="linea" class="fadein">
	<img src="foto/calice.png">
	</div>
	
<div id="bottone" class="fadein"> <a href="catalogo.jsp"> <input type="button" id="buttone" value="SCOPRI I NOSTRI PRODOTTI"> </a>  </div>
</div>
</div>

<div id="foto1" class="fadein">
<iframe width="1200" height="500" src="https://www.youtube.com/embed/VhUYh7jdZak" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>
</div> 

<div id="footer" class="fadein">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>


</body>
</html>