<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.TaskWorkFlow.Domain.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Tester</title>
</head>
<style>
		.logout{
			width:15%;
			margin-left:1200px;
			align:right;
			
		}
		.logout button {
			
			text-align: center;
			margin-top: 0px;
			text-align:center;
			
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 45%;
			border: 1px;
			border-style: solid;
			border-color: #FFFFFF;
			padding: 5px;
			color: #FFFFFF;
			font-size: 13px;
			cursor: pointer;
		}
		.logout button:hover,.form button:active,.form button:focus {
		  	background: #FFFFFF;
			color: #4CAF50;
			border: 1px;
			border-style: solid;
			border-color: #4CAF50;
		}
		
		.btns{
			width:70%;
			margin-left:200px;
		}
		
		.btns button{
			
			align:center;
			text-transform: uppercase;
			outline: 0;
			background: #4CAF50;
			width: 18%;
			border: 1px;
			border-style: solid;
			border-color: #FFFFFF;
			padding: 5px;
			color: #FFFFFF;
			font-size: 15px;
			-webkit-transition: all 0.3 ease;
			transition: all 0.3 ease;
			cursor: pointer;
		}
		.btns button:hover,.form button:active,.form button:focus {
		  	background: #FFFFFF;
			color: #4CAF50;
			border: 1px;
			border-style: solid;
			border-color: #4CAF50;
		}
			
		#fields{
			float:left;
			text-align:left;
			margin-left:90px;
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
			height: 130px;
			margin: 30px auto 20px;
			padding: 45px;
			text-align: center;
			box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
			
		}
	</style>

<body>

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
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
		
		
		
		
		<div class="contents"> 
			<div id="fields">
					<br>Employee Id 
					<br>First Name
					<br>Last Name 
					<br>Role
			</div>
			
			
			<div id="values" style="margin-bottom:80px;">
				<% 
					User user= (User)session.getAttribute("USER_DETAILS");
					out.println("<BR>: " + user.getEmployeeId() ); 
					out.println("<BR>: " + user.getFirstName());
					out.println("<BR>: " + user.getLastName());
					out.println("<BR>: " + user.getRole());
					
				%>
			</div>
	
		</div>
		
		<br><br><br>
		<div class="btns" style="text-align:center;">
			
		
			<a href="TesterCompleteTasks.jsp"> <button >Tested Tasks</button></a>
			&nbsp;&nbsp;
			<a href="TesterInProgress.jsp" ><button>Under Testing</button></a>
			&nbsp;&nbsp;
			<a href="TesterNewTasks.jsp"><button>New Tasks</button></a>
			&nbsp;&nbsp;
			<a href="home.jsp"><button>Back</button></a>
	
		</div>

		<div style="text-align:center">
			
		</div>

</body>
</html>