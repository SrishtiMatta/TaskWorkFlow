<%@ page import="java.util.List"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.mysql.jdbc.PreparedStatement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.TaskWorkFlow.Domain.User" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Users</title>
	</head>

	<script>
		function ConfirmStatus(){
			var r =confirm("Are you sure you want to edit User Status");
			if(r==true){
				return true;
			}
			else{
				return false;
			}
		}

		function ConfirmDeletion(){
			var r =confirm("Are you sure you want to delete the user and his tasks");
			if(r==true){
				return true;
			}
			else{
				return false;
			}
		}
	</script>

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
		
		table{
			margin-left:1.5%;
			text-align:center;
		}
		
		#back{
		text-align:center;
		}
		
		
		body {
		  background: #76b852; 
		  
	}

	.login-page {
		align:center;
		width: 95%;
	
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 95%;
		margin: -90px auto 20px;
		padding: 45px;
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
		<% 	if(session.getAttribute("USER_DETAILS")==null){
				request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
				RequestDispatcher requestDispatcher;
				requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
				requestDispatcher.forward(request,response);
				return;
			}	
		%>
		<h1 style="text-align: center; color:white;">USERS</h1>
			
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
		
<br>
		
		<%		User d = (User) session.getAttribute("USER_DETAILS");
				String UName = d.getUserName();
				
				Connection connection = null;
		        Class.forName("com.mysql.jdbc.Driver");
		        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
		
		        Statement statement = connection.createStatement();
		
		        PreparedStatement ps=(PreparedStatement) connection.prepareStatement("select EmployeeId , FirstName , LastName, ContactNo, EmailId , Department , Post ,Role , Active , UserName from user where UserName<> ?");
		        ps.setString(1, UName);
		        
		        ResultSet resultset =ps.executeQuery();
		 %>
		 
		 <div class="login-page">
			<div class="f">
				 <TABLE BORDER="1">
					<TR>
						<TH>EMPLOYEE ID</TH>
						<TH>FIRST NAME</TH>
						<TH>LAST NAME</TH>
						<TH>CONTACT NO</TH>
						<TH>EMAIL ID</TH>
						<TH>DEPARTMENT</TH>
						<TH>POST</TH>
						<TH>ROLE</TH>
						<TH>STATUS</TH>
						<TH>USER NAME</TH>
						<TH>DELETE USER</TH>
					  </TR>
					  <%        
							while(resultset.next()){ 
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
								<TD><a href= "EditStatus?UserId=<%= resultset.getString(1) %>" onclick="return ConfirmStatus();"><%= resultset.getString(9) %> </a></TD>
								<TD> <%= resultset.getString(10) %> </TD>
								<TD><a href= "DeleteUser?UserId=<%= resultset.getString(1) %>" onClick="return ConfirmDeletion(); ">DeleteUser</a></TD>
						   
							</TR>
					  <% 
						} 
					  %>
				   </TABLE>
		</div>
		</div>
			<div class="back" style="text-align:center;">
				<a href="Admin.jsp">Back</a>
			</div> 
				
	</body>
</html>