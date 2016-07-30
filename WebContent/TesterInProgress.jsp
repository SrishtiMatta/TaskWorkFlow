<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import="java.util.List"%>

<%@ page import="com.TaskWorkFlow.Domain.User" %>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OnGoing Tasks</title>
</head>

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
		width: 88%;
	
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 88%;
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
	
	<script>
		function ConfirmRemove(){
			var r = confirm("Are you sure you dont want to take up this task anymore. ");
			if(r==true){
				return true; 
			}
			else
				return false;
			
		}
		
		function ConfirmComplete(){
			var a = confirm("Are you sure you are done with this task");
			if(a==true){
				return true; 
			}
			else
				return false;
			
		}
</script>


<body>

	<% 	if(session.getAttribute("USER_DETAILS")==null){
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
				requestDispatcher.forward(request,response);
				return;
			}

		User user = (User) session.getAttribute("USER_DETAILS");
		%>
		<h1 style="text-align: center; color:white;">TASKS</h1>
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
	
	
		<%	Connection connection = null;
	        Class.forName("com.mysql.jdbc.Driver");
	        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
	
	        Statement statement = connection.createStatement();
	
	        PreparedStatement ps=(PreparedStatement) connection.prepareStatement("select * from tasks where TesterId= ? && Status=?");
			ps.setString(1, user.getEmployeeId());
	  		ps.setString(2, "Under Testing");
	        ResultSet resultset =ps.executeQuery();
	        if(!resultset.next()){
    	%>
      		 <p style="text-align: center; color: yellow; font-size:20px "><%out.print("You have no tasks in progress right now");%></p> 
      	<%
	        } else{
      	%>
      	<br><br>
		
		<div class="login-page">
			<div class="f">
       <TABLE BORDER="1">
            <TR>
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
				<td>Remove task</td>
				<td>Completed</td>
			
            </TR>
        	<%   do{ 
    		%>
           		<TR>
	                <TD> <%= resultset.getString(1) %> </TD>
	                <TD> <%= resultset.getString(2) %> </TD>
	                <TD> <%= resultset.getString(3) %> </TD>
	                <TD> <%= resultset.getString(4) %> </TD>
	                <TD> <%= resultset.getString(5) %> </TD>
	                <TD> <%= resultset.getString(6) %> </TD>
	                <TD> <%= resultset.getString(7) %> </TD>
	                <TD> <%= resultset.getString(8) %> </TD>
	                <TD> <%= resultset.getString(9) %> </TD>
	                <TD> <%= resultset.getString(10) %> </TD>
	                <TD> <%= resultset.getString(12) %></TD>
	                <TD> <%= resultset.getString(11) %></TD>
	                <TD> <%= resultset.getString(13) %></TD>
	                <TD> <a href="DiscontinueTesting?TaskID=<%=resultset.getString(1) %>&TaskName=<%= resultset.getString(2)%>&UserId=<%= resultset.getString(4)%>"  onClick ="return ConfirmRemove();">Discontinue</a></TD>
	                <TD> <a href="FinishedTesting?TaskID=<%=resultset.getString(1) %>&TaskName=<%= resultset.getString(2)%>&UserId=<%= resultset.getString(4)%>"  onClick ="return ConfirmComplete();">Completed</a></TD>
	            </TR>
			<% 
        		} while(resultset.next());
	        }
   			 %>
    	</TABLE>
	</div>
	</div>
 		<br><br><br>
 
 		<div class="back" style="text-align:center;">
  			<a href="ForTester.jsp">Back</a>    
     	</div> 
	

</body>
</html>