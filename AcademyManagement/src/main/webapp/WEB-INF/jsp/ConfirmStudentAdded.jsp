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
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Confirm Student Added</title>
</head>
<body background= "/Image/back.jpg">
	<div class="btn-group-vertical-center gap-2 col-6 mx-auto" style="margin-bottom: 10px; margin-top: 10px; background-color: #ffffff">
	<spring:url value="/academies/${codeId}/students/add/${student.fCode}" var="StudentsURL" />
	<form:form modelAttribute="student" method="post" action="${StudentsURL}" cssClass="form">
		<p class="text-center" style="font-size: 50px">This is the student's detail you provided:</p>
		<div class="form-group">
			<label>Student Fiscal Code</label>
			<form:input path="fCode" cssClass="form-control" id="fCode" readonly="true"/>
		</div>
		<div class="form-group">
			<label>Student First Name</label>
			<form:input path="firstname" cssClass="form-control" id="firstname" readonly="true"/>
		</div>
		<div class="form-group">
			<label>Student Last Name</label>
			<form:input path="lastname" cssClass="form-control" id="lastname" readonly="true"/>
		</div>
		<div class="form-group">
			<label>Student Age</label>
			<form:input path="age" cssClass="form-control" id="age" readonly="true"/>
		</div>
		<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">
			<img src ="/Image/add-user.png" height="25" width="30" style="margin-right: 10px"/>Add Student & Go To Student's List</button>
	</form:form>
		<spring:url value="/academies/${codeId}/students/student" var="StudentURL" />
			<form:form method="post" action="${StudentURL}">
				<button type="submit" class="btn btn-danger" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">
					<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Restart To Edit</button>
			</form:form>
		<div class="container"><p style="visibility: hidden">.</p></div>
	</div>
	<jsp:include page="Footer.jsp" />

</body>
</html>