<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<%@page import="task.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user details</title>
<style>
#info {
	height: 40%;
	width: 30%;
	padding-top:20px;
	padding-left:20px;
	margin-top:3%;
	margin-left: 35%;
	margin-right: 25%;
	border: 3px solid black;
	background-color: white;
	color: black;
	opacity: 80%;
	font-family: monospace;
	font-style: oblique;
}

.heading {
padding-left:140px;
color:white;
font-size:45px;
font-style:oblique;
	margin: auto;
	margin-left: 30%;
	margin-right: 25%;
}
button{
padding-right:4px;
font-style:normal;
font-size:20px;
	margin-left: 48%;
	margin-right: 20%;
}

body {
background-image: url("https://cdn.pixabay.com/photo/2016/03/30/01/39/wood-1289840_1280.jpg");
background-repeat: no-repeat;
background-size: cover;
	
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	%>
	<h1 class="heading">
		Welcome
		<%=user.getName()%>
	</h1>

	<div id="info">



		<h2>
			id :<%=user.getId()%><br> name :<%=user.getName()%><br>
			email :<%=user.getEmail()%>
			<br> phone :<%=user.getPhone()%>
			<br> role :
			<%=user.getRole()%>
			<br> status :
			<%=user.getStatus()%>
		</h2>
		<br>
	</div>
	<br>
	<a class="but" href="employeedb.jsp">
		<button>BACK</button>
	</a>


</body>
</html>