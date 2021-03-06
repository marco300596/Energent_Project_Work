<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Academy's HomePage</title>
</head>
<body background= "/Image/back.jpg">
	<div class="btn-group-vertical-center gap-2 col-6 mx-auto"  style="margin-bottom: 50px; margin-top: 10px; background-color: rgba(0,0,0,.5);
    color: #ffffff; overflow: auto;">
		<spring:url value="/academy" var="AcademyURL" />
		<p class="text-center" style="font-size: 40px">What would you like to do?</p>
		<form:form modelAttribute="academy" method="post" action="${AcademyURL}">
	 		<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">
	 		<img src ="/Image/add.png" height="25" width="30" style="margin-right: 10px"/>Add New Accademy</button>
		</form:form>
		<spring:url value="/academies" var="AcademiesURL" />
		<form:form modelAttribute="academy" method="post" action="${AcademiesURL}">
			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">
			<img src ="/Image/home.png" height="25" width="30" style="margin-right: 10px"/>Go to Academy's list</button>
		</form:form>
		<p/>
		<div class="input-group">
		<spring:url value="/academies" var="AcademiesURL" />
		<form:form modelAttribute="message" method="post" action="${AcademiesURL}"
			cssClass="form">
			<div class="col-sm-10" style="margin-top: 10px; font-size: 20px">
			<label>Filtered Search</label>
			</div>
		  	<div class="col-sm-10" style="margin-top: 10px;">
				<label>Academy Code</label>
				<form:input path="code" cssClass="form-control" id="codeId" pattern="[a-zA-Z0-9]+" style="background-color: transparent; color:white;" oninvalid="alert('Please insert a code made of only letters and numbers')"/>
			</div>
			<div class="col-sm-10" style="margin-top: 10px">
				<label>Academy Name</label>
				<form:input path="name" cssClass="form-control" id="codeId" pattern="[a-zA-Z0-9#@~\s]+" style="background-color: transparent; color:white; text-transform: capitalize;" oninvalid="alert('Please insert a title made of only letters, numbers, #, @, ~ and spaces')"/>
			</div>
			<div class="col-sm-10" style="margin-top: 10px">
				<label>Academy Location</label>
				<form:input path="location" cssClass="form-control" id="codeId" pattern="[a-zA-Z\s]+" style="background-color: transparent; color:white; text-transform: capitalize;" oninvalid="alert('Please insert a location made of only letters and spaces')"/>
			</div>
			<div class="col-sm-10" style="margin-top: 10px">
				<label>Starting date</label>
				<form:input path="sdate" type="date" value="2022-01-01" style="background-color: transparent; color:white;" cssClass="form-control" id="codeId"/>
			</div>
			<div class="col-sm-10" style="margin-top: 10px">
				<label>Ending Date</label>
				<form:input path="edate" type="date" value="2022-01-01" style="background-color: transparent; color:white;" cssClass="form-control" id="codeId"/>
			</div>
			<div class="col-sm-10" style="margin-top: 10px">
				<label>Student's LastName</label>
				<form:input path="student" type="text" pattern="[a-zA-Z\s]+" style="background-color: transparent; color:white; text-transform: capitalize;" cssClass="form-control" id="codeId" oninvalid="alert('Please insert a lastname made of only letters and spaces')"/>
			</div>
			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-top: 10px; width: 210px; margin-left: 15px">
			<img src ="/Image/ricerca.png" height="15" width="15" style="margin-right: 5px"/>Go to the filtered Academy's list</button>
		</form:form>
		</div>
		<div><p style="visibility: hidden">.</p></div>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>