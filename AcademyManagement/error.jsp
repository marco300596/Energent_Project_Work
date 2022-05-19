<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Errore</title>
</head>
<body>
<div class="container">
	<spring:url value="/updateAcademy" var="UpdateURL"/>
	<spring:url value="/academy" var="AddURL"/>
	<form:form method="post" action="${UpdateURL}">
	 	<button type="submit" class="btn btn-success" role="button">Update</button>
	</form:form>
	<form:form method="post" action="${AddURL}">
		  <button type="submit" class="btn btn-success" role="button">New</button>
	</form:form>
</div>
</body>
</html>