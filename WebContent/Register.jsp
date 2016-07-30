<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>SIGN UP</title>
	</head>


	
	<script src="JS/CryptoJS v3.1.2/rollups/aes.js"></script>
<script src="JS/CryptoJS v3.1.2/components/enc-base64-min.js"></script>
<script type = "text/javascript" src = "JS/jquery-min.js"> </script>
	
	
	<!--  
	<script>
		function validate(){
			employeeId=document.getElementById("EmployeeId").value;
			fName=document.getElementById("FirstName").value;
			contactNo=document.getElementById("ContactNo").value;
			emailID=document.getElementById("EmailId").value;
			dept=document.getElementById("Department").value;
			post=document.getElementById("Post").value;
			user=document.getElementById("UserName").value;
			pass=document.getElementById("Password").value;
			rePass=document.getElementById("RePassword").value;
			role=document.getElementById("Role").value;
	
			if(employeeId==null || employeeId==""){
				alert("Please enter your Employee Id");
				return false;
			}
			if(employeeId.length>10){
				alert("Employee Id is too long");
				return false;
			}
			if(fName==null || fName==""){
				alert("Please enter your First Name");
				return false;
			}
			if(contactNo==null || contactNo==""){
				alert("Please enter your Contact No");
				return false;
			}
			if(contactNo.length!=10){
				alert("Invalid contact no please enter only 10 digits");
				return false;
			}
			if(emailID==null || emailID==""){
				alert("Please enter your email id");
				return false;
			}
			if(dept==null || dept==""){
				alert("Please enter your department");
				return false;
			}
			if(post==null || post==""){
				alert("Please enter your post");
				return false;
			}
			if(user==null || user==""){
				alert("Please enter your User Name");
				return false;
			}
			if(pass==null || pass==""){
				alert("Please enter your Password");
				return false;
			}
			if(rePass==null || rePass==""){
				alert("Please enter re-enter your password");
				return false;
			}
			
			if(role=="Select"){
				alert("Please enter your role");
				return false;
			}
			if(pass!=rePass){
				alert("Passwords dont match");
				return false;
			}
		}

</script>
-->
	<script>
function validateForm() {
	
	$("#comment").html("");
	$("#comment1").html("");
	$("#comment2").html("");
	$("#comment3").html("");
	$("#comment4").html("");
	$("#comment5").html("");
	$("#comment6").html("");
	$("#comment7").html("");
	$("#comment8").html("");
	$("#comment9").html("");
	$("#comment10").html("");
    var x = document.forms["myForm"]["EmailId"].value;
    var atpos = x.indexOf("@");
    var dotpos = x.lastIndexOf(".");
    if(x=="" || x==null){
    	$("#comment4").html("");
    }
    else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
    	$("#comment4").html("&emsp; Please enter a valid Email id.");;
        return false;
    }
}
</script>
	

	
	
