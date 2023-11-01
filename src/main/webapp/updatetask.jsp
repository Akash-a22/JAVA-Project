<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="task.Task"%>
<%@page import="task.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Update</title>
<style>
a{
text-decoration: none;
color: black;
}
</style>
</head>
<body>
	
		<%!String msg = "";%>
		<%
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("akash");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		Query query = entityManager.createQuery("select t from Task t");

		List<Task> list = query.getResultList();
		list.sort((Task t1,Task t2) -> { return t1.getStatusOfTask().compareTo(t2.getStatusOfTask());});
		%>
		<h3>Task List</h3>
		<table cellspacing="0px" cellpadding="10px" border="2px">
			<tr>
				<th>id</th>
				<th>description</th>
				<th>created date and time</th>
				<th>completed date time</th>
				<th>status</th>
				<th>employee Id</th>
				<th>Employee Name</th>
				<th>update</th>
				<th>remove</th>
			</tr>
			<%
			for (Task task : list) {
				if(task.getUser()!= null){
					
				
			%>
			<tr>
				<td><%=task.getId()%></td>
				<td><%=task.getDescription()%></td>
				<td><%=task.getCreadtedDateAndTime()%></td>
				<td><%=task.getCompletedDateAndTime()%></td>
				<td><%=task.getStatusOfTask()%></td>
				<th><%=task.getUser().getId()%></th>
				<th><%=task.getUser().getName()%></th>
				<td> <a
					href="uptask.jsp?id=<%=task.getId()%>&desc=<%=task.getDescription()%>>"> <button>Update</button> </a>
				<td><a href="removetask?id=<%=task.getId()%>"> <button>Remove</button> </a>
			</tr>
			<%
				}
				else{
					%>
				
				<tr>
				<td><%=task.getId()%></td>
				<td><%=task.getDescription()%></td>
				<td><%=task.getCreadtedDateAndTime()%></td>
				<td><%=task.getCompletedDateAndTime()%></td>
				<td><%=task.getStatusOfTask()%></td>
				<td>null</td>
				<td>null</td>
				<td> <a
					href="uptask.jsp?id=<%=task.getId()%>&desc=<%=task.getDescription()%>>"> <button>Update</button> </a>
				<td><a href="removetask?id=<%=task.getId()%>"> <button>Remove</button> </a>
			</tr>
					
				<%}%>
			<% }
			%>


		</table>
		<br>
		<a href="managerdb.jsp"> <button>Back</button> </a>

	

</body>
</html>