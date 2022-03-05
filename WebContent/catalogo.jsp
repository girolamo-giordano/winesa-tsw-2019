<%@page import="com.google.gson.Gson"%>
<%@page import="it.unisa.model.*"%>
<%@page import="it.unisa.control.GetPicture"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
<%@page import="it.unisa.control.PhotoControl"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<link href="ProductStyle.css" rel="stylesheet" type="text/css">
<link href="home.css" rel="stylesheet" type="text/css">
<script src="jquery-3.js"></script>
<title>Catalogo</title>
</head>
<body>
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>
<% 
String azione=(String)request.getAttribute("azione");
AdminRegistrato ar=new AdminRegistrato();
ar=(AdminRegistrato)request.getSession(false).getAttribute("admin");
ArrayList<ProductBean> arrl =(ArrayList<ProductBean>) request.getSession().getAttribute("preferiti");
String jnn=null;

	Gson gnn=new Gson();
	jnn=gnn.toJson(arrl);
	
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



<script>
$("select").click(function() {
  var open = $(this).data("isopen");
  if(open) {
    window.location.href = $(this).val()
  }
  //set isopen to opposite so next time when use clicked select box
  //it wont trigger this event
  $(this).data("isopen", !open);
});

</script>
<div id="prodAdmin">

<div id="ordinamento">
 Ordina per:
 <select name="forma" onchange="javascript:handleSelect(this)">
 	<option value="Nessun Ordinamento"> Nessun Ordinamento </option>
    <option value="ProductControl?action=<%=azione%>&sort=code">Codice</option>
     <option value="ProductControl?action=<%=azione%>&sort=name">Nome</option>
      <option value="ProductControl?action=<%=azione%>&sort=description">Descrizione</option>
</select>


<script type="text/javascript">
function handleSelect(elm)
{
window.location = elm.value;
}
</script>

</div>



<form id="filtro" action="GetInfoVino" method="post">
<fieldset>
<select id="TIPO" name="tipi" onchange="AddVls(this)">
<option label="">-----</option>
<option value="Vino Bianco">Vino Bianco</option>
<option value="Vino Rosso">Vino Rosso</option>
<option value="Vino Rosa">Vino Rosato</option>
<option value="Bollicine">Bollicine</option>
</select>

<select id="anni" class="scomparemag" name="anni" onchange="AddVls2(this)">
<option label="">-----</option>
</select>

<select id="regioni" class="scomparemag" name="regioni">
<option label="">-----</option>
</select> 
<input type="submit" value="Vai">
</fieldset>
</form>


<div id="ciao">	
<%
Collection<?> products= (Collection<?>)request.getAttribute("products");

if(products == null)
{
	response.sendRedirect("./ProductControl");
	return;
}

