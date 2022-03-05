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
<title>Homepage</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<link rel="stylesheet" href="jquery.artarax.rating.star.css">
<script src="jquery-3.js"></script>
</head>
<body>
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


<div id="tableContainer">
	<div id="tableRow">
	<div class="foto"> 
	<h2 id="rscritta"> RICERCA PER TIPO </h2>
	<table id="fotoTable">
			
 	<tr>
 	<td>
  			<div class="column">
  				<div class="container">
   				<a href="ProductControl?action=vinobianco">  <img src="foto/vinoBianco.jpg" alt="Bianco" class="image" style="width:200px; lenght:200px;" > </a>
   					<div class="middle">
    					<div class="text">Vino Bianco</div>
  					</div>
   				</div>
   			</div>
   			</td>
   			<td>
  
  			<div class="column">
  				<div class="container">
     				<a href="ProductControl?action=vinorosso"> <img src="foto/vinorosso.jpg" alt="Rosso" class="image" style="width:200px; lenght:200px;" > </a>
     				<div class="middle">
    				<div class="text">Vino Rosso</div>
  					</div>
  				</div>
    		 </div>
    		 </td>
    		 
     
<tr>
<td>
 			<div class="column">
 				<div class="container">
    				<a href="ProductControl?action=vinorosa"> <img src="foto/vinoRosa.jpg" alt="Rosato" class="image" style="width:200px; lenght:200px;"></a>
    				<div class="middle">
    				<div class="text">Vino Rosato</div>
  					</div>
  				</div>
    		</div>
    		</td>
    		<td>
    		
    		
    		<div class="column">
 				<div class="container">
    				<a href="ProductControl?action=bollicine"> <img src="foto/bollicine.jpg" alt="bollicine" class="image" style="width:200px; lenght:200px;" ></a>
    					<div class="middle">
    						<div class="text">Bollicine</div>
  						</div>
  				</div>
    		</div>
    		</td>
    		</table>
    		</div>
    	
    		
  
    		
    		
    		
    		

 		
	   

 			<%LastProducts lp=new LastProducts();
 		
 			lpb=lp.getLast();
 		%>

		<div id="inserimento" >
		<h2 id="ultimiInseriti"> ULTIMI VINI INSERITI </h2>
 			<div class="slideshow-container">
			<div class="mySlides fade">
				<div class="numbertext">1 / 3</div>
			<div id=sca><a href="SelProdContr?id_prod=<%=lpb.get(0).getCode()%>"><img class="Giroimg" onerror="this.src='./foto/download.png'" src="./GetPicture?id=<%=lpb.get(0).getCode() %>" height="100" width="100" ></a></div>
					  <div class="Girotext"><%=lpb.get(0).getName() %></div>
						</div>
						
				<div class="mySlides fade">
  					<div class="numbertext">2 / 3</div>
					
				<div id=sca><a href="SelProdContr?id_prod=<%=lpb.get(1).getCode()%>"><img class="Giroimg" onerror="this.src='./foto/download.png'" src="./GetPicture?id=<%=lpb.get(1).getCode() %>" height="100" width="100" ></a></div>
					<div class="Girotext"><%=lpb.get(1).getName() %></div>
					</div>
					
					<div class="mySlides fade">
 						 <div class="numbertext">3 / 3</div>
				<div id=sca><a href="SelProdContr?id_prod=<%=lpb.get(2).getCode()%>"><img class="Giroimg" onerror="this.src='./foto/download.png'" src="./GetPicture?id=<%=lpb.get(2).getCode() %>" height="100" width="100" ></a></div>
				<div class="Girotext"><%=lpb.get(2).getName() %></div>
				</div>
	<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	<a class="next" onclick="plusSlides(1)">&#10095;</a>

	</div>
	<div id="pallini" style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  </div>
	</div>
	<br>
	</div>
	
  
  <script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
				
				
			
 		</div>
 		</div>
	</div>

 
 
 
 <div class="felicita" class="fadein">
 <script>
	 $("La felicità, come un vino pregiato, deve essere assaporata sorso a sorso.").fadeIn();
</script>
</div>	

<div id="recensioni" class="fadein">
	<h2 id="ultRec"> Ultime Recensioni </h2>
	
	<div id="textRec">
	<%LastRecensioni lr=new LastRecensioni();
	
	lrec=lr.getLast();
	
	%>
<table id="recTab">


<tr class="recTr">
	<th class="recTh"> Utente</th>
	<th class="recTh"> Prodotto </th>
	<th class="recTh"> Descrizione </th>
	<th class="recTh"> Voto </th>
	
</tr>

<%if(lrec.get(0).getNomeut()!=null) {%>
<tr class="recTr"> 
	<td class="recTd">  <%=lrec.get(0).getNomeut() %> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(0).getId_product()%>"><%=pddm.doRetrieveByKey(lrec.get(0).getId_product()).getName() %></a> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(0).getId_product()%>"><%=lrec.get(0).getDescrizione() %> </td>
	<td class="recTd">
		<div class="rating-star">
	<%int j=5;
	for(int i=0;i<lrec.get(0).getStelle();i++)
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
<% }%>

<%if(lrec.get(1).getNomeut()!=null) {%>
<tr class="recTr">
	<td class="recTd">  <%=lrec.get(1).getNomeut() %> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(1).getId_product()%>"><%=pddm.doRetrieveByKey(lrec.get(1).getId_product()).getName() %></a> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(1).getId_product()%>"> <%=lrec.get(1).getDescrizione() %> </td>
	<td class="recTd">
	<div class="rating-star">
	<%int j=5;
	for(int i=0;i<lrec.get(1).getStelle();i++)
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
<% }%>

<%if(lrec.get(2).getNomeut()!=null) {%>
<tr class="recTr"> 
	<td class="recTd">  <%=lrec.get(2).getNomeut() %> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(2).getId_product()%>"><%=pddm.doRetrieveByKey(lrec.get(2).getId_product()).getName() %></a> </td>
	<td class="recTd"> <a href="SelProdContr?id_prod=<%=lrec.get(2).getId_product()%>"><%=lrec.get(2).getDescrizione() %></a> </td>
	<td class="recTd">
	<div class="rating-star">
	<%int j=5;
	for(int i=0;i<lrec.get(2).getStelle();i++)
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

<% }%>
</table>

	</div>
</div>


<div class="fadein">
 <div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
</div>
<script src="jquery-3.js"></script>
<script src="jquery.artarax.rating.star.js"></script>


</body>
</html>