<script>


	$(document).ready(function() {
		
		$("#UserName").blur(function(){
			
			userName= $("#UserName").val();
			$("#comment").html("");
			$("#comment1").html("");
			$("#comment2").html("");
			$("#comment3").html("");
			$("#comment4").html("");
			$("#comment5").html("");
			$("#comment6").html("");
			$("#comment7").html("");
			$("#comment8").html("");
			$("#comment9").html("");
			$("#comment10").html("");
		
			
			
			
			$.ajax({
	            type:"POST",
	            url:"CheckUserName",
	            data:"userName=" + userName,
	            success : function(data) {
	    
	            	if(data.toString().indexOf("UserName") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
			              $("#userName").val('');
			         	 $("#Password").val('');
			        	 $("#RePassword").val('');
			            $("#comment7").html(data);
					
		             }
	            	else if(data.toString().indexOf("Success") != -1){
	            		
	            	}
		        	else{
			             $("#comment").html("Some unexpected error has occured");
		             }
	          	},
		   		error: function(data) {
		     		$("#comment").html("Something went wrong!");
		   		}
	        });
	 		return false;
	    }); 
	
		
	    $("#reg").click(function() {
	    	EmployeeId = $("#EmployeeId").val();
	        FirstName = $("#FirstName").val();
	        lName = $("#LastName").val();
	        contactNo= $("#ContactNo").val();
	        emailID = $("#EmailId").val();
	        dept = $("#Department").val();
	        post = $ ("#Post").val();
	        userName= $("#UserName").val();
	        pass = $("#Password").val();
	        rePass = $("#RePassword").val();
	        role= $("#Role").val();
	        
	    //    alert("hgdjc");
	  //      var strMD5 = $.md5(pass);
	//	    alert(strMD5);
	        
	//	var hash = CryptoJS.MD5(pass);
	//	alert(hash);
		
		
	        $("#comment").html("");
			$("#comment1").html("");
			$("#comment2").html("");
			$("#comment3").html("");
			$("#comment4").html("");
			$("#comment5").html("");
			$("#comment6").html("");
			$("#comment7").html("");
			$("#comment8").html("");
			$("#comment9").html("");
			$("#comment10").html("");
	        
		
			
			
	        if(EmployeeId == "" || EmployeeId == null) {
		         $("#comment1").html("&emsp; Please enter your employee Id.");
		         return false;
	        }
	        
	        if(EmployeeId.length>10){
	        	 $("#comment1").html("&emsp; Invalid employee Id.");
		         return false;
	        }
	        if(FirstName == "" || FirstName == null) {
		         $("#comment2").html("&emsp; Please enter your First name.");
		         return false;
	        }
			
	        if(contactNo == "" || contactNo == null) {
		         $("#comment3").html("&emsp; Please enter your Contact no.");
		         return false;
	        }
	        
	        if(contactNo.length!=10){
	        	 $("#ContactNo").val('');
	        	$("#comment3").html("&emsp; Please enter 10 digit contact no.");
				return false;
			}
	        
	        if(emailID == "" || emailID == null) {
		         $("#comment4").html("&emsp; Please enter your Email id.");
		         return false;
	        }
	        
	      
	        
	        if(dept == "" || dept == null) {
		         $("#comment5").html("&emsp; Please enter your department.");
		         return false;
	        }
	       
	        if(post == "" || post == null) {
		         $("#comment6").html("&emsp; Please enter your post.");
		         return false;
	        }
	        
	        if(userName == "" || userName == null) {
		         $("#comment7").html("&emsp; Please enter your User name.");
		         return false;
	        }
	        
	        if(pass == "" || pass == null) {
		         $("#comment8").html("&emsp; Please enter your password.");
		         return false;
	        }
	        if(rePass == "" || rePass == null) {
		         $("#comment9").html("&emsp; Please re-enter your password.");
		         return false;
	        }
	        
	        if(role=="Select"){
	        	 $("#comment10").html("&emsp; Please enter your role.");
				return false;
			}
	        
	        if(pass!=rePass){
	        	 $("#Password").val('');
	        	 $("#RePassword").val('');
				$("#comment8").html("&emsp; Passwords dont match .");
			}	
	       
	   	 
		
			
	       
		   
          //  $('#dvValue').html("MD5 string of <b>" + strVal + "</b> is <b>" + strMD5 + "</b>");
       		
    
			$.ajax({
	            type:"POST",
	            url:"register",
	            data:"employeeId=" + EmployeeId + "&fName=" + FirstName  + "&lName=" + lName + "&contactNo=" + contactNo
	            + "&emailID=" + emailID + "&dept=" + dept + "&post=" + post + "&userName=" + userName + "&pass=" + pass
	            + "&role=" + role,
	            success : function(data) {
	    
	            	if(data.toString().indexOf("UserName") != -1) {   // means if the message received from servlet in form of out.print.ln contains invalid or not
			              $("#userName").val('');
			         	 $("#Password").val('');
			        	 $("#RePassword").val('');
			              $("#comment7").html(data);
		             }
		             else if(data.toString().indexOf("Successful") != -1){
		              	  $(location).attr('href',"SuccessfulReg.jsp");
	        		 }
		             else if (data.toString().indexOf("exists") != -1){
		            	 $("#EmployeeId").val('');
		            	 $("#Password").val('');
			        	 $("#RePassword").val('');
		            	 $("#comment1").html(data);
		             }
		             else if(data.toString().indexOf("Invalid") != -1){
		            	 $("#EmployeeId").val('');
		            	 $("#comment1").html(data);
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
		$("#comment8").html("");
		$("#comment9").html("");
		$("#comment10").html("");
		document.getElementById("myForm").reset();
		

	}
	
	</script>
	
	
	<style>
		
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
		border-color: #4CAF50;
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
	
	<body>
		<br>
		<h1 align="center" style="color:white;">REGISTER</h1>
		<div class="login-page">
	
			<div class="f">
				<form class="login-form" name="myForm" id="myForm">	
					<p id="comment" style="color:red; text-align:center;"></p>
				
					<br><br>Employee Id:<br>
					<input type="text" name="EmployeeId"  id="EmployeeId">
					<p id= "comment1" style="color:red; position:absolute;"></p>  
					
			
					<br><br>First Name:<br>
					<input type = "text" name ="FirstName" id="FirstName" >
					<p id= "comment2" style="color:red; position:absolute;"></p>
					
					<br><br>Last Name:<br>
					<input type="text" name="LastName" id="LastName">
				
					<br><br>Contact No:<br>
					<input type="text" name= "ContactNo" id="ContactNo">
					<p id= "comment3"style="color:red; position:absolute"></p>
				
					<br><br>Email id: <br>
					<input type="email" name="EmailId" id="EmailId" onblur="return validateForm();">
					<p id= "comment4"style="color:red; position:absolute;"></p>
				
					<br><br>Department: <br>
					<input type="text" name="Department" id="Department">
					<p id= "comment5"style="color:red; position:absolute;"></p>
					
					<br><br>Post:<br>	
					<input type="text" name="Post" id="Post">
					<p id= "comment6"style="color:red; position:absolute;"></p>
					
					<br><br>Enter User Name :<br>
					<input type="text" name= "UserName" id="UserName">
					<p id= "comment7"style="color:red; position:absolute;"></p>
					
					<br><br>Enter your Password: <br>
					<input type="password" name="Password" id="Password">
					<p id= "comment8"style="color:red; position:absolute;"></p>
					
					<br><br>Re-Enter Password: <br>
					<input type ="password" name="RePassword" id="RePassword">
					<p id= "comment9"style="color:red; position:absolute;"></p>
					
					
					<br><br>
					Role:<br>
					<select name = "Role" id="Role">
						<option value="Select" >Select from here</option>
						<option value="User">User</option>
						<option value="AndroidDeveloper">Android Developer</option>
						<option value="ImageDeveloper">Image Developer</option>
						<option value="WebDesigner">Web Designer</option>
						<option value="IOSDeveloper">IOS Developer</option>
						<option value="Tester">Tester</option>
					</select>
					<p id= "comment10"style="color:red; position:absolute;"></p>
		
				<br><br><br>
				<button id="reg"> Submit </button>
				<br><br>
				
			</form>
			<button id="set" onclick="clearr();">Reset</button> &nbsp;&nbsp;
				<a href="UserLogin.jsp"><button>Back</button></a>
		</div>
	
		</div>
		
		<br><br><br>
	
	</body>

</html>