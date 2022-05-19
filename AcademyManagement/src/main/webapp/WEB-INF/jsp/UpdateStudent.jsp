<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<title>Update Student</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<body background= "/Image/back.jpg">
	<div class="container" style="margin-bottom: 10px; margin-top: 10px">
	<div class="form-group row">
	<div class="container" style="float: left; width: 40%; background-color: #ffffff;">
		<!--ModelAttribute=n collegamento tra model e view     -->
		<spring:url value="/academies/${academy.codeId}/students/update/approved" var="updateURL" />
		<spring:url value="/academies/${academy.codeId}/students" var="studentsURL" />
		<h2 style="margin-bottom: 10px; margin-top: 10px">Update Student</h2>
		<!--ModelAttribute=n collegamento tra model e view     -->
		<form:form modelAttribute="student" method="post" action="${updateURL}"
			cssClass="form">
			<div class="form-group">
				<label>Fiscal Code:</label>
				<form:input path="fCode" cssClass="form-control" id="firstname" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Firstname:</label>
				<form:input path="firstname" cssClass="form-control" id="firstname" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="form-group">
				<label>Lastname</label>
				<form:input path="lastname" cssClass="form-control" id="lastname" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="form-group">
				<label>Age:</label>
				<form:input path="age" cssClass="form-control" id="age" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<button type="submit" class="btn btn-info" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">
			<img src ="/Image/confirmation.png" height="25" width="30" style="margin-right: 10px"/>Update Student</button>
		</form:form>
		<form:form method="post" action="${studentsURL}">
			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">
			<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Back</button>
		</form:form>
		<div><p style="visibility: hidden">.</p></div>
		</div>
		</div>
		</div>
<jsp:include page="Footer.jsp" />
</body>
</html>