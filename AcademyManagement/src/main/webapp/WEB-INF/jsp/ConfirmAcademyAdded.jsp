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
<title>Confirm Academy Added</title>
</head>
<body background= "/Image/back.jpg">
	<div class = "container">
	<div class="btn-group-vertical-center gap-2 col-10 mx-auto" style="margin-bottom: 10px; margin-top: 10px; background-color: #ffffff">
	<spring:url value="/confirm/${academy.codeId}" var="AccademiesURL" />
	<form:form modelAttribute="academy" method="post" action="${AccademiesURL}" cssClass="form">
		<p class="text-center" style="font-size: 30px">This is the academy's detail you provided:</p>
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
		<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">
		<img src ="/Image/home.png" height="25" width="30" style="margin-right: 10px"/>Go To Academy's List</button>
	</form:form>
		<spring:url value="/academy" var="AccademyURL" />
			<form:form method="post" action="${AccademyURL}">
				<button type="submit" class="btn btn-danger" data-bs-toggle="button" autocomplete="off" type="button" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">
				<img src ="/Image/back-arrow.png" height="25" width="30" style="margin-right: 10px"/>Restart To Edit</button>
			</form:form>
			
	<div><p style="visibility: hidden">.</p></div>
	</div>
	</div>
	<jsp:include page="Footer.jsp" />

<script type="text/javascript">
       $(function() {
           $('#datepicker1').datepicker({
           	format: "dd/mm/yyyy"
           });
           $('#datepicker2').datepicker({
           	format: "dd/mm/yyyy"
           });
       });
</script>
</body>
</html>