/**
 * 
 */
function allLetter(uname)
{
	var letters = /^[A-Za-z]+$/;
	if(uname.value.match(letters))
	{
		return true;
	}
	else
	{
		alert('Username must have alphabet characters only');
		uname.focus();
		return false;
	}
}

function alphanumeric(uadd)
{
	var letters = /^[0-9a-zA-Z]+$/;
	if(uadd.value.match(letters))
	{
	return true;
	}
	else
	{
	alert("User address must have alphanumeric characters only");
	uadd.focus();
	}
	return false;
}

function checkNumber(inputtxt)
{
	var name=/^[0-9.]+$/;
	if(inputtxt.value.match(name))
		return true;
	return false;
}

function checkNamesurname(inputtxt)
{
	var name=/^[A-Za-z]+$/;
	if(inputtxt.value.match(name))
		return true;
	return false;
}

function checkUtente(inputtxt)
{
	var name=/^[0-9A-Za-z]+$/;
	if(inputtxt.value.match(name))
		return true;
	return false;
}
	
	function checkEmail(inputtxt){
		var email=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
		if(inputtxt.value.match(email))
			return true;
		return false;
	}
	
	function checkPhonenumber(inputtxt){
		var phoneno=/^([0-9]{3}-[0-9]{7})$/;
		if(inputtxt.value.match(phoneno))
		return true;
		
		return false;
	}
	
	
	
	function validatepas(obj,obj2)
	{
		var valid=true;
		var vpass=document.getElementsByName("vpsw")[0];
		var npass=document.getElementsByName("npsw")[0];
		var cpass=document.getElementsByName("cpsw")[0];
		if(obj2 != vpass.value)
		{
			valid=false;
			alert("Vecchia password errata");
		}
		if(npass.value != cpass.value)
			{
				valid=false;
				alert("Le due password non coincidono");
			}
		if(valid)
			obj.submit();
	}
	
	