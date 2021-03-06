<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Successful Operation </title>
</head>
<body background= "/Image/back.jpg">
<div class="btn-group-vertical-center gap-2 col-6 mx-auto" style="margin-bottom: 10px; margin-top: 10px; background-color: rgba(0,0,0,.5);
    color: #ffffff; overflow: auto">
	<spring:url value="/academiesHP" var="AccademiesURL" />
		<p class="text-center" style="font-size: 50px">The requested operation was successful </p>
		<p class="text-center" style="font-size: 50px"> Return to home page </p>
			<form:form method="post" action="${AccademiesURL}">
				<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">
				<img src ="/Image/homepage.png" height="25" width="30" style="margin-right: 10px"/>Academy home page</button>
			</form:form>
	<div class="container"><p style="visibility: hidden">.</p></div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>
