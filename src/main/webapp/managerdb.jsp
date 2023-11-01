<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
	<style >
	h1{
	padding-left: 25%;
	color: white;
	
	
	
	}
	body{
	background-image: url("https://cdn.pixabay.com/photo/2016/06/25/12/52/laptop-1478822_1280.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	}
	div ul li{
	padding-left: 20px;
	
	}
	#abc{
	padding-left: 350px;
	height: 50px;
	width: 50px;
	 
	}
	</style>
</head>
<body>
	<%!String msg = null;%>
	<%
	String check = (String) request.getAttribute("created");
	String taskCreation = (String) request.getAttribute("taskcreated");
	String viewemp = (String) request.getAttribute("noemp");
	String assigntask = (String) request.getAttribute("assigntask");
	String updatedtask = (String) request.getAttribute("taskupdated");
	if (check != null) {
		if (check.equals("yes")) {
			msg = "Employee Registered";
		} else {
			msg = "Fail";
		}
	} else if (taskCreation != null) {
		if (taskCreation.equals("yes")) {
			msg = "Task Created";
		} else {
			msg = "Fail";
		}
	} else if (viewemp != null) {
		if (viewemp.equals("true")) {
			msg = "No Employee Found";
		} else {
			msg = "Fail";
		}

	} else if (assigntask != null) {
		if (assigntask.equals("yes")) {
			msg = "Task Assign";
		} else {
			msg = "No Task Assgin";
		}

	} else if (updatedtask != null) {
		if (updatedtask.equals("yes")) {
			msg = "Task Updated";
		}
	} else {
		msg = "Welcome To Manager DashBoard";
	}
	%>
	<h1><%=msg%></h1>
	<br>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
		<div class="container-fluid">
			<a class="navbar-brand" href="signup.jsp"><h4>Create Employee</h4></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="createtask.jsp"><h4>Create Task </h4></a></li>
					<li class="nav-item"><a class="nav-link" href="task.jsp"><h4>Assign
							Task</h4></a></li>
					<li class="nav-item"><a class="nav-link" href="viewemp"><h4>View
							Employee</h4></a></li>
					<li class="nav-item"><a class="nav-link" href="updatetask.jsp"><h4>View
							Task</h4></a></li>
					<li class="nav-item" id="abc"><a class="nav-link"
						href="login.jsp"><h4>Logout</h4></a></li>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html>