<%@page import="java.util.*" %>
<% %>
<html><head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

    <!-- Custom fonts for this template -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">	
    <!-- Plugin CSS -->
    <link href="magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/signup.css" rel="stylesheet">
    </head>
    <script>
	$(document).ready(function(){
		$("#christEmail").blur(function()
			{
			$(".errorsnackbar").removeAttr("id","animatesnackbar");
			if(document.activeElement !== this)
			{
			if($(this).val()!="")
			{
			var christemail=$(this).val();
			var i=0;
			var emailarray=[];
			emailarray=christemail.split("@");
			var length=emailarray.length;
			var partchrist;
			var flag=0;
			while(i!=length)
			{
				partchrist=emailarray[i];
				i++;
			}
			var splitemailchrist=[];
			splitemailchrist=partchrist.split(".");
			length=splitemailchrist.length;
			var splitemailpartchrist;
			i=0;
			while(i!=length)
			{
			splitemailpartchrist=splitemailchrist[i];
			splitemailpartchrist=splitemailpartchrist.toLowerCase();
			if(splitemailpartchrist=="christuniversity")
			{	
				if(i+1>=length)
				{
					flag=0;
					break;
				}
				else
				splitemailpartchrist=splitemailchrist[i+1]
				splitemailpartchrist=splitemailpartchrist.toLowerCase();
				if(splitemailpartchrist=="in")
				flag=1; 
				break;
			}
			else
				i++;
			}
				if(flag==1){
				alert("right");
				}
			else
				{
				alert("wrong");
				$(".errorsnackbar").html("Please only use your Christ Email Id!");
				$(".errorsnackbar").attr("id","animatesnackbar");
				$(this).val("");
				}
			}
			}
			
	});
	});
	</script>
    <style>
    *
    {
    box-sizing:border-box;
    }
    body
    {
    overflow-x:hidden;
    }
    .login-signup
    {
    display:inline-flex;
    padding:5%;
    width:100%;
    margin:auto;
    }
    #signup>.row
    {
    padding-right:20%;
    }
    #login>.row
    {
       margin-left:15%;
       padding-right:5%;
    }
    .formimage
    {
    height: 42%;
    width: 50%;
    margin-left:20%;
    margin-bottom:5%;
    }
    .vl
    {
    height: 87%;
    vertical-align: middle;
    left: 50%;
    width: 0;
    border: 3px solid #2c3e50;
    position: absolute;
    transform: translate(-50%,22%);
    }
    .vl-innertext
    {
    position: absolute;
  	top: 50%;
    transform: translate(-50%, -50%);
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    border-radius: 50%;
    padding: 8px 10px;
    font-weight:bolder;
    }
    .errorsnackbar
    {
    margin-left: 50%;
    margin-right: 50%;
    transform: translate(-50%,-50%);
    height: 10%;
    width: 25%;
    border-radius: 3px;
    background-color: #323232;
    pointer-events: none;
    position:absolute;
    z-index:99999;
    display:none;
    }
    #animatesnackbar
    {
    transition-timing-function:cubic-bezier(.4,0,1,1);
    animation:slideUp 3s,opacity 0.2s ease-out;
    animation-fill-mode:forwards;
    display:block;
    }
    @keyframes slideUp
    {
    0%
    {
    margin-top:0%;
    opacity:0;
    }
    25%
    {
    margin-top:-2.5%;
    opacity:0.5;
    }
    50%
    {
    margin-top:-5%;
    opacity:1;
    }
    75%
    {
    margin-top:-2.5%;
    opacity:0.5;
    }
    100%
    {
    margin-top:0%;
    opacity:0;
    }
    }
    @media screen and (max-width:1024px)
	{
	.vl
	{
	display:none;
	}
	.login-signup
	{
	display:inline-block;
	}
	#signup>.row
    {
    padding-right:20%;
    margin-left:15%;
    margin-bottom:10%;
    }
    #signup
    {
    border-bottom:2px solid #323232;
    }
    #login>.row
    {
    padding: 10%;
    margin-right: 7%;
    margin-left: 7%;
    }
    #login
    {
     margin-top:10%;
    }
    .formimage
    {
    display:none;
    }
	}
    </style>
