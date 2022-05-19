<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Student</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<body background= "/Image/back.jpg">
	<div class="container" style="margin-bottom: 10px; margin-top: 10px;">
	<div class="form-group row">
	<div class="container" style="float: left; width: 40%; background-color: #ffffff">
		<spring:url value="/academies/${academy.codeId}/students/add/${student.fCode}" var="addURL" />
		<!--ModelAttribute=n collegamento tra model e view     -->
		<form:form modelAttribute="student" method="post" action="${addURL}" cssClass="form">
		<div class="col-sm-10">
		<h2></h2>
		</div>
		<div class="col-sm-10">
		<h2 style="margin-top: 15px">Add Student</h2>
		</div>
			<div class="col-sm-10">
				<label>Fiscal Code (Insert 16 caracters with only uppercase and number)
				</label>
				<form:input path="fCode" cssClass="form-control" required="required" id="fCode" pattern="[A-Z0-9]+" maxlength="16" minlength="16"/>
			</div>
			<div class="col-sm-10">
				<label>Firstname</label>
				<form:input path="firstname" cssClass="form-control" required="required" id="firstname" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="col-sm-10">
				<label>Lastname</label>
				<form:input path="lastname" cssClass="form-control" required="required" id="lastname" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="col-sm-10">
				<label>Age</label>
				<form:input path="age" type="number" cssClass="form-control" required="required" id="age" min="18" max="110" pattern="[0-9]*"/>
			</div>
			<button type="submit" class="btn btn-success" style="margin-top: 10px; margin-left: 15px;">
			<img src ="/Image/add-user.png" height="25" width="30" style="margin-right: 10px"/>Add New Student</button>
		</form:form>
		<spring:url value="/academies/${academy.codeId}/students" var="studentURL" />
		<form:form method="post" action="${studentURL}">
			<button type="submit" class="btn btn-danger" role="button" href="${academy.codeId}" style="margin-top: 10px; margin-left: 15px; margin-bottom: 20px">
			<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Back</button>
		</form:form>
		<div class="container"></div>
	</div>
	</div>
	</div>
	
<jsp:include page="Footer.jsp" />
</body>
</html>