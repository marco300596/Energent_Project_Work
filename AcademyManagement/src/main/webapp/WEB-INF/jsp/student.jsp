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
	<div class="container" style="float: left; width: 40%; background-color: rgba(0,0,0,.5);
    color: #ffffff; overflow: auto">
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
				<form:input path="fCode" style="background-color: transparent; color:white;" cssClass="form-control" required="required" id="fCode" pattern="[A-Z0-9]+" maxlength="16" minlength="16" oninvalid="alert('Please insert a fiscal code made of only uppercase letters and numbers')" onkeyup="var start = this.selectionStart; var end = this.selectionEnd; this.value = this.value.toUpperCase(); this.setSelectionRange(start, end);"/>
			</div>
			<div class="col-sm-10">
				<label>Firstname</label>
				<form:input path="firstname" style="background-color: transparent; color:white; text-transform: capitalize;" cssClass="form-control" required="required" id="firstname" pattern="[a-zA-Z\s]+" oninvalid="alert('Please insert a name made of only letters and spaces')"/>
			</div>
			<div class="col-sm-10">
				<label>Lastname</label>
				<form:input path="lastname" style="background-color: transparent; color:white; text-transform: capitalize;" cssClass="form-control" required="required" id="lastname" pattern="[a-zA-Z\s]+" oninvalid="alert('Please insert a lastname made of only letters and spaces')"/>
			</div>
			<div class="col-sm-10">
				<label>Age</label>
				<form:input path="age" style="background-color: transparent; color:white;" type="number" cssClass="form-control" required="required" id="age" min="18" max="70" pattern="[0-9]*" oninvalid="alert('Please insert an age made of only numbers ranging from 18 to 70')"/>
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