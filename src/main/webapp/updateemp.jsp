<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
<style>
/* Import Google font - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px;
	background: rgb(130, 106, 251);
}

.container {
	position: relative;
	max-width: 700px;
	width: 100%;
	background: #fff;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.container header {
	font-size: 1.5rem;
	color: #333;
	font-weight: 500;
	text-align: center;
}

.container .form {
	margin-top: 30px;
}

.form .input-box {
	width: 100%;
	margin-top: 20px;
}

.input-box label {
	color: #333;
}

.form :where(.input-box input, .select-box) {
	position: relative;
	height: 50px;
	width: 100%;
	outline: none;
	font-size: 1rem;
	color: #707070;
	margin-top: 8px;
	border: 1px solid #ddd;
	border-radius: 6px;
	padding: 0 15px;
}

.input-box input:focus {
	box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}

.form .column {
	column-gap: 15px;
}

.form .gender-box {
	margin-top: 20px;
}

.gender-box h3 {
	color: #333;
	font-size: 1rem;
	font-weight: 400;
	margin-bottom: 8px;
}

.form :where(.gender-option, .gender) {
	display: flex;
	align-items: center;
	column-gap: 50px;
	flex-wrap: wrap;
}

.form .gender {
	column-gap: 5px;
}

.gender input {
	accent-color: rgb(130, 106, 251);
}

.form :where(.gender input, .gender label) {
	cursor: pointer;
}

.gender label {
	color: #707070;
}

.address :where(input, .select-box) {
	margin-top: 15px;
}

.select-box select {
	height: 100%;
	width: 100%;
	outline: none;
	border: none;
	color: #707070;
	font-size: 1rem;
}

.form button {
	margin-left: 45px;
	height: 55px;
	width: 40%;
	color: #fff;
	font-size: 1rem;
	font-weight: 400;
	margin-top: 30px;
	border: none;
	cursor: pointer;
	transition: all 0.2s ease;
	background: rgb(130, 106, 251);
}

.form button:hover {
	background: rgb(88, 56, 250);
}

a {
padding:16px 130px;
text-decoration:none;
	margin-left: 20px;
	height: 55px;
	width: 40%;
	color: #fff;
	font-size: 1rem;
	font-weight: 400;
	margin-top: 30px;
	border: none;
	cursor: pointer;
	transition: all 0.2s ease;
	background: rgb(130, 106, 251);
}
/*Responsive*/
@media screen and (max-width: 500px) {
	.form .column {
		flex-wrap: wrap;
	}
	.form :where(.gender-option, .gender) {
		row-gap: 15px;
	}
}
</style>
</head>
<body>
<%String id=request.getParameter("id"); %>
	<section class="container">
		<header>Update Employee</header>
		<form action="updateemp" class="form">
			<div class="input-box">
			<input name="id" type="hidden" value="<%=id%>">
				<label>Full Name</label> <input name="name" type="text"
					placeholder="Enter full name" />
			</div>

			<div class="input-box">
				<label>Email Address</label> <input name="email" type="text"
					placeholder="Enter email address" />
			</div>

			<div class="column">
				<div class="input-box">
					<label>Phone Number</label> <input name="phone" type="tel"
						placeholder="Enter phone number" />
				</div>
				<div class="input-box">
					<label>Password</label> <input name="password" type="password"
						placeholder="Enter Password" />
				</div>
			</div>
			<div class="input-box">
				<label>Status </label> <input name="status" type="text"
					placeholder="Enter status" />
			</div>
			<div class="input-box">
				<label>Role</label> <input name="role" type="text"
					placeholder="Enter role" />
			</div>
			<button>Update</button>
			<a href="managerdb.jsp">Back</a>
		</form>
	</section>
</body>
</html>