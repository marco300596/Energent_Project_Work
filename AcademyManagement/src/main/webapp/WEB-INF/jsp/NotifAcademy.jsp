<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Errore</title>
</head>
	<body background= "/Image/back.jpg">
		<div class="container">
		<div class="form-group row">
		<div class="btn-group-vertical-center gap-2 col-6 mx-auto"  style="margin-bottom: 10px; margin-top: 10px; background-color: #ffffff">
		<spring:url value="/academies/${academy.codeId}/update" var="UpdateURL"/>
		<spring:url value="/academy" var="AddURL" />
		<form:form method="post" action="${UpdateURL}">
			<c:set value="${academy}" var="academy">
			<p class="text-center" style="font-size: 25px; margin-top: 20px">It would appear that the accademy you just inserted 
			was already in the system. Would you like to update it?</p>
			 	<button type="submit" class="btn btn-warning" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;" href="${academy.codeId}">Update</button>
			</c:set>
			</form:form>
			<form:form method="post" action="${AddURL}">
				  <button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">New</button>
			</form:form>
			<div><p style="visibility: hidden;">.</p></div>
		</div>
		</div>
		</div>
<jsp:include page="Footer.jsp" />
</body>
</html>