<%@page import="java.util.*" %>
<html>
<head>
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
<title>Centre for Academic and Professional Support - SBS</title>
</head>
  <style>
    *
    {
    box-sizing:border-box;
    }
    body
    {
    overflow-x:hidden;
    background-image:linear-gradient(from left top to right bottom,tomato 0%,purple 100%);
    }
        #login>.row
    {
       margin-left:15%;
       padding-right:5%;
    }
    .formimage
    {
    height: 42%;
    width: 30%;
    margin-left:50%;
    margin-bottom:2%;
    transform: translate(-75%,0%);
    }
    #control-group
    {
    width: 50%;
    margin-left: 50%;
    transform: translate(-65%,0%);
    }
    @media screen and (max-width:768px)
    {
    #control-group
    {
    width:100%;
    transform: translate(-58%,0%);
    }
    .formimage
    {
    width:80%;
   	transform: translate(-58%,0%);
    }
    }
    </style>
<body>
    		<div class="container" id="login">
    		<h2 class="text-center text-uppercase text-secondary mb-0" > Login </h2>
    		<hr class="star-dark mb-5">
    		<h3 class="text-center text-secondary mb-0">Admin Login</h3>
    		<div class="row">
    		<div class="col-md-8-px-5 mx-auto">
    		<img class="col-mx-5-px-1  formimage" src="res/defaultform.jpg">
    		</div>
    		<form  id="control-group" name="login" action="AdminLogin" method="POST">
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
    		<input type="hidden" name="ADMIN_ID">
    		</form>
    		</div>
    		</div>
</body>
</html>