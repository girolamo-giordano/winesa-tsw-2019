<%@page import="it.unisa.model.AdminRegistrato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<title>Area Admin</title>
<link rel= "stylesheet" href="home.css" type="text/css">
<link rel= "stylesheet" href="areaadmin.css" type="text/css">
<link rel= "stylesheet" href="areautente.css" type="text/css">
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

<nav>

<div id="menu">
	<ul>
		<li ><a href="home.jsp">Home</a></li>
		<li><a href="chisiamo.jsp" >Artigiani della vigna</a></li>
		<li  class="selected"><a href="areaadmin.jsp">Area Admin</a></li>
		<li><a href="catalogo.jsp">Catalogo</a></li>
		<div id="lright">
			<li><a href="logout.jsp">Logout</a></li>
		</div>
	</ul>
	</div>
</nav>
<%
AdminRegistrato ar=(AdminRegistrato)request.getSession().getAttribute("admin");
if(ar==null)
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
<h2> Ciao <%=ar.getNome()%> <%=ar.getCognome() %> </br> </h2>
</div> 
<div id="informazioni">

<table>

<tr>
<td> <strong> Email </strong> </td>
<td> <%=ar.getEmail() %> </td> 
<td> <a href="cambiamail.jsp" class="change">Cambia email</a>  </td>
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

	
<% } %>
</table>
</div> 
</div>
</div>
</div>


<form name="addproduct" action="ProductControl" method="post" enctype="multipart/form-data"  onsubmit="event.preventDefault();validateadmin(this)"> 
<input type="hidden" name="action" value="insert">



<div id="prodotto">
	
		<h2 id=titolo> Carica Prodotto</h2>
		
<div id="prodottoDati">
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="username"><strong> Nome Prodotto:</strong> </label> 
				<input type="text" id="username" name="name" value="" placeholder="Inserire nome" required> 
			</div>
		</div>
		<br>
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="descrizione"> <strong>Descrizione: </strong> </label>
				<br>
				<textarea name="descrizione"   required></textarea>
			</div>
		</div>
		<br>
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="tipo"> <strong> Tipo: </strong> </label>
				<select name=tipo>
					<option value="Vino Bianco"> Vino Bianco </option>
					<option value="Vino Rosso"> Vino Rosso </option>
					<option value="Vino Rosa"> Vino Rosa </option>
					<option value="Bollicine"> Bollicine </option>
				</select>
			</div>
		</div>
		
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="prezzo"> <strong> Prezzo: </strong> </label>
				<input type="text" id="prezzo" name="prezzo" value="" placeholder="Inserire prezzo" required> 
			</div>
		</div>
		
		 
            <div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="anno"> <strong> Anno: </strong> </label>
				<input type="text" id="anno" name="anno" value="" placeholder="Inserire anno" required> 
			</div>
		</div>
		
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="quantita"><strong> Quantità: </strong> </label>
				<input type="number" id="quantita" min="1" name="quantita" value="" placeholder="Inserire quantità" required> 
			</div>
		</div>
		
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="immagine"><strong> Immagine: </strong></label>
				<input type="file" name="foto" accept="image/*" required>
			</div>
		</div>
		
		
		<div class="tableRow">
			<div class="padding">
				<label class="rcolor" for="Regione"> <strong> Regione:  </strong> </label>
 				<select name="regione" id="regione">
    			<option selected="selected">--</option>
                <option label="Valle d'Aosta" value="valle">
                </option>
        
                <option label="Piemonte" value="piemonte">
                </option>
                
                <option label="Liguria" value="liguria">
                </option>
        
                <option label="Lombardia" value="lombardia">
                </option>
        
               <option label="Trentino Alto Adige" value="trentino">
                </option>
        
				<option label="Veneto" value="veneto">
                </option>
        
                <option label="Friuli-venezia giulia" value="friuli">
                </option>
        
                <option label="Emilia Romagna" value="emilia">
                </option>
        
                <option label="Toscana" value="toscana">
                </option>
        
                <option label="Umbria" value="umbria">
                </option>
        
                <option label="Marche" value="marche">
                </option>
        
                <option label="Lazio" value="lazio">
                </option>
        
                <option label="Abruzzo" value="abruzzo">
                </option>
        
                <option label="Molise" value="molise">
                </option>
        
                <option label="Campania" value="campania">
                </option>
        
                <option label="Puglia" value="puglia">
                </option>
        
                <option label="Basilicata" value="basilicata">
                </option>
        
                <option label="Calabria" value="calabria">
                </option>
        
                <option label="Sicilia" value="sicilia">
                </option>
        
                <option label="Sardegna" value="sardegna">
                </option>
            </select>
           
         
    
		
		<div id=bottoni>
		<div class="tableRow">
			
				<input class="submit" type="submit" value="Inserisci">
			
		
			
				<input class ="reset" type="reset">
			
		</div>
		</div>
		</div>
		</div>
		
			
</div>
</div>		

	
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
function validateadmin(obj)
{
	var valid=true;
	
	var pre=document.getElementsByName("prezzo")[0];
	if(!checkNumber(pre)){
		valid=false;
		$("#prezzo").addClass("error");
		$("#errorna1").remove();
		$("#prezzo").after('<label id="errorna1" >Prezzo Errato</label>');
		pre.classList.add("error");
	}else{
		$("#errorna1").remove();
		pre.classList.remove("error");
	}
	
	var pre2=document.getElementsByName("anno")[0];
	console.log(pre2);
	console.log(pre2.value);
	if(!checkNumber(pre2) || (pre2.value<1900 || pre2.value>2019)){
		valid=false;
		$("#anno").addClass("error");
		$("#errorna2").remove();
		$("#anno").after('<label id="errorna2" >Anno Errato</label>');
		pre2.classList.add("error");
	}else{
		$("#errorna2").remove();
		pre2.classList.remove("error");
	}
	if(valid)
		obj.submit();
}
</script>
</body>
</html>