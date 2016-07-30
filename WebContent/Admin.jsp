<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.TaskWorkFlow.Domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Welcome Admin </title>
	</head>
	
	<body>
	<div class="main">
		<h1 style="text-align:center; color:#4CAF50;">WELCOME 
		<%	if(session.getAttribute("USER_DETAILS")==null){
	
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
				requestDispatcher.forward(request,response);
				return;
			}
			User user1= (User)session.getAttribute("USER_DETAILS");
			out.println( user1.getFirstName());
		%> 
	
		</h1>
	
		<div class="logout">
			<a href ="LogOut"><button>LogOut</button> </a>
		</div>
		<br><br>
		<div class="contents"> 
				<div id="fields">
					<br>Employee Id 
					<br>First Name
					<br>Last Name 
					<br>User Name 
					<br>Contact No 
					<br>Email ID 
					<br>Department 
					<br>Post 
					<br>Role 
				</div>
			
			
				<div id="values" style="margin-bottom:80px;">
					<% 
						User user= (User)session.getAttribute("USER_DETAILS");
						out.println("<BR>: " + user.getEmployeeId() ); 
						out.println("<BR>: " + user.getFirstName());
						out.println("<BR>: " + user.getLastName());
						out.println("<BR>: " + user.getUserName());
						out.println("<BR>: " + user.getContactNo());
						out.println("<BR>: " + user.getEmailId());
						out.println("<BR>: " + user.getDepartment());
						out.println("<BR>: " + user.getPost());
						out.println("<BR>: " + user.getRole());
					%>
				 </div>
	
		</div>
		<br><br><br><br>
	
		<div class="btns">
			<a href ="EditProfile.jsp"><button>Edit Profile</button></a>
				&nbsp; &nbsp;
			<a href="UserList.jsp"> <button >USERS</button></a>
			&nbsp; &nbsp;
			<a href="TaskList.jsp" ><button>TASKS</button></a>
			&nbsp; &nbsp;
			<a href="EditPassword.jsp" ><button>EDIT PASSWORD</button></a>
		</div>
	</div>
	</body>
	
	<style>
	
		.main{
			position:fixed;
		}
		.logout button {
			
			text-align: center;
			margin-top: 0px;
			margin-left: 1200px;
			
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 6%;
			 border:1px;
			  border-style: solid;
			  border-color:#FFFFFF;
			padding: 5px;
			color: #FFFFFF;
			font-size: 13px;
			cursor: pointer;
		}
		.logout button:hover,.form button:active,.form button:focus {
			  background: #FFFFFF;
			  color:#4CAF50;
			  border:1px;
			  border-style: solid;
			  border-color:#4CAF50;
		}
		
		.btns{
			
			margin-left:300px;
		}
		
		.btns button{
			
			align:center;
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 16%;
			border: 0;
			padding: 5px;
			color: #FFFFFF;
			font-size: 15px;
			-webkit-transition: all 0.3 ease;
			transition: all 0.3 ease;
			cursor: pointer;
		}
		.btns button:hover,.form button:active,.form button:focus {
		   background: #FFFFFF;
			  color:#4CAF50;
			  border:1px;
			  border-style: solid;
			  border-color:#4CAF50;
		}
			
		#fields{
			float:left;
			text-align:left;
			margin-left:80px;
		}
		
		#values{
			text-align:left;
			float:left;
			width:50%;
		}
		.contents {
			background: #76b852; 
			max-width:30%;
			font-size:17px;
			color:#FFFFFF;
			align:center;
			position: relative;
			z-index: 1;
			height: 230px;
			margin: -20px auto 20px;
			padding: 45px;
			text-align: center;
			box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			
		}
	</style>

</html>