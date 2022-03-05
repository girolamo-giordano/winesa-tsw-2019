<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 	String nome=(String)request.getAttribute("nome");
	if(nome==null) nome="";
	
	String cognome=(String)request.getAttribute("cognome");
	if(cognome==null) cognome="";
	
	String indirizzo =(String) request.getAttribute("indirizzo");
	if(indirizzo==null) indirizzo="";
	
	String citta=(String)request.getAttribute("citta");
	if(citta==null) citta="";
	
	String email =(String) request.getAttribute("email");
	if(email==null) email="";
	
	String username=(String)request.getAttribute("username");
	if(username==null) username="";
	
	String password =(String) request.getAttribute("password");
	if(password==null) password="";
	
	
	
%>

<html>
<head>
<link rel="icon" href="foto/favicon.ico">
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<LINK rel= "stylesheet" href="home.css" type="text/css">
<LINK rel= "stylesheet" href="registrazione.css" type="text/css">
<script src="jquery-3.js"></script>
</head>
<body>
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

<div id="header">
<header class="top"> 
<a href="home.jsp"> <img src="foto/winesa1.png"> </a>
</header>

 
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
			<li><a href="Login.jsp">Login</a></li>
			<li  class="selected" ><a href="registrazione.jsp">Registrati</a></li>
			<li><a href="carrello.jsp"><img src ="foto/carrello2.png"> </a></li>
		</div>
	</ul>
	</div>
</nav>
</div>

<div id="form">
<form name="checkforname" method="post" action="RegControl" onsubmit="event.preventDefault();validate(this)">

