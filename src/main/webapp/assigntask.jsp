<%@page import="task.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task</title>
</head>
<body>	
<%!User user=null; %>
<% List<User> list=(List<User>)request.getAttribute("list");


%>

<table>
        <tr>
            <th>id </th>
            <th>name</th>
            <th>email</th>
            <th>status</th>
            <th>assign</th>
        </tr>
        <% for(int i=0;i<list.size();i++){
        	user=list.get(i);
        	
        }
        %>
        <tr>
            <td><%=user.getId() %></td>
            <td><%=user.getName() %></td>
            <td><%=user.getEmail() %></td>
            <td><%=user.getStatus() %></td>
            <td><a href="task.jsp?id=user.getId()">assign</a> </td>


        </tr>


    </table>



</body>
</html>