if(products != null && products.size()>0)
{
	//div prodotti.
	Iterator<?> it=products.iterator();
	while(it.hasNext())
	{
		ProductBean bean=(ProductBean)it.next();
		Gson json= new Gson();
		String gson=json.toJson(bean);
		if(ar==null)
		{
			
%>


<table class="prodTable">
	<tbody>
		<tr>
			<td id="cambiamento">
				<table>
					<tbody><tr><td> <a href="SelProdContr?id_prod=<%=bean.getCode()%>"> <img alt="Errore" src="./GetPicture?id= <%=bean.getCode() %>" height="300" width="200"> </a></td></tr></tbody>
					<tbody><tr><td id="nomeProd"> <a href="SelProdContr?id_prod=<%=bean.getCode()%>"> <%=bean.getName() %> </a></td></tr></tbody>
					<tbody><tr><td id="prezzoProd"><%=bean.getPrice() %> &#8364</td></tr></tbody>
					<%if(bean.getQuantity()<1)
					{
						%>
					<tbody><tr><td style="color:red; font-size: medium; padding-top: 20px; font-weight: bold;">Prodotto Esaurito</td></tr></tbody>
					<%
					}
					else
					{
					%>
					<tbody id="ue">
						<tr>
						
							<td> <a><button id="acquista" name="nome" 
								onclick="addCarr('<%=bean.getCode()%>')"> <img id="imgCar" src="foto/aggiungi-al-carrello.png" style="width: 135px; height: 50px;"> </button> </a>
							</td>
							<%
								Object obj = request.getSession().getAttribute("preferiti");
								if(obj != null){
									ArrayList<ProductBean> listaProdotti = (ArrayList<ProductBean>)obj;
									if(!listaProdotti.contains(bean)){
										
							%>
					 		<td> 
					 		
					 			 <img id="img<%=bean.getCode() %>" onclick='mostra("<%=bean.getCode() %>");cambiaImmagine(<%=bean.getCode()%>,<%=gson %>)'  class="preferitiIcon" src="foto/heart.png"> 
					 		
					 		</td>
					 		<%
									}
								
									else{
								
					 		%>
					 		<td> 
					 		
					 			 <img id="img<%=bean.getCode() %>" onclick='mostra("<%=bean.getCode() %>");cambiaImmagine(<%=bean.getCode()%>,<%=gson %>)'  class="preferitiIcon" src="foto/heartHover.png"> 
					 		
					 		</td>
					 		<%
									}
								}
								else{
					 		%>
					 		<td> 
					 		
					 			 <img id="img<%=bean.getCode() %>" onclick='mostra("<%=bean.getCode() %>");cambiaImmagine(<%=bean.getCode()%>,<%=gson %>)'  class="preferitiIcon" src="foto/heart.png"> 
					 		
					 		</td>
					 		<%
					 		
								}
					 		%>
					 	</tr>
					 </tbody>
		     				     					
					 		
					 		
					 		<%} %>
				</table>
			</td>
		</tr>
	</tbody>
	</table>
	



 



	<%
		}
		else
		{
	%>
	<table class="prodTable">
	<tbody>
		<tr>
			<td>
				<table>
					<tbody><tr><td> <a href="SelProdContr?id_prod=<%=bean.getCode()%>"><img  alt="Errore" src="./GetPicture?id= <%=bean.getCode() %>" height="300" width="200"> </a></td></tr></tbody>
					<tbody><tr><td id="nomeProd"> <a href="SelProdContr?id_prod=<%=bean.getCode()%>"><%=bean.getName() %> </a></td></tr></tbody>
					<tbody><tr><td id="prezzoProd"> Prezzo: <%=bean.getPrice() %> &#8364</td></tr></tbody>
					<tbody><tr><td>Quantità: <%=bean.getQuantity() %></td></tr></tbody>
				<tbody><tr><td><a href="ProductControl?action=delete&id=<%=bean.getCode()%>&tipo=<%=azione%>"><button id="cancella" name="nome"> 
					Cancella Prodotto </button> </a></td></tr></tbody>
					
				
				</table>
			</td>
		</tr>
	</tbody>
	
	<tr>
				
			
	</tr>
	<%
		}%>
<%
	}

}
%>


</table>
	</div>
</div>
</div>
</div>

<script>

function cambiaImmagine(id,obj1){
	var idd = "img"+id;
	var src = $("#"+idd).attr("src");
	if(src == "foto/heart.png")	{
		$("#"+idd).attr("src", "foto/heartHover.png");
		 $.ajax({
			  url: "/esame/ProductControl",
			  type: "GET",
			  data: "pref=true&code="+obj1.code
			});
		
	}
		else{
			$("#"+idd).attr("src", "foto/heart.png");
			 $.ajax({
				  url: "/esame/ProductControl",
				  type: "GET",
				  data: "pref=false&code="+obj1.code
				});
			
		}
}



function mostra(obj) {
	document.getElementById("img"+obj).classList.add("preferitiimg");
	}
function nascondi(obj) {
	document.getElementById("content"+obj).style.display="none";
}


function AddVls(obj){
	var p=$("#anni").html();
	$("#anni").removeClass("scomparemag");
	$("#anni").find('option').remove().end().append('<option label="">----</option>');
	$("#regioni").find('option').remove().end().append('<option label="">----</option>');
	 
	 $.ajax({
		  url: "GetInfoVino",
		  type: "GET",
		  data: "action=vinorosso&tipi="+obj.value,
		  success:function(result){
			  var jsonTipi = JSON.parse(result);
			  var i;
			  for(i=0;i<jsonTipi.length;i++)
				{
				  var anno=jsonTipi[i].anno;
				  $("#anni").append(new Option(anno,anno));
				 
				}
		  }
		});
}

function AddVls2(obj)
{
var t=$("#tipi").value;
var colOfSelectedOpt = document.getElementById("TIPO").selectedOptions;
var p=$("#regioni").html();
$("#regioni").removeClass("scomparemag");
$("#regioni").find('option').remove().end().append('<option label="">----</option>');
 
 $.ajax({
	  url: "GetInfoVino",
	  type: "GET",
	  data: "action=vinorosso&tipi="+colOfSelectedOpt[0].value+"&anno="+obj.value,
	  success:function(result){
		  var jsonTipi = JSON.parse(result);
		  var i;
		  for(i=0;i<jsonTipi.length;i++)
			{
			  console.log("prova");
			  var anno=jsonTipi[i].regione;
			  $("#regioni").append(new Option(anno,anno));
			 
			}
	  }
	});

}

