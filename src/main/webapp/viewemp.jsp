<%@page import="javax.persistence.*"%>
<%@page import="java.util.List"%>
<%@page import="task.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
</head>
<body>
	<h3>Employee List</h3>
	<form action="viewemp">
		<%
		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("akash");
		EntityManager entityManager = entityManagerFactory.createEntityManager();
		EntityTransaction entityTransaction = entityManager.getTransaction();
		Query query = entityManager.createQuery("select t from User t");

		List<User> list = query.getResultList();
		%>
		<table cellspacing="0px" cellpadding="10px" border="2px">
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Email</th>
				<th>Status</th>
				<th>Update</th>
				<th>Remove</th>
				
			</tr>
			<%
			for (int i = 0; i < list.size(); i++) {
				User user = list.get(i);
			%>
			<tr>
				<td><%=user.getId()%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getStatus()%></td>
				<td> <a href="updateemp.jsp?id=<%=user.getId()%>">Update</a> </td>
				<td> <a href="removeemp?id=<%=user.getId()%>">Remove</a> </td>
				


			</tr>
			<%
			}
			%>


		</table>
		<a href="managerdb.jsp"> back</a>

	</form>
</body>
</html>