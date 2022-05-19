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
<title>Academies List</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body background= "/Image/back.jpg">
	<div class="container" style="margin-bottom: 20px; margin-top: 20px">
		<table class="table table-striped table-dark">
			<tbody>
			<form:form modelAttribute="message"></form:form>
				<!--  items="${products}"<-> session.getAttribute("products") -->
				
				<c:forEach items="${academies}" var="academy">
					<tr>
						<td>${academy.codeId}</td>
						<td>${academy.title}</td>
						<td>${academy.location}</td>
						<td>${academy.startDate}</td>
						<td>${academy.endDate}</td>
						<td>
							<spring:url value="/academies/${academy.codeId}/update" var="editURL" />
							<form:form method="post" action="${editURL}">
							<button type="submit" class="btn btn-info" role="button" href="${editURL}">
							<img src ="/Image/updated.png" height="25" width="30" style="margin-right: 10px"/>Update</button>
							</form:form>
						</td>
						<td>
							<spring:url value="/academies/${academy.codeId}/remove" var="deleteURL" />
							<form:form method="post" action="${deleteURL}">
								<button type="submit" class="btn btn-danger" role="button">
								<img src ="/Image/delete.png" height="25" width="30" style="margin-right: 10px"/>Delete</button>
							</form:form>
						</td>
						<td>
							<spring:url value="/academies/${academy.codeId}/students" var="studentURL" />
							<form:form method="post" action="${studentURL}">
							<button type="submit" class="btn btn-success" role="button" href="${academy.codeId}">
							<img src ="/Image/students.png" height="25" width="30" style="margin-right: 10px"/>Students</button>
							</form:form>
						</td>
							<!-- href invia sempre richieste di get, se volessimo un post bisogna SEMPRE specificarlo in form nella sezione method -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<spring:url value="/academy" var="addURL" />
			<form:form method="post" action="${addURL}">
				<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; margin-right: 50px; width: 200px; display: inline-block;  margin-bottom: 50px">
				<img src ="/Image/add.png" height="25" width="30" style="margin-right: 10px"/>Add Academy</button>
			</form:form>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>