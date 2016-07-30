<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ page import="com.TaskWorkFlow.Domain.Task" %>   
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Current Tasks</title>
	</head>

	<script>
		function ConfirmDelete(){
			var r= confirm("Are you sure you want to delete this task?");
			if(r==true)
				return true;
			else
				return false;
		}

	</script>

	<style>
		table{
			margin-left:0%;
			text-align:center;
		}
		.logout button {
			text-align: center;
			margin-top: -10px;
			margin-left: 1200px;
			text-transform: uppercase;
			font-weight: bold;
			outline: 0;
			background: #FFFFFF;
			width: 6%;
			 border:1px;
			  border-style: solid;
			  border-color:#4CAF50;
			padding: 4px;
			color: #4CAF50;
			font-size: 15px;
			-webkit-transition: all 0.3 ease;
			transition: all 0.3 ease;
			cursor: pointer;
		}
.logout button:hover,.form button:active,.form button:focus {
			  background: #4CAF50;
			  color:#FFFFFF;
			  border:1px;
			  border-style: solid;
			  border-color:#FFFFFF;
		}
		
		
		#back{
		text-align:center;
		}
		
		
		body {
		  background: #76b852; 
		  
	}

	.login-page {
		align:center;
		width: 83%;
	
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 83%;
		margin: -90px auto 20px;
		padding: 30px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
		
	
		
 .back{
		margin: 14px 0 0;
		font-size: 20px;
		align:center;
		
	}
	
	 .back a {
		 align:center;
			color: #FFFFFF;
			text-decoration: none;
			font-size: 20px;
			font-weight:bold;
}
	</style>


	<body>

		<h1 style="text-align:center; color:white;" >CURRENT TASKS</h1>
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button></a>
		</div>
		
		<br>
		
		
		    <%	if(session.getAttribute("USER_DETAILS")==null){
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
				requestDispatcher.forward(request,response);
				return;
			}
		    
		    	ArrayList<Task> tasks = (ArrayList<Task>)session.getAttribute("TASKS");
		      	int i;
		      	if(tasks.size()==0){
		      %>
		      		<p style="text-align: center; color: yellow; font-size:20px "><%out.print("You have no current Tasks right now");%></p> 
		     <%  	
		     	}
		      	else{
		       	
		    %>
		  
			
			 <div class="login-page">
			<div class="f">
		    <table width="59%" border="1">
		      	<tr>
		      	 	<td>Task ID</td>
					<td>Task Name</td>
					<td>Task Description</td>
					<td>User ID</td>
					<td>Created Date</td>
					<td>Expected Date</td>
					<td>Status</td>
					<td>Ftp Location</td>
					<td>Quantity</td>
					<td>Target Role</td>
					<td>Priority</td>
					<td>Developer ID</td>
					<td>Tester ID</td>
					<td>Edit Task </td>
					<td>Delete Task </td>
		      	</tr>
		    <%	
		        for(i=0 ; i< tasks.size(); i++)    
		        {
		    %>		<tr>
		                <td><%= tasks.get(i).getTaskID() %></td>
						<td><%=	tasks.get(i).getTaskName()%></td>
						<td><%=	tasks.get(i).getTaskDescription()%></td>
						<td><%= tasks.get(i).getUserID()%></td>
						<td><%=	tasks.get(i).getCreatedDate()%></td>
						<td><%=	tasks.get(i).getExpectedDate()%></td>
						<td><%=	tasks.get(i).getStatus()%></td>
						<td><%=	tasks.get(i).getFtpLocation()%></td>
						<td><%=	tasks.get(i).getQuantity()%></td>
						<td><%=	tasks.get(i).getTargetRole()%></td>
						<td><%= tasks.get(i).getPriority() %></td>
						<td><%= tasks.get(i).getDeveloperId() %></td>
						<td><%= tasks.get(i).getTesterId() %></td>
						<td> <a href = "EditTask?TaskID=<%= tasks.get(i).getTaskID() %>" >Edit</a></td> 
						<td> <a href ="DeleteTask?TaskID=<%= tasks.get(i).getTaskID() %>" onClick="return ConfirmDelete();">Delete</a></td> 
						   				 <!-- Pass string id as parameter of request using jsp -->
					 </tr>
		      <% 
		          }
		      %>                   
		 </table>
		
		<%
		}%>
		</div>
		</div>
		<br><br>
		
		<div class="back" style="text-align:center;">
			<a  href="home.jsp">Back</a>
		</div>
	</body>
</html>