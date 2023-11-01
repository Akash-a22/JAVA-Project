<%@page import="task.Task"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String id=(String)request.getParameter("id");
String desc=(String)request.getParameter("desc");


%>
<form action="updatetask">
	<input type="hidden" name ="id" value="<%=id%>">

        description : <input type="text" name="description" placeholder="<%=desc%>">
        completed DateTime : <input type="datetime-local" name="completed">

        update Task : <input type="submit" value="submit">
         <a href="updatetask.jsp">back</a>
    </form>

</body>
</html>