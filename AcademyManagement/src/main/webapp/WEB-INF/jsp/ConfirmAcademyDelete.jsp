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
<title>Remove Academy</title>
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
		<spring:url value="/academies/${academy.codeId}/remove/confirm" var="removeURL" />
		<!--ModelAttribute=n collegamento tra model e view     -->
		<form:form modelAttribute="academy" method="post" action="${removeURL}"
			cssClass="form">
		<p/>
		<p class="text-center" style="font-size: 25px; margin-top: 20px">Remove the following Academy</p>
		<div class="form-group">
				<label>Academy Code</label>
				<form:input path="codeId" cssClass="form-control" id="codeId" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Academy Title</label>
				<form:input path="title" cssClass="form-control" id="title" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Location</label>
				<form:input path="location" cssClass="form-control" id="location" readonly="true"/>
			</div>
			<div class="form-group">
			<label>Starting Date</label>
	            <div class="form-group">
	                <div class="input-group date" id="datepicker1">
	                    <form:input path="startDate" type="text" class="form-control" id="startDate" readonly="true"/>
	                    <span class="input-group-append">
	                        <span class="input-group-text bg-white d-block">
	                            <i class="fa fa-calendar"></i>
	                        </span>
	                    </span>
	                </div>
	            </div>
            </div>
			<div class="form-group">
			<label>Ending Date</label>
                <div class="form-group">
                    <div class="input-group date" id="datepicker2">
                        <form:input path="endDate" type="text" class="form-control" id="endDate" readonly="true"/>
                        <span class="input-group-append">
                            <span class="input-group-text bg-white d-block">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </span>
                    </div>
                </div>
        	</div>
        	<p class="text-center" style="font-size: 25px; margin-top: 40px"> With the following student</p>
        	<table class="table table-striped table-dark">
			<tbody>
				<c:forEach items="${students}" var="student">
					<tr>
					    <td>${student.fCode}</td>
						<td>${student.firstname}</td>
						<td>${student.lastname}</td>
						<td>${student.age}</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>	
        	<button type="submit" class="btn btn-danger" style="display: block; margin: 0 auto; margin-bottom: 10px; margin-top: 10px; width: 200px;">
        	<img src ="/Image/confirmation.png" height="25" width="30" style="margin-right: 10px"/>Confirm Remove Academy</button>
		</form:form>
		<spring:url value="/academies" var="academiesURL"/>
		<form:form method="post" action="${academiesURL}">
			<button type="submit" class="btn btn-success" style="display: block; margin: 0 auto; margin-bottom: 10px; margin-top: 10px; width: 200px;">
			<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Return to Academies's List</button>
		</form:form>
		</div>
		</div>
		<div class="push" style="margin-bottom: 50px;"></div>
		</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>