<fieldset>
	
		<h2 id=titolo> REGISTRAZIONE</h2>
		<h4 id="RegLog"> Hai già un account? <a id="Torna" href="Login.jsp" >Torna al Login </a></h4>
		
		<fieldset id="primoF">
			<legend>Dati Personali</legend>
		<div class="tableRow">
			<label class="rcolor" for="cognome">Nome:</label>
			<input type="text" id="name" name="name" value="<%=nome %>" placeholder="Inserire nome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="nome">Cognome:</label>
			<input type="text" id="cognome" name="cognome" value="<%=cognome %>" placeholder="Inserire cognome.." required> 
		</div>
		<div class="tableRow">
			<label class="rcolor" for="indirizzo">Indirizzo:</label>
			<input type="text" id="indirizzo" name="indirizzo" value="<%=indirizzo %>" placeholder="Inserire indirizzo.." required> 
		</div>
		
		
		
		<div class="tableRow">
			<label class="rcolor" for="provincia">Provincia: </label>
 			<select name="citta" id="provincia">
    			<option selected="selected">--</option>
                <optgroup label="Valle d'Aosta">
                	<option value="AO">AOSTA</option>
                </optgroup>
        
                <optgroup label="Piemonte">
                	<option value="AL">ALESSANDRIA</option>
                    <option value="AT">ASTI</option>
                    <option value="BI">BIELLA</option>
                    <option value="CN">CUNEO</option>
                    <option value="NO">NOVARA</option>
                    <option value="TO">TORINO</option>
                    <option value="VB">VERBANO-CUSIO-OSSOLA</option>
                    <option value="VC">VERCELLI</option>
                    
                </optgroup>
        
                <optgroup label="Liguria">
                	<option value="GE">GENOVA</option>
                    <option value="IM">IMPERIA</option>
                    <option value="SP">LA SPEZIA</option>
                    <option value="SV">SAVONA</option>
                </optgroup>
        
                <optgroup label="Lombardia">
                	<option value="BG">BERGAMO</option>
                    <option value="BS">BRESCIA</option>
                    <option value="CO">COMO</option>
                    <option value="CR">CREMONA</option>
                    <option value="LC">LECCO</option>
					<option value="LO">LODI</option>
                    <option value="MN">MANTOVA</option>
                    <option value="MI">MILANO</option>
                    <option value="MB">MONZA - BRIANZA</option>
                    <option value="PV">PAVIA</option>
                    <option value="SO">SONDRIO</option>
                    <option value="VA">VARESE</option>                    
                </optgroup>
        
                <optgroup label="Trentino-Alto Adige">
                	<option value="BZ">BOLZANO</option>
                    <option value="TN">TRENTO</option>
                </optgroup>
        
                <optgroup label="Veneto">
                	<option value="BL">BELLUNO</option>
                    <option value="PD">PADOVA</option>
                    <option value="RO">ROVIGO</option>
                    <option value="TV">TREVISO</option>
                    <option value="VE">VENEZIA</option>
					<option value="VR">VERONA</option>
                    <option value="VI">VICENZA</option>
                </optgroup>
        
                <optgroup label="Friuli-Venezia Giulia">
                	<option value="GO">GORIZIA</option>
                    <option value="PN">PORDENONE</option>
                    <option value="TS">TRIESTE</option>
                    <option value="UD">UDINE</option>
                </optgroup>
        
                <optgroup label="Emilia-Romagna">
                	<option value="BO">BOLOGNA</option>
                    <option value="FE">FERRARA</option>
					<option value="FC">FORLI'-CESENA</option>
                    <option value="MO">MODENA</option> 
                    <option value="PR">PARMA</option>
                    <option value="PC">PIACENZA</option>
                    <option value="RA">RAVENNA</option>
                    <option value="RE">REGGIO NELL'EMILIA</option> 
                    <option value="RN">RIMINI</option>        
                </optgroup>
        
                <optgroup label="Toscana">
                	<option value="AR">AREZZO</option>
                    <option value="FI">FIRENZE</option>
                    <option value="GR">GROSSETO</option>
                    <option value="LI">LIVORNO</option>
                    <option value="LU">LUCCA</option>
                    <option value="MS">MASSA-CARRARA</option>
                    <option value="PI">PISA</option>
					<option value="PT">PISTOIA</option>
                    <option value="PO">PRATO</option>
                    <option value="SI">SIENA</option>
                </optgroup>
        
                <optgroup label="Umbria">
                	<option value="PG">PERUGIA</option>
                    <option value="TR">TERNI</option>
                </optgroup>
        
                <optgroup label="Marche">
                	<option value="AN">ANCONA</option>
                    <option value="AP">ASCOLI PICENO</option>
                    <option value="FM">FERMO</option>
                    <option value="MC">MACERATA</option>
                    <option value="PU">PESARO E URBINO</option>
                </optgroup>
        
                <optgroup label="Lazio">
                	<option value="FR">FROSINONE</option>
                    <option value="LT">LATINA</option>
                    <option value="RM">ROMA</option>
                    <option value="RI">RIETI</option>
                    <option value="VT">VITERBO</option>
                </optgroup>
        
                <optgroup label="Abruzzo">
                	<option value="CH">CHIETI</option>
                    <option value="AQ">L'AQUILA</option>
                    <option value="PE">PESCARA</option>
                    <option value="TE">TERAMO</option>
                    
                </optgroup>
        
                <optgroup label="Molise">
                	<option value="CB">CAMPOBASSO</option>
                    <option value="IS">ISERNIA</option>
                </optgroup>
        
                <optgroup label="Campania">
                    <option value="AV">AVELLINO</option>
                    <option value="BN">BENEVENTO</option>
                    <option value="CE">CASERTA</option>
                    <option value="NA">NAPOLI</option>
                    <option value="SA">SALERNO</option>
                </optgroup>
        
                <optgroup label="Puglia">
                	<option value="BA">BARI</option>
                	<option value="BT">BARLETTA-ANDRIA-TRANI</option>
                    <option value="BR">BRINDISI</option>
                    <option value="FG">FOGGIA</option>
                    <option value="LE">LECCE</option>
                    <option value="TA">TARANTO</option>
                </optgroup>
        
                <optgroup label="Basilicata">
                	<option value="MT">MATERA</option>
                    <option value="PZ">POTENZA</option>
                </optgroup>
        
                <optgroup label="Calabria">
                	<option value="CZ">CATANZARO</option>
                    <option value="CS">COSENZA</option>
                    <option value="KR">CROTONE</option>
                    <option value="RC">REGGIO DI CALABRIA</option>
                    <option value="VV">VIBO VALENTIA</option>
                </optgroup>
        
                <optgroup label="Sicilia">
                	<option value="AG">AGRIGENTO</option>
                    <option value="CL">CALTANISSETTA</option>
                    <option value="CT">CATANIA</option>
                    <option value="EN">ENNA</option>
                    <option value="ME">MESSINA</option>
                    <option value="PA">PALERMO</option>
                    <option value="RG">RAGUSA</option>
					<option value="SR">SIRACUSA</option>
                    <option value="TP">TRAPANI</option>
                    
                </optgroup>
        
                <optgroup label="Sardegna">
                	<option value="CA">CAGLIARI</option>
                    <option value="CI">CARBONIA - IGLESIAS</option>
                    <option value="VS">MEDIO CAMPIDANO</option>
                    <option value="NU">NUORO</option>
                    <option value="OG">OGLIASTRA</option>
                    <option value="OT">OLBIA - TEMPIO</option>
                    <option value="OR">ORISTANO</option>
                    <option value="SS">SASSARI</option>
                </optgroup>
            </select>
    
        
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="email">Email:</label>
			<input type="email" id="email" name="email" value="<%=email%>" placeholder="Inserire email.." required>
		</div>
		
		</fieldset>
		
		<fieldset id="secondoF">
			<legend> Credenziali</legend>
			
			<div class="tableRow">
			<label class="rcolor" for="username">Username:</label>
			<input type="text" id="user" name="username" value="<%=username%>" placeholder="Inserire username.." required> 
		</div>
		
		
		<div class="tableRow">
			<label class="rcolor" for="password">Password:</label>
			<input type="password" id="password" name="password" value="<%=password%>" placeholder="Inserire password.." required>
		</div>
		
		<div id="mostra"> <input type="checkbox" onclick="myFunction()"> Mostra Password </div>
			
		</fieldset>
		
			<label></label>
			<input class="submit" type="submit" value="Registrati">
			<input class ="reset" type="reset">
		
	</fieldset>
	</form>
