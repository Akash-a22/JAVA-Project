<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee dashboard</title>
<style type="text/css">
.divbox {
	height: 300px;
	width: 350px;
	min-height: 100vh;
	align-items: center;
	justify-content: center;
	padding-left: 500px;
	padding-top: 30px;
}

span {
	background-color: ;
	height: 25%;
	width: 25px;
	font-size: 50px;
	color: black;
	margin-left: 150px;
	margin-right: 50px;
	padding-left: 260px;
	padding-right: 250px;
	align-items: center;
	justify-content: center;
	align-items: center;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2019/11/07/12/18/slate-4608726_1280.jpg");
	background-repeat: no-repeat;
	background-size: cover;
}

#tab {
	color: black;
}

button {
	height: 20px;
	width: 100px;
	background-color: black;
	color: white;
}

tr {
	width: 50px;
	background-color: white;
	color: black;
}
</style>


</head>
<body>
	<%!String msg = "";%>>
	<%
	String task = request.getParameter("notask");
	if (task != null) {
		if (task.equals("true")) {
			msg += "No task Found";
		}
		else {
			msg += "";
		}
	} 
	%>
	<span><%=msg%></span>
	<div class="abc">
		<div class="divbox">

			<table id="tab" cellspacin="0px" cellpadding="15px" border="2px">
				<tr>
					<th>Name</th>
					<th>Click</th>
				</tr>
				<tr>
					<td>User Details</td>
					<td><a href="userdetails"><button>User Details</button> </a><br></td>
				</tr>
				<tr>
					<td>Task Assign</td>
					<td><a href="usertask"><button>User Task</button> </a> <br></td>
				</tr>
			</table>
			<br> <a href="login.jsp"><button>Back</button></a>
		</div>
	</div>
</body>
</html>