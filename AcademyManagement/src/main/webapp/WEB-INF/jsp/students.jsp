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
<title>Students List</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<body background= "/Image/back.jpg">
	<div class="container" style="margin-bottom: 10px; margin-top: 10px">
		<p class="text-center" style="font-size: 40px;">Academy's Student</p>
		<table class="table table-striped table-dark">
			<tbody>
				<c:forEach items="${students}" var="student">
					<tr>
					    <td>${student.fCode}</td>
						<td>${student.firstname}</td>
						<td>${student.lastname}</td>
						<td>${student.age}</td>
						<td>
							<spring:url value="/academies/${academy.codeId}/students/update/${student.fCode}" var="editURL" />
							<form:form method ="post" action="${editURL}">
								<button type="submit" class="btn btn-primary" role="button">
								<img src ="/Image/updated.png" height="25" width="30" style="margin-right: 10px"/>Update</button>
							</form:form>
						</td>
						<td>
							<spring:url value="/academies/${academy.codeId}/students/remove/${student.fCode}" var="deleteStudentURL" /> 
							<form:form method ="post" action="${deleteStudentURL}">
								<button type="submit" class="btn btn-danger" role="button">
								<img src ="/Image/delete.png" height="25" width="30" style="margin-right: 10px"/>DeleteStudent</button>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<spring:url value="/academies/${academy.codeId}/students/student" var="addStudentURL" /> 
		<form:form method ="post" action="${addStudentURL}">
			<button type="submit" class="btn btn-success" role="button" style="margin-bottom: 50px;">
			<img src ="/Image/add-user.png" height="25" width="30" style="margin-right: 10px"/>AddStudent</button>
		</form:form>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>