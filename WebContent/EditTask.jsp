<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.TaskWorkFlow.Domain.Task" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit task</title>
	</head>
<script type = "text/javascript" src = "JS/jquery-min.js"> </script>
	<style>
		.logout button {
			text-align: center;
			margin-top: -10px;
			margin-left: 1200px;
			text-transform: uppercase;
			font-weight: bold;
			outline: 0;
			background: #FFFFFF;
			width: 6%;
			border: 1px;
			border-style: solid;
			border-color:#4CAF50;
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
		
	
		p{
		display:inline-block;
		font-size:15px;
		margin: 4px 8px 2px;
	}
	body {
		background: #76b852; 
	}

	.login-page{
		align:center;
		width: 750px;
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 750px;
		margin: -80px auto 30px;
		padding: 40px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		
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
		width: 20%;
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
	.f button:hover,.form button:active,.form button:focus {
		 background: #FFFFFF;
		color: #4CAF50;
		border: 1px;
		border-style: solid;
		border-color: #4CAF50;
	}
	</style>
	
	
	<script>
		function validate(){
		//	TaskName=document.getElementById("TaskName").value;
			TaskDesc=document.getElementById("TaskDescription").value;
			EDate=document.getElementById("ExpectedDate").value;
			Ftp=document.getElementById("FTPLocation").value;
			quantity=document.getElementById("Quantity").value;
		//	TRole=document.getElementById("TargetRole").value;
			Priority=document.getElementById("Priority").value;
		
			
			
			if(TaskDesc==null || TaskDesc==""){
				$("#comment2").html("&emsp; Please enter Task Description.");
				return false;
			}
			if(EDate==null || EDate==""){
				 $("#comment3").html("&emsp; Please enter Expected Date.");
				return false;
			}
		
			
		}

	</script>

	<body>
		<h1 style="text-align:center; color:white;">EDIT TASK </h1>
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
		<% 		Task task =  (Task)session.getAttribute("EDIT");
				if(task==null){
					request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
					RequestDispatcher requestDispatcher;
					requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
					requestDispatcher.forward(request,response);
				}
		
		%>
		
		<div class="login-page">
	
				<div class="f">
				<form   class="login-form"  onSubmit="return validate();" action="UpdateTask" method="post" >
					<br>
						<br>Task Name:<br>
						<input type = "text" name ="TaskName" id="TaskName" value ="<%= task.getTaskName() %>" disabled >
								
						<br><br>Task Description:<br>
						<input type="text" name="TaskDescription" id="TaskDescription" value="<%=task.getTaskDescription()%>">
						<p id= "comment2" style="color:red; position:absolute;"></p>
							
						<br><br>ExpectedDate:<br>
						<input type="date" name= "ExpectedDate" id="ExpectedDate" value="<%= task.getExpectedDate()%>"> 
						<p id= "comment3" style="color:red; position:absolute;"></p>
							
						<br><br>FTP Location: <br>
						<input type="text" name="FTPLocation" id="FTPLocation" value="<%= task.getFtpLocation()%>">
							
						 <br><br>Quantity: <br>
						<input type="text" name="Quantity" id="Quantity" value="<%= task.getQuantity() %>">
							
						<br><br>Developer Id: <br>
						<input type="text" name="DeveloperId" id="DeveloperId" value="<%= task.getDeveloperId() %>" disabled>	
						
			
						
						<br><br>
						Priority:<br>
						<select name = "Priority" id="Priority">
							<option value="Select" >Select from here</option>
							<option value="High">High</option>
							<option value="Medium">Medium</option>
							<option value="Low">Low</option>
						</select>
						
						<br><br>
						Target Role:<br>
						<input type="text" name="TargetRole" id="TargetRole" value="<%= task.getTargetRole()%>" disabled>
						
						<input type="hidden" name="TId"  value = "<%=task.getTaskID()%>">      <!--  for passing parameters -->
					
					<br><br>
					<button id="submit">Submit</button>
				
				</form>
			<br>
				<a href="home.jsp"><button>Back</button></a>
			
			</div>
			</div>
				
	</body>
</html>