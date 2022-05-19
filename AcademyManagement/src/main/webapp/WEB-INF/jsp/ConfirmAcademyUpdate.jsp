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
<title>Update Academy Approved</title>
</head>
<body background= "/Image/back.jpg">
	<div class="container" style="margin-bottom: 10px; margin-top: 10px">
	<div class="form-group row">
	<div class="container" style="float: left; width: 40%">
	<spring:url value="/academies" var="AcademiesURL" />
	<form:form modelAttribute="academy" method="post" style = "background-color: #ffffff" action="${AcademiesURL}" cssClass="form">
		<p/>
		<p class="text-center" style="font-size: 30px;">The academy selected is now updated:</p>
		<div class="form-group" style="margin-top: 10px; margin-left: 10px; margin-right: 10px">
			<label>Academy Code</label>
			<form:input path="codeId" cssClass="form-control" id="codeId" readonly="true"/>
		</div>
		<div class="form-group" style="margin-top: 10px; margin-left: 10px; margin-right: 10px">
			<label>Academy Title</label>
			<form:input path="title" cssClass="form-control" id="title" readonly="true"/>
		</div>
		<div class="form-group" style="margin-top: 10px; margin-left: 10px; margin-right: 10px">
			<label>Location</label>
			<form:input path="location" cssClass="form-control" id="location" readonly="true"/>
		</div>
		<div class="form-group" style="margin-top: 10px; margin-left: 10px; margin-right: 10px">
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
		<div class="form-group" style="margin-top: 10px; margin-left: 10px; margin-right: 10px">
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
		<button type="submit" class="btn btn-primary" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; margin-left: 10px; margin-bottom: 20px; width: 200px; display: inline-block;">
		<img src ="/Image/home.png" height="25" width="30" style="margin-right: 10px"/>Go to Academy's list</button>
	</form:form>
	</div>
	</div>
	</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>