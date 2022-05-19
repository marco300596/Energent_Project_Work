<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Academy Remove Confirmed</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body background= "/Image/back.jpg">
<div class="btn-group-vertical-center gap-2 col-6 mx-auto" style="margin-bottom: 10px; margin-top: 10px; background-color: #ffffff">
	<spring:url value="/academies" var="AccademiesURL" />
		<p class="text-center" style="font-size: 50px">The selected academy was succesfully removed.</p>
		<p class="text-center" style="font-size: 50px">Return to academies's list </p>
			<form:form method="post" action="${AccademiesURL}">
				<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">
				<img src ="/Image/homepage.png" height="25" width="30" style="margin-right: 10px"/>Academy home page</button>
			</form:form>
	<div class="container"><p style="visibility: hidden">.</p></div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>