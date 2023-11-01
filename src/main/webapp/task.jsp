<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="task.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task</title>
<style type="text/css">
button a {
	margin-left: 10%;
	text-decoration: none;
	color: black;
}

.sub {
	margin-left: 2%;
}

body {
	background-color: grey;
}
</style>
</head>
<body>
	<%
	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("akash");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();

	Query query = entityManager.createQuery("select t from Task t where t.statusOfTask=?1");
	query.setParameter(1, "notassign");
	List<Task> list = query.getResultList();
	%>
	<div class="tb">
		<h1>Task Info</h1>

		<table cellspacing="0px" cellpadding="15px" border="2px">
			<tr class="rowlen">
				<th>Task ID</th>
				<th>Description</th>
				<th>Createddate</th>
				<th>CompletedDate</th>
				<th>Status</th>
			</tr>
			<%
			if (list != null && !list.isEmpty()) {
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
			}
			%>
		</table>
	</div>

<br><br>
	<form action="assigned">

		Enter Employee Id :<input type="text" name="user_id"> Enter
		Task Id : <input type="text" name="task_id"> <br> <br>
		<input class="sub" type="submit" value="Assign">

		<button>
			<a href="managerdb.jsp">Back</a>
		</button>
	</form>
</body>
</html>