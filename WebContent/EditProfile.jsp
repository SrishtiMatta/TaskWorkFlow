<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.TaskWorkFlow.Domain.User"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
</head>

<script type="text/javascript" src="JS/jquery-min.js"> </script>

<style>
p {
	display: inline-block;
	font-size: 15px;
	margin: 4px 8px 2px;
}

.logout button {
	text-align: center;
	margin-top: 0px;
	margin-left: 1200px;
	text-transform: uppercase;
	font-weight: bold;
	outline: 0;
	background: #FFFFFF;
	width: 6%;
	border: 1px;
	border-style: solid;
	border-color: #4CAF50;
	padding: 4px;
	color: #4CAF50;
	font-size: 15px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.logout button:hover, .form button:active, .form button:focus {
	background: #4CAF50;
	color: #FFFFFF;
	border: 1px;
	border-style: solid;
	border-color: #FFFFFF;
}

body {
	background: #76b852;
}

.login-page {
	align: center;
	width: 750px;
	padding: 8% 0 0;
	margin: auto;
}

.f {
	align: center;
	position: relative;
	z-index: 1;
	background: #FFFFFF;
	max-width: 750px;
	margin: -90px auto 50px;
	padding: 40px;
	text-align: center;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.f input {
	outline: 0;
	background: #e5e5e5;
	width: 35%;
	border: 0;
	margin: 0 0 15px;
	padding: 5px;
	box-sizing: border-box;
	font-size: 14px;
}

.f button {
	text-transform: uppercase;
	outline: 0;
	background: #4CAF50;
	width: 30%;
	border: 1px;
	border-style: solid;
	border-color: #FFFFFF;
	padding: 8px;
	color: #FFFFFF;
	font-size: 14px;
	-webkit-transition: all 0.3 ease;
	transition: all 0.3 ease;
	cursor: pointer;
}

.f button:hover, .form button:active, .form button:focus {
	background: #FFFFFF;
	color: #4CAF50;
	border: 1px;
	border-style: solid;
	border-color: #4CAF50;
}

.f .abc {
	margin: 14px 0 0;
	font-size: 14px;
}
</style>

<script>
	function validate(){
		contactNo=document.getElementById("ContactNo").value;
		
		if(contactNo.length!=10){
			$("#comment").html("Please enter a valid contact number");
			return false;
		}
		
	}
	</script>


<body>
	<h1 style="text-align: center; color: white;">EDIT PROFILE</h1>

	<% 
			if(session.getAttribute("USER_DETAILS")==null){
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
				requestDispatcher.forward(request,response);
				return;
			}

			User user= (User)session.getAttribute("USER_DETAILS");
		%>


	<div class="logout">
		<a href="LogOut">
			<button id="btnLogout">Logout</button>
		</a>
	</div>
	<div class="login-page">
		<div class="f">
			<form class="login-form" onSubmit="return validate();"
				action="UpdateProfile" method="post">
				<br>
				<br>Employee id: <br> <input type="text" name="EmployeeId"
					id="EmployeeId" value="<%= user.getEmployeeId() %>" disabled>

				<br>
				<br>First Name:<br> <input type="text" name="FirstName"
					id="FirstName" value="<%= user.getFirstName() %>"> <br>
				<br>Last Name:<br> <input type="text" name="LastName"
					id="LastName" value="<%= user.getLastName() %>"> <br>
				<br>Contact No:<br> <input type="text" name="ContactNo"
					id="ContactNo" value="<%= user.getContactNo() %>">
				<p id="comment" style="color: red; position: absolute;"></p>

				<br>
				<br>Email id: <br> <input type="email" name="EmailId"
					id="EmailId" value="<%= user.getEmailId() %>"> <br>
				<br>Department: <br> <input type="text" name="Department"
					id="Department" value="<%= user.getDepartment() %>"> <br>
				<br>Post:<br> <input type="text" name="Post" id="Post"
					value="<%= user.getPost() %>"> <br>
				<br>Enter User Name :<br> <input type="text"
					name="UserName" id="UserName" value="<%= user.getUserName() %>"
					disabled> <br>
				<br> Role:<br> <select name="Role" id="Role">
					<option value="Select">Select from here</option>
					<option value="User">User</option>
					<option value="AndroidDeveloper">Android Developer</option>
					<option value="ImageDeveloper">Image Developer</option>
					<option value="WebDesigner">Web Designer</option>
					<option value="IOSDeveloper">IOS Developer</option>
					<option value="Tester">Tester</option>
				</select> <br>
				<br>
				<button id="submit">Submit</button>

				<br>

			</form>

			<% if(user.getUserName().equals("admin")){
		%>

			<div class="abc">
				<div style="text-align: center;">
					<a href="Admin.jsp"><button>Back</button></a>
				</div>
				<%
		}
		else{
		%>
				<br>
				<div style="text-align: center;">
					<a href="Profile.jsp"><button>Back</button></a>
				</div>
				<%
		}
		%>
			</div>
		</div>
	</div>
</body>
</html>