function addCarr(obj)
{
	$.ajax({
		  url: "ProductControl",
		  type: "GET",
		  data: "action=addCart&id="+obj+"&tipo=null&qty=1",
		  success:function(result){
		  }
		});

}

function cercAj(obj,obj2)
{
	<%
	if(products != null && products.size()>0)
	{
		//div prodotti.
		Iterator<?> it=products.iterator();
		while(it.hasNext())
		{
			ProductBean bean=(ProductBean)it.next();
	%>
	
	var r="#tbodyy"+<%=bean.getCode()%>
	console.log(r);
  	$(r).find('tbody').remove().end();
	
	<%
		}
	}
	%>
	
	$.ajax({
		  url: "ProductControl",
		  type: "GET",
		  data: "action=cerca&lett="+obj.value,
		  success:function(result){
			  var jsonTipi = JSON.parse(result);
			  var i;
			  for(i=0;i<jsonTipi.length;i++)
				{
				
				  var el="SelProdContr?id_prod="+jsonTipi[i].code;
				  var img="./GetPicture?id="+jsonTipi[i].code;
				  var con1="<tbody><tr><td id='cambiamento'<table>";
				  var con2="</table></td></tr></tbody>"
				  var cont="<tbody id='ue'><tr><td> <a><button id='acquista' name='nome'";
				  var cont2="onclick='addCarr("+jsonTipi[i].code+")'>";
				  var cont3="<img id='imgCar' src='foto/aggiungi-al-carrello.png' style='width: 135px; height: 50px;'> </button> </a>";
				  var cont4="<td><img id='img"+jsonTipi[i].code+"'";
				  var cont5=" onclick='mostra("+jsonTipi[i].code+");cambiaImmagine("+jsonTipi[i].code+","+jsonTipi[i].code+")'";
				  var cont6=" class='preferitiIcon' src='foto/heart.png'></td></tr>";
				  var cont7="<td><img id='img"+jsonTipi[i].code+"'";
				  var cont8=" onclick='mostra("+jsonTipi[i].code+");cambiaImmagine("+jsonTipi[i].code+","+jsonTipi[i].code+")'";
				  var cont9=" class='preferitiIcon' src='foto/heartHover.png'></td></tr>";
				  var cont10="<td><img id='img"+jsonTipi[i].code+"'";
				  var cont11=" onclick='mostra("+jsonTipi[i].code+");cambiaImmagine("+jsonTipi[i].code+","+jsonTipi[i].code+")'";
				  var cont12=" class='preferitiIcon' src='foto/heart.png'></td></tr>";
				  var Html="<tbody><tr><td id='cambiamento'><table><tbody>"+
				  "<tr><td><a href="+el+">"+"<img alt='Errore' src="+img+" height='300' width='200'>"+"</a></td></tr></tbody>"+
				  "<tbody><tr><td><a href="+el+">"+jsonTipi[i].name+"</a></td></tr></tbody><tbody><tr><td id='prezzoProd'>"+jsonTipi[i].price+" euro</td></tr></tbody>"+cont+cont2+cont3;
				 	 if(obj2 != null)
					{
					  var j;
						  for(j=0;j<obj2.length;j++)
							{
							  console.log(obj2[j].name);
							  console.log(jsonTipi[i].name);
							  if(obj2[j].name==jsonTipi[i].name)
								  {
								  $('#tbodyy'+jsonTipi[i].code).append(Html+cont10+cont11+cont12);
								  }
							  else
								  {
								  $('#tbodyy'+jsonTipi[i].code).append(Html+cont4+cont5+cont6);
								  }
							 
							}
						
					  
					}
				  else
					  {
					  $('#tbodyy'+jsonTipi[i].code).append(Html+cont4+cont5+cont6);
					  } 
				<%--  <%
						 Object obj = request.getSession().getAttribute("preferiti");
					if(obj != null){
						ArrayList<ProductBean> listaProdotti = (ArrayList<ProductBean>)obj;
						ProductBean bean=(ProductBean)request.getAttribute("forsajax");
						if(!listaProdotti.contains(bean)){
							
				%>
					
				<%
						}
						
						else{
							
				%>
				console.log($('#tbodyy'+jsonTipi[i].code).html());
				$('#tbodyy'+jsonTipi[i].code).append(Html+cont7+cont8+cont9);
				<%
						}
					}
						else{
							
				%>
					console.log($('#tbodyy'+jsonTipi[i].code).html());
				 	$('#tbodyy'+jsonTipi[i].code).append(Html+cont10+cont11+cont12);
				 <%
						}
				 %>--%>
				}   		
		  }
	
		});


}

</script>

<div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>

</body>
</html>