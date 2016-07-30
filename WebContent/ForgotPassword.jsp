<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Forgot Password</title>
	</head>
<script type = "text/javascript" src = "JS/jquery-min.js">
	</script>
	
	
		<style>
		
		body {
		  background: #76b852; 
		  
	}

	.login-page {
		align:center;
		width: 360px;
		padding: 8% 0 0;
		margin: auto;
	}
	
	.f {
		align:center;
		position: relative;
		z-index: 1;
		background: #FFFFFF;
		max-width: 360px;
		margin: -60px auto 50px;
		padding: 45px;
		text-align: center;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	}
		
	.f input {
		outline: 0;
		background: #e5e5e5;
		width: 100%;
		border: 0;
		margin: 0 0 15px;
		padding: 15px;
		box-sizing: border-box;
		font-size: 14px;
	}
	.f button {
		text-transform: uppercase;
		outline: 0;
		background: #4CAF50;
		width: 50%;
			border: 1px;
			border-style: solid;
			border-color:  #FFFFFF;
		padding: 10px;
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
		

	
	 .abc a {
  color: #ffffff;
  text-decoration: none;
  font-size: 20px;]
  
}
		#comment {
		text-align:center;
	}
	
	</style>
	
	<script>
	$(document).ready(function() {
	
	
	    $("#submit").click(function() {
	        username = $("#UName").val();
	
	        $("#comment").html("");
	        $("#UName").attr("placeholder", "User Name");
			
						 
	        if(username == "" || username == null) {
		      //   $("#comment1").html("&emsp; Please enter username.");
			  $("#UName").attr("placeholder", "Please enter username");
		         return false;
	        }
	
	        $.ajax({
	            type : "POST",
	            url : "ForgotPassword",
	            data : "username=" + username,
	            success : function(data) {
	    
		             if(data.toString().indexOf("Incorrect") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
		               $("#UName").val('');
						 $("#UName").attr("placeholder", "Please enter a valid User Name.");
		             
		             }
		             else if(data.toString().indexOf("Success") != -1){
		            	alert("An email has been sent to you.");
		            	 $(location).attr('href',"UserLogin.jsp");
		             }
		        
		             else{
		            	 $("#UName").val('');
						 $("#UName").attr("placeholder", "User Name");
						$("#comment").html(data);
				
		             }
	          },
		   error: function(data) {
		     	$("#comment").html("Something went wrong!");
		   }
	        });
	  return false;
	    });    
	    
	});     

	</script>
		
	<body>

		<h1 style="text-align:center; color:white;">FORGOT PASSWORD</h1>
		<br>
		<div class="login-page">
			<div class="f">
				
		<form  class="login-form">
			<p id="comment" style="color:red; "></p>
			<input type="text" id= "UName" name="UName" placeholder="User Name">

			<br><br>
			<button id="submit" >Submit</button>
	
		</form>
		
	</div>
		<div class="abc" style="text-align:center;">
			<a href ="UserLogin.jsp">Back</a> &nbsp;&nbsp;&nbsp;
			<a href="ForgotPassword.jsp">Reset</a>
		</div>
	</div>
		
	</body>
</html>