<body>
	<div class="login-signup">

		<div class="vl">
        <span class="vl-innertext">or</span>
      </div>
    	<div class="container" id="signup">
    		<h2 class="text-center text-uppercase text-secondary  mb-0" > Sign Up</h2>

    		<hr class="star-dark  mb-5">
    		<div class="row">

    		<div class="col-md-8-px-5 mx-auto">
    		<form  name="signup" action="index.jsp" method="POST">

    		<div class="control-group">
    		<div class="form-group floating-label-form controls mb-0 pb-3">
    		<label>Name:</label>
    		<input class="form-control" type="text" name="name" placeholder="Name" required="required" data-validation-required-message="Please Enter Your Name.">
    		<p class="help-block text-danger"></p>
    		</div>
    		</div>
            <div class="control-group"  >
                <div id="employee_div" class="form-group floating-label-form controls mb-0 pb-3" id="employee">
                <label  id="employee_lb">Employee Id:</label>
                    <input class="form-control" type="text" name="emplreg"  id="employee_n" required="required"  data-validation-required-message="Please Enter Your Register Number." Placeholder="Christ Register Number">
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="control-group"  >
                <div id="phone_div" class="form-group floating-label-form controls mb-0 pb-3" id="phone">
                <label  id="phone_lb">Phone Number:</label>
                    <input class="form-control" type="text" name="phone"  id="phone_n" required="required"  data-validation-required-message="Please Enter Your Phone Number."  maxlength="10" placeholder="Phone Number">
                    <p class="help-block text-danger"></p>
                </div>
            </div>
            <div class="control-group"  >
                <div id="department_div" class="form-group floating-label-form controls mb-0 pb-3" id="phone">
                <label  id="phone_lb">Department:</label>
                    <input class="form-control" type="text" name="department"  id="department_n" required="required"  data-validation-required-message="Please Enter Your Department." placeholder="Department">
                    <p class="help-block text-danger"></p>
                </div>
            </div>
    		<div  class="control-group">
    			<div class="form-group floating-label-form controls mb-0 pb-3">
    			<label>Email Address:</label>
    			<input class="form-control" type="email" name="email-signup" placeholder="name.title@.christuniveristy.in" required="required" data-validation-required-message="Please Enter Your Email Address." id="christEmail">
    			<p class="help-block text-danger"></p>
    		</div>
    		</div>
    		<div  class="control-group">
    			<div class="form-group floating-label-form controls mb-0 pb-3">
    			<label>Password:</label>
    			<input class="form-control" type="password" name="password-signup" placeholder="Password" required="required" data-validation-required-message="Please Enter Your Password.">
    			<p class="help-block text-danger"></p>
    		</div>
    		</div>


    	<!--<div class="control-group">
    			<div class="form-control floating-label-form controls mb-0 pb-3">
    				<label>Select User</label>
    				<select    name="usertype">
    				<option  >Select Option</option>
					
    				<option   value="Student" >Student</option>
					<option   value="Teacher" >Teacher</option>
    				    					

    				</select>
    				<p class="help-block text-danger"></p>
 				</div>
    		</div>-->
    		<br>
    		<div id="success"></div>
    		<div class="form-group">
    		<button type="submit"  class="btn btn-primary btn-xl" style="background-color:#3D5998;border:1px solid #3D5998">Done</button>
    		</div>
    		</form>
    	</div>
    	</div>
    	</div>	
    		<div class="container" id="login">
    		<h2 class="text-center text-uppercase text-secondary mb-0" > Login </h2>
    		<hr class="star-dark mb-5">
    		<h3 class="text-center text-secondary mb-0">Already have an account? Login</h3>
    		<div class="row">
    		<div class="col-md-8-px-5 mx-auto">
    		<img class="col-mx-5-px-1  formimage" src="res/defaultform.jpg">
    		</div>
    		<form  name="signup" action="Login" method="POST">
    		<div class="control-group">
    		<div class="form-group floating-label-form controls mb-0 pb-3">
    		<label>Email Address:</label>
    		<input class="form-control" type="email" name="email-login" placeholder="Your christ email id" required="required" data-validation-required-message="Please Enter Your Email.">
    		<p class="help-block text-danger"></p>
    		</div>
    		</div>



    		<div  class="control-group">
    			<div class="form-group floating-label-form controls mb-0 pb-3">
    			<label>Password:</label>
    			<input class="form-control" type="password" name="password-login" placeholder="Password" required="required" data-validation-required-message="Please Enter Your Password.">
    			<p class="help-block text-danger"></p>
    		</div>
    		</div>
    		<div id="success"></div>
    		<div class="form-group">
    		<button type="submit"  class="btn btn-primary btn-xl" style="margin-top:3%;background-color:#3D5998;border:1px solid #3D5998"> GO</button>
    		</div>
    		</form>
    		</div>
    		</div>
    		</div>
    		<div class="errorsnackbar"></div>
		



</body>
</html>