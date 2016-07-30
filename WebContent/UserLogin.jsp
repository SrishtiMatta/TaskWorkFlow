<!DOCTYPE html>

	

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
	</head>
	
	
	<style>
	#comment {
		text-align:center;

	}
	
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
		width: 100%;
		border: 1px;
		padding: 15px;
		color: #FFFFFF;
		font-size: 15px;
		-webkit-transition: all 0.3 ease;
		transition: all 0.3 ease;
		cursor: pointer;
		border-style: solid;
		border-color:#FFFFFF;
	}
	.f button:hover,.form button:active,.form button:focus {
		  background:#FFFFFF;
		  color: #4CAF50;
		  border:1px;
		border-style: solid;
		border-color:#4CAF50;
	}
		
	.f .abc{
		margin: 14px 0 0;
		font-size: 14px;
	}
	
	.f .abc a {
  color: #4CAF50;
  text-decoration: none;
  font-size: 15px;
}
	
	</style>
	<script type = "text/javascript" src = "JS/jquery-min.js">
	</script>
	
	 <script>
			$().ready(function() {
			    if(document.referrer != 'http://localhost:8080/'){ 
			        history.pushState(null, null, 'login');
			        window.addEventListener('popstate', function () {
			            history.pushState(null, null, 'login');
			        });
			    }
			});
	</script>
	
	
	
	<script>
	$(document).ready(function() {
	
	
	    $("#LogIn").click(function() {
	        username = $("#userName").val();
	        password = $("#password").val();
	
	        $("#comment").html("");
		//	$("#comment1").html("");
		//	$("#comment2").html("");
	        $("#userName").attr("placeholder", "User Name");
			$("#password").attr("placeholder", "Password.");
						 
	        if(username == "" || username == null) {
		      //   $("#comment1").html("&emsp; Please enter username.");
			  $("#userName").attr("placeholder", "Please enter username");
		         return false;
	        }
			  if(password == "" || password == null) {
			       //  $("#comment2").html("&emsp; Please enter password.");
			        $("#password").attr("placeholder", "Please enter password.");
					return false;
			  }
	       
	        $.ajax({
	            type : "POST",
	            url : "login",
	            data : "username=" + username + "&password=" + password,
	            success : function(data) {
	    
		             if(data.toString().indexOf("Invalid") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
		               $("#password").val('');
						 $("#password").attr("placeholder", "Password.");
		              $("#comment").html(data);
				
		             }
		             else if(data.toString().indexOf("Admin") != -1){
		            	 $(location).attr('href',"Admin.jsp");
		             }
		             else if(data.toString().indexOf("Inactive") != -1){
		            	 $("#password").val('');
		            	 $("#userName").val('');
						 $("#userName").attr("placeholder", "User Name");
						 $("#password").attr("placeholder", "Password.");
			           $("#comment").html(data);
				
		             }
		             else if(data.toString().indexOf("User") != -1){
		              $(location).attr('href',"home.jsp");
	        		}
		             else{
		            	 $("#password").val('');
		            	 $("#userName").val('');
						  $("#userName").attr("placeholder", "User Name");
						 $("#password").attr("placeholder", "Password.");
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
	
	
	<script>
		/* function validate(){
			user=document.getElementById("userName").value;
			pass=document.getElementById("password").value;
			
			if((user==null || user=="")&& (pass==null || pass=="")){
				alert("Please Enter UserName and Password");
				return false;
			}
			
			if(user==null || user==""){
				alert("Please Enter Password");           // alert appears and all the filled fields remain filled because it males check on onSubmit that is if any error form wont be submitted and all data remains as it is
				return false;
				
			}
			if(pass==null || pass==""){
				alert("Please Enter Password");  // gives an error message  
				return false;
			}
		}
	*/
	</script>

	<body>
		<h1 align="center"  style="color:white;">WELCOME TO TASK WORK-FLOW</h1>
		<h1 align="center"  style="color:white;">LOGIN</h1>
		
		<% 	String er = (String)request.getAttribute("SessionExpired");
  			if(er != null && !er.isEmpty()) {
  		%>
  				<p style="text-align: center; color:yellow; font-size:20px;"><%out.print(er);%></p> 
 		
 		<%	}
			String e =(String)request.getAttribute("INACTIVE");
			if(e!=null && !e.isEmpty()){      
		%>
  			 	<p style="text-align: center; color: red;"><%out.print("Your account is inactive right now. To activate your account Please contact admin ");%></p> 
 		<%		
			}    
			String err = (String)request.getAttribute("Registered");
  			if(err != null && !err.isEmpty()) {
  		%>
  				<p style="text-align: center; color: red;"><%out.print(err);%></p> 
 		<%	}
			String mail = (String)request.getAttribute("MailSent");
  			if(mail != null && !mail.isEmpty()) {
		%>
  				<p style="text-align: center; color: red;"><%out.print(mail);%></p> 
  		<%
  			}
  		%>
  		
		
		
		
		<div class="login-page">
			<div class="f">
				<form class="login-form" >		<!--  onSubmit="return validate();" -->    
			
					<!--  if some field is empty then validate function returns false thertfore form wont be submitted  and stays on the same page-->
					<p id="comment" style="color:red; "></p>
					
					<input type="text" name="UserName"  id="userName" placeholder="User Name"> 
					<br>
			<!--		<div id= "comment1"  style="color:red; position:fixed; "></div>  -->
					<br>
					
					<input type="password" name="Password"  id="password" placeholder="Password">
					<br>
			<!--		<div id= "comment2"  style="color:red; position:fixed;"></div>   -->
					<br>
					<button id="LogIn">Login</button>
					<br>
					<p class="abc">
						<a href="ForgotPassword.jsp">Forgot Password</a>
						<br><br>New User?
						<a href="Register.jsp">Sign In</a>
					</p>
		
				</form>
			</div>
		</div>
	</body>

</html>