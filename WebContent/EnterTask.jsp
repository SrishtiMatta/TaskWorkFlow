<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ENTER TASK</title>
	</head>


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
	
	<script type = "text/javascript" src = "JS/jquery-min.js">
	</script>

	<script>
/*		function validate(){
			TaskName=document.getElementById("TaskName").value;
			TaskDesc=document.getElementById("TaskDescription").value;
			EDate=document.getElementById("ExpectedDate").value;
			Ftp=document.getElementById("FTPLocation").value;
			quantity=document.getElementById("Quantity").value;
			TRole=document.getElementById("TargetRole").value;
			Priority=document.getElementById("Priority").value;
		
			if(TaskName==null || TaskName==""){
				alert("Please enter Task Name");
				return false;
			}
			
			if(TaskDesc==null || TaskDesc==""){
				alert("Please enter Task Description");
				return false;
			}
			if(EDate==null || EDate==""){
				alert("Please enter Expected Date");
				return false;
			}
		
			if(quantity==null || quantity==""){       // quantity input of type string in form and of type int in sql table therfore checking null
				alert("Please enter your department");
				return false;                               // may or may not be null
			} 
			if(TRole=="Select"){
				alert("Please enter the Target Role i.e which domain's employee could complete your task");
				return false;
			}
			
			if(Priority=="Select"){
				alert("Please enter the Priority of your task");
				return false;
			}
		}
*/
	</script>

<script>
	function clearr(){
		$("#comment").html("");
		$("#comment1").html("");
		$("#comment2").html("");
		$("#comment3").html("");
		$("#comment4").html("");
		$("#comment5").html("");
		$("#comment6").html("");
		$("#comment7").html("");
		document.getElementById("myForm").reset();
		
		
	}


</script>

<script>
	$(document).ready(function() {

		$("#submit").click(function() {
	        TaskName = $("#TaskName").val();
	        TaskDesc = $("#TaskDescription").val();
	        EDate = $("#ExpectedDate").val();
	        Ftp = $("#FTPLocation").val();
	        Quantity = $("#Quantity").val();
	        Priority = $("#Priority").val();
	        TargetRole = $("#TargetRole").val();
	        
	    
	        $("#comment").html("");
			$("#comment1").html("");
			$("#comment2").html("");
			$("#comment3").html("");
			$("#comment4").html("");
			$("#comment5").html("");
			$("#comment6").html("");
			$("#comment7").html("");
	        
			
			var today = new Date();
			  var dd = today.getDate();
			  var mm = today.getMonth()+1; //January is 0!
			  var yyyy = today.getFullYear();

			  if(dd<10) {
			      dd='0'+dd      // appending 0 if date is single digit
			  } 

			  if(mm<10) {
			      mm='0'+mm
			  } 

			  today = yyyy+'-'+mm+'-'+dd;
		
			  
			
			
	        if(TaskName == "" || TaskName == null) {
		         $("#comment1").html("&emsp; Please enter Task Name.");
		         return false;
	        }
			 
	        if(TaskDesc == "" || TaskDesc == null) {
			         $("#comment2").html("&emsp; Please enter Task Description.");
			         return false;
			 }
	        
	        if(EDate == "" || EDate == null) {
		         $("#comment3").html("&emsp; Please enter Expected Date.");
		         return false;
			}
	       
	        if(EDate < today) {
				   $("#comment3").html("please enter expected date after today's date");
				   return false;
		 }
	        
	        if(Ftp == "" || Ftp == null) {
	        	Ftp="NA";
		 	}
	        
	        if(Quantity == "" || Quantity == null) {
		     	Quantity=1;
		 	}
	        if(Quantity<=0){
	        	$("#comment5").html("&emsp; Please enter valid Quantity.");
		         return false;
	        }
	        if(Priority == "Select") {
		         $("#comment6").html("&emsp; Please enter Priority.");
		         return false;
		 	}
	        
	        if(TargetRole == "Select") {
		         $("#comment7").html("&emsp; Please enter Target Role.");
		         return false;
		 	}
	        $.ajax({
	            type : "POST",
	            url : "task",
	            data : "TaskName=" + TaskName + "&TaskDesc=" + TaskDesc  + "&EDate=" + EDate
	            + "&Ftp=" + Ftp  + "&Quantity=" + Quantity + "&Priority=" + Priority 
	            + "&TargetRole=" + TargetRole,
	            
	            success : function(data) {
	    
		             if(data.toString().indexOf("Quantity") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
		               $("#Quantity").val('');
		              $("#comment5").html(data);
		             }
		         
		             else if(data.toString().indexOf("successfully") != -1){
		              alert("Task registered successfully");
		              $(location).attr('href',"home.jsp");
	        		}
		             else if(data.toString().indexOf("date") != -1){
		            	 $("#comment3").html(data);
		             }
		             else{
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
		<%
		if(session.getAttribute("USER_DETAILS")==null){
			request.setAttribute("SessionExpired", "Your session has expired. Please log in again.");
			RequestDispatcher requestDispatcher;
			requestDispatcher = request.getRequestDispatcher("/UserLogin.jsp");
			requestDispatcher.forward(request,response);
			return;
		}
		
		
		%>
		
		
		
		<h2 style="text-align:center; color:white;">ENTER TASK!!</h2>
		<div class="logout">
			<a href ="LogOut"> <button id="btnLogout">Logout</button> </a>
		</div>
		
		
			<div class="login-page">
	
				<div class="f">
					<form class="login-form" id="myForm">	
					
					<p id="comment" style="text-align:center ; color:red"></p>
					<br>Task Name:<br>
					<input type = "text" name ="TaskName" id="TaskName" >
					<p id= "comment1" style="color:red; position:absolute;"></p>
					
					<br><br>Task Description:<br>
					<input type="text" name="TaskDescription" id="TaskDescription">
					<p id= "comment2" style="color:red; position:absolute;"></p>
					
					<br><br>ExpectedDate:<br>
					<input type="date" name= "ExpectedDate" id="ExpectedDate"> 
					<p id= "comment3" style="color:red; position:absolute;"></p>
					
					<br><br>FTP Location: <br>
					<input type="text" name="FTPLocation" id="FTPLocation">
					<p id= "comment4" style="color:red; position:absolute;"></p>
					
					<br><br>Quantity: <br>
					<input type="number" name="Quantity" id="Quantity">
					<p id= "comment5" style="color:red; position:absolute;"></p>
					
					<br><br>
					Priority:<br>
					<select name = "Priority" id="Priority">
						<option value="Select" >Select from here</option>
						<option value="High">High</option>
						<option value="Medium">Medium</option>
						<option value="Low">Low</option>
					</select>
					<p id= "comment6" style="color:red; position:absolute;"></p>
					
					<br><br>
					Target Role:<br>
					<select name = "TargetRole" id="TargetRole">
						<option value="Select" >Select from here</option>
						<option value="AndroidDeveloper">Android Developer</option>
						<option value="ImageDeveloper">Image Developer</option>
						 <option value="WebDesigner">Web Designer</option>
						<option value="IOSDeveloper">IOS Developer</option>
					</select>
					<p id= "comment7" style="color:red; position:absolute;"></p>
					
					<br>
			
			
				<br>
				<button id="submit">Submit</button>
				<br><br>
				
				
			
			</form>
			
			<button id="set" onclick="clearr();">Reset</button> &nbsp;&nbsp;
			<a href="home.jsp"><button>Back</button></a>
		</div>
		</div>

	</body>
</html>