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
<title>Report List</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body background= "/Image/back.jpg">
	<div class="container text-center" style="margin-bottom: 20px; margin-top: 20px; background-color: rgba(0,0,0,.5);
    color: #ffffff; overflow: auto;">
	<div><p style="visibility: hidden;">.</p></div>
	<p style="font-size: 30px;">this is the report of all academies</p>
		<table class="table table-bordered table-dark">
			<tbody>
			<form:form modelAttribute="message"></form:form>
				<!--  items="${products}"<-> session.getAttribute("products") -->
				<tr>
				    <th scope="col">Academy's Code</th>
				    <th scope="col">Academy's Title</th>
				    <th scope="col">Academy's Location</th>
				    <th scope="col">Academy's Start Date</th>
					<th scope="col">Academy's End Date</th>
				</tr>
					
				<c:forEach items="${academies}" var="academy">
					<tr>
						<td>${academy.codeId}</td>
						<td>${academy.title}</td>
						<td>${academy.location}</td>
						<td>${academy.startDate}</td>
						<td>${academy.endDate}</td>
						<!-- href invia sempre richieste di get, se volessimo un post bisogna SEMPRE specificarlo in form nella sezione method -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
				<!--  items="${products}"<-> session.getAttribute("products") -->
		<p style= "font-size: 30px; margin-top: 25px">this is the report of all the students in them</p>
		<table class="table table-bordered table-dark">
			<tbody>
				<tr>
				    <th scope="col">Student's Fiscal Code</th>
				    <th scope="col">Student's FirstName</th>
				    <th scope="col">Student's LastName</th>
				    <th scope="col">Student's Age</th>
				</tr>
				<c:forEach items="${students}" var="student">
					<tr>
						<td>${student.fCode}</td>
						<td>${student.firstname}</td>
						<td>${student.lastname}</td>
						<td>${student.age}</td>
						<!-- href invia sempre richieste di get, se volessimo un post bisogna SEMPRE specificarlo in form nella sezione method -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<spring:url value="/home" var="academiesURL" />
			<form:form method="get" action="${academiesURL}">
				<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; width: 200px; display: inline-block; margin-top: 10px; margin-bottom: 20px">
				<img src ="/Image/home.png" height="25" width="30" style="margin-right: 10px"/>Return To HomePage</button>
			</form:form>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>