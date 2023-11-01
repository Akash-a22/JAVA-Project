<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Task</title>
<style >
body{
background-image: url("https://cdn.pixabay.com/photo/2017/01/13/18/47/mountains-1977968_1280.jpg");
background-repeat: no-repeat;
background-size: cover;
}
a{
text-decoration: none;
color: black;

}
.fm{
color: white;
}
button{
margin-left: 5%;
display: inline-block;
  padding: 5px 5px; /* Adjust the padding as needed */
  background-color: white; /* Button background color */
  color: black; /* Button text color */
  text-decoration: none; /* Remove underline */
  border: 1px solid #007bff; /* Button border */
  border-radius: 4px; 
}


span a{
  display: inline-block;
  padding: 1px 1px; /* Adjust the padding as needed */
  background-color: white; /* Button background color */
  color: black; /* Button text color */
  text-decoration: none; /* Remove underline */
  border: 1px solid #007bff; /* Button border */
  border-radius: 4px; /* Rounded corners */
}
</style>
</head>
<body>
 <form action="createtask" class="fm">
 
         <input type="hidden" name="id">
        Description : <input type="text" name="description">
        Create DateTime : <input type="datetime-local" name="created">
<br><br>
         <input type="submit" value="Create">
       <span>  <a href="managerdb.jsp">Back</a></span>
    </form>

</body>
</html>