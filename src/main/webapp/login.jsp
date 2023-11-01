<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image:
		url("https://cdn.pixabay.com/photo/2018/05/17/15/10/social-3408791_1280.jpg");
}

.login-container {
	margin-left: 520px;
	margin-top: 99px;
	width: 300px;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

.form-group {
	margin: 15px 0;
}

.form-group label {
	display: block;
	font-weight: bold;
}

.form-group input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
span{
 	margin-left: 550px;
 	padding-top:100px;
 	height: 30px;
 	width:30px;
 	font-size: 30px; 
 	color: green;

}
.form-group button {
	background-color: #007BFF;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 10px 15px;
	cursor: pointer;
}

.form-group button:hover {
	background-color: #0056b3;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<%!String msg = null;%>
	<%
	String check = (String) request.getAttribute("loginfail");
	if (check != null) {
		if (check.equals("wrongcredentials")) {
			msg = "Invalid Credentials !";
		}
	} else {
		msg = "";
	}
	%>
	<span> <%=msg%>
	</span>

	<div class="login-container">
		<h2>Login</h2>
		<form action="login" method="post">
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="text"
					id="password" name="password" required>
			</div>
			<div class="form-group">
				<button type="submit">Login</button>
			</div>
		</form>
	</div>

</body>
</html>