</div>


<div id="footer">
      &copy; 2019, WineSa e-commerce
      <br>
      All trademarks and registered trademarks appearing on 
      this site are the property of their respective owners.
</div>

<!-- :include page(url) -->

<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}

function validate(obj){
	var valid=true;
	var name=document.getElementsByName("name")[0];
	if(!checkNamesurname(name)){
		valid=false;
		$("#name").addClass("error");
		$("#errorna1").remove();
		$("#name").after('<label id="errorna1" >Nome Utente Errato</label>');
	}else{
		$("#errorna1").remove();
		$("#name").removeClass("error");
	}
	
	var cutente=document.getElementsByName("username")[0];
	if(!checkUtente(cutente))
		{
			valid=false;
			$("#user").addClass("error");
			$("#errorna2").remove();
			$("#user").after('<label id="errorna2" >Utente Errato</label>');
		}else{
			$("#errorna2").remove();
			$("#user").removeClass("error");
		}
	
	var surname=document.getElementsByName("cognome")[0];
	if(!checkNamesurname(surname)){
		valid=false;
		$("#cognome").addClass("error");
		$("#errorna3").remove();
		$("#cognome").after('<label id="errorna3" >Cognome Errato</label>');
	}else{
		$("#errorna3").remove();
		$("#cognome").removeClass("error");
	}
	
	var email=document.getElementsByName("email")[0];
	if(!checkEmail(email)){
		valid=false;
		$("#email").addClass("error");
		$("#errorna4").remove();
		$("#email").after('<label id="errorna4" >Email Errata</label>');
	}else{
		$("#errorna4").remove();
		$("#email").removeClass("error");
	}
	if(valid)obj.submit();
}
</script>




<script src="javascriptcode.js"></script>

</body>
</html>