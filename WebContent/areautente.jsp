<!DOCTYPE html>
<%@page import="it.unisa.model.*"%>
<%@page import="java.util.*"%>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<title>Area Utente</title>
<link rel= "stylesheet" href="home.css" type="text/css">
<link rel= "stylesheet" href="areautente.css" type="text/css">
<link rel="stylesheet" href="jquery.artarax.rating.star.css">

</head>
<body>
<script type="text/javascript">
	function mostra(obj) {
		document.getElementById("content"+obj).style.display="block";
		}
	function nascondi(obj) {
		document.getElementById("content"+obj).style.display="none";
	}	
	
	</script>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

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


<%
UtenteRegistrato ur=(UtenteRegistrato)request.getSession().getAttribute("utente");
ArrayList<ProductBuy> lpb=(ArrayList<ProductBuy>)request.getSession().getAttribute("prodacq");
ArrayList<ProductBean> lpref=(ArrayList<ProductBean>)request.getSession().getAttribute("preferiti");
final ProductModelDM mmm=new ProductModelDM();
if(ur==null)
{
	response.sendRedirect("Login.jsp");
}
else
{
%>
<div id="tableContainer">
<div id="tableRaw">
<div id="info">
<div id="generalita">
<h2> Ciao <%=ur.getNome()%> <%=ur.getCognome() %> </br> </h2>
</div> 

<div id="informazioni">

<table>

<tr>
<td> <strong> Email </strong> </td>
<td> <%=ur.getEmail() %> </td> 
<td> <a href="cambiamail.jsp" class="change">Cambia email</a>  </td>
</tr>

<tr>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr>
<td><strong> Città </strong> </td>
<td> <%=ur.getCitta() %> </td>
</tr>

<tr>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr>
<td> <strong> Indirizzo </strong> </td>
<td> <%=ur.getIndirizzo() %> </td>
<td> <a href="cambiaind.jsp" class="change"> Cambia indirizzo</a> </td>
</tr>

<tr>
<td> </td>
<td> </td>
<td> </td>
</tr>

<tr>
<td> <strong> Password </strong></td>
<td> **** </td>
<td> <a href="cambiapsw.jsp" class="change">Cambia password</a> </td>
</tr>

<%} %>
</table>

</div>


</div>
</div>
</div>



<div class="recens">
<li id="scrittaOrd"> <h2>I miei ordini </h2></li>

<ul class="recensVini">

<%
	if(lpb!=null)
	{
		for(ProductBuy pb:lpb)
		{
			ProductBean check=new ProductBean();
			check=mmm.doRetrieveByKey(pb.getCodpr());
		
%>
		<li id="schedaVini">
		<span id="righe">  
		<a href="SelProdContr?id_prod=<%=pb.getCodpr()%>"> 
		
		<img class="adImage" alt="Errore" src="./GetControlAcq?id=<%=pb.getCode() %>" height="100" width="100">
		<div class="adBody">
		
			<span id="span1"> </span>
			
				<span class="nomeVino"><%=pb.getName()%><br> </span>
				<span class="quantitaVino">Quantità:<%=pb.getQuantity() %><br></span>
				<span class="prezzoVino">Prezzo:<%=pb.getPrice() %> &#8364<br></span>  </a> 
				<% 
				if(check.getType()!=null)
				{
					%>

<span><input type="button" value="Scrivi una recensione" onclick="javascript:mostra('<%=pb.getCode() %>')" /> </span>
<span> <input type="button" value="Nascondi recensione" onclick="javascript:nascondi('<%=pb.getCode() %>')" /> </span>

	<%
				}
	%>

</li>
</ul>





<div id="content<%=pb.getCode()%>" style="display:none; padding-left: 150px">
<h2>  Recensione</h2>
<form action="RecensControl" method="post" >
<input type="hidden" name="id_u" value=<%=ur.getCode() %>>
<input type="hidden" name="id_p" value=<%=pb.getCodpr() %>>
<input type="hidden" name="nomeut" value=<%=ur.getUtente()%>>
<br> Titolo: <br> <input type="text" name="titr"> <br>
<br> Descrizione: <br><textarea rows="10" cols="48" name="comments"></textarea> <br>
<br> Valutazione: <br>
<div class="rating-star">
  <span data-id="001" data-val="1" data-idval="<%=pb.getCode() %>"></span>
  <span data-id="002" data-val="2" data-idval="<%=pb.getCode() %>"></span>
  <span data-id="003" data-val="3" data-idval="<%=pb.getCode() %>"></span>
  <span data-id="004" data-val="4" data-idval="<%=pb.getCode() %>"></span>
  <span data-id="005" data-val="5" data-idval="<%=pb.getCode() %>"></span>
</div>

<div id="afters<%=pb.getCode()%>"> <input class="stellina" id="stellina<%=pb.getCode() %>" type="number" min="1" max="5" value="" name="vstelle"></div> <br>

<div id=submit>
<input class="submit" type="submit" value="Invia recensione">
<input class="reset" type="reset">
</div>
</form>
</div>





<%
		}
	}
%>


</div>


<div id="pref">

<div id="titoloP"><h2 style="font-weight: bold; font-family: sans-serif;">I miei preferiti </h2></div>
<%
	if(lpref!=null)
	{
		for(ProductBean bb:lpref)
		{
			if(bb.getType()!=null)
			{
%>
<div id="totale">
<a href="SelProdContr?id_prod=<%=bb.getCode()%>"> <img class="adImage" alt="Errore" src="./GetPicture?id=<%=bb.getCode() %>" height="160" width="100"> </a>

<div id="infoPref">
Nome:<a href="SelProdContr?id_prod=<%=bb.getCode()%>"><%=bb.getName() %> </a><br>
Tipo: <%=bb.getType() %> <br>
Prezzo:<%=bb.getPrice() %> &#8364<br>
</div>
</div>
<%
			}
		}
	}
%>
</div>
<div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>
<script src="jquery-3.js"></script>
<script type="text/javascript">
$(function () {
	  var artaraxRatingStar = $.artaraxRatingStar({
	      onClickCallBack: onRatingStar
	  });

	  function onRatingStar(rate, id, valid) {
	      console.log("prova");
	      $("#stellina"+valid).remove();
	      $("#afters"+valid).after("<input class='stellina' id='stellina"+valid+"' type='number' min='1' max='5' value='"+rate+"' name='vstelle'></input>");
	  }

	});

</script>
<script src="jquery.artarax.rating.star.js"></script>

</body>
</html>