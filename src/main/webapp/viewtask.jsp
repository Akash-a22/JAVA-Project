<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Task</title>
<style type="text/css">
.tb{
	height: 40%;
	width: 30%;
	padding-top:20px;
	padding-left:20px;
	margin-top:3%;
	margin-left: 30%;
	margin-right: 25%;
	
	background-color: white;
	color: black;
	opacity: 80%;
	font-family: monospace;
	font-style: normal;
}
.rowlen{
width:300px;
padding-left: 20px;
padding-right: 20px;
}
h1{
padding-left: 50%;
}
</style>
</head>
<body>
	<%
	List<Task> list = (List<Task>) session.getAttribute("usertask");
	%>
	
	<div class="tb">
	<h1>Task Info</h1>

	<table cellspacing="0px" cellpadding="15px" border="2px" >
		<tr class="rowlen">
			<th>Task ID</th>
			<th>Description</th>
			<th>Createddate</th>
			<th>CompletedDate</th>
			<th>Status</th>
		</tr>
		<%
		for (int i = 0; i < list.size(); i++) {
			Task task = list.get(i);
		%>
		<tr class="rowlen">
			<td><%=task.getId()%></td>
			<td><%=task.getDescription()%></td>
			<td><%=task.getCreadtedDateAndTime()%></td>
			<td><%=task.getCompletedDateAndTime()%></td>
			<td><%=task.getStatusOfTask()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<br>
	<a href="employeedb.jsp">
		<button>back</button>
	</a>
	</div>

</body>
</html>