<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>File Upload</title>
</head>
<body>
	<h3>File Upload</h3>
	<form method="post" action="UploadControl" name="echo" enctype="multipart/form-data">
	<fieldset>
	<div class="tableRow">
			<label class="rcolor" for="username">Nome Prodotto:</label>
			<input type="text" id="username" name="name" value="" placeholder="Inserire nome" required> 
		</div>
	<legend>Select files(s)</legend>
	<input type="file" name="file" size="50" multiple required/><br>
	<input type="submit" value="Send">
	<input type="reset" value="Reset">
	</fieldset>
	</form>
</body>
</html>