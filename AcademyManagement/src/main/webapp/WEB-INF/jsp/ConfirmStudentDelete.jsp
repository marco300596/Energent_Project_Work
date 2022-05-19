<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Student</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body background= "/Image/back.jpg">
	<div class="container" style= "margin-top: 10px">
	<div class="form-group row">
	<div class="container" style="float: left; margin-bottom: 20px; width: 40%; background-color: #ffffff">
		<spring:url value="/academies/${academy.codeId}/students/remove/confirm" var="removeURL" />
		<h2>Remove Student</h2>
		<!--ModelAttribute=n collegamento tra model e view     -->
		<form:form modelAttribute="student" method="post" action="${removeURL}"
			cssClass="form">
			<div class="form-group">
				<label>Fiscal Code</label>
				
				<form:input path="fCode" cssClass="form-control" id="fCode" readonly="true" />
			</div>
			<div class="form-group">
				<label>Firstname</label>
				<form:input path="firstname" cssClass="form-control" id="firstname" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Lastname</label>
				<form:input path="lastname" cssClass="form-control" id="lastname" readonly="true" />
			</div>
			<div class="form-group">
				<label>Age</label>
				<form:input path="age" cssClass="form-control" id="age" readonly="true" />
			</div>
			<button type="submit" class="btn btn-danger" style="display: block; margin: 0 auto; margin-bottom: 10px; margin-top: 10px; width: 200px;">
			<img src ="/Image/confirmation.png" height="25" width="30" style="margin-right: 10px"/>Confirm Removing Student</button>
		</form:form>
		<spring:url value="/academies/${academy.codeId}/students" var="studentsURL"/>
		<form:form method="post" action="${studentsURL}">
			<button type="submit" class="btn btn-success" style="display: block; margin: 0 auto; margin-bottom: 10px; margin-top: 10px; width: 200px;">
			<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Return to Students Page</button>
		</form:form>
	<div><p style="visibility: hidden">.</p></div>
	</div>
	</div>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>