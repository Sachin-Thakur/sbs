<<<<<<< HEAD
<html>
<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@page import="java.util.Random"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%@ page import="com.daniel.util.DbUtil.*" %>

<head><link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
    <!-- Custom fonts for this template -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">	
    <!-- Plugin CSS -->
    <link href="magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/signup.css" rel="stylesheet">
    </head>
    <style>
    body {
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
    
    
    /* snackbar CSS*/
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
    z-index:99999;
    display:none;
    position:fixed;
    color:white;
    }
    #animatesnackbar
    {
    transition-timing-function:cubic-bezier(1,0.5,0.8,0.9);
   	animation:slideDown 1.5s ,opacity 3s ease-out;
    animation-fill-mode:forwards;
    display:block;
    animaion-delay:2s;
    }
    @keyframes slideDown
    {
    0%
    {
    margin-top:0%;
    opacity:0;
    }
    25%
    {
    margin-top:3%;
    opacity:0.5;
    }
    50%
    {
    margin-top:6%;
    opacity:1;
    }
    75%
    {
    margin-top:3%;
    opacity:0.5;
    }
    100%
    {
    margin-top:0%;
    opacity:0;
    }
    }
    .otp-div
    {
    display:inline-flex;
    vertical-align:middle;
    }
    #otp-btn
    {
    padding-top: 7%;
    padding-left: 20%;
    }
    #otp-form
    {
    display:inline-flex;
    }
    </style>
    
    
    <body>
    <div class="errorsnackbar"></div>
	<div class="login-signup">

		<div class="vl">
        <span class="vl-innertext">or</span>
      </div>
    	<div class="container" id="signup">
    		<h2 class="text-center text-uppercase text-secondary  mb-0" > Sign Up</h2>

    		<hr class="star-dark  mb-5">
    		<div class="row">

    		<div class="col-md-8-px-5 mx-auto">
    		<form  name="signup" action="christLogin.jsp" method="POST">

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
                    <input class="form-control" type="text" name="emplreg"  id="employee_n" required="required" data-validation-required-message="Please Enter Your Register Number." Placeholder="Christ Register Number">
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
    			<input class="form-control" type="email" id="email-signup" name="email-signup" placeholder="name.title@.christuniveristy.in" required="required" data-validation-required-message="Please Enter Your Email Address.">
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
    		<div id="success"></div>
    		<div class="form-group">
    		<button type="submit"  name="signup" id="btn_signup" class="btn btn-primary btn-xl" style="background-color:#3D5998;border:1px solid #3D5998">Done</button>
    		</div>
    		</form>
    	</div>

<div  class="otp-div">
<form  name="otp" action="christLogin.jsp"  method="POST" id="otp-form">
    		<div class="control-group">
    		<div class="form-group floating-label-form controls mb-0 pb-3">
    		<label>OTP Number:</label>
    		<input class="form-control" type="text" name="Otp" placeholder="Enter OTP Please" required="required" data-validation-required-message="Please Enter Your Email.">
    		<p class="help-block text-danger"></p>
    		</div>
    		</div>
    		<div class="control-group" id="otp-btn" >
    		<button type="submit" class="btn btn-primary btn-xl mdl-js-button mdl-button--raised"  style="margin-top:3%;background-color:#3D5998;border:1px solid #3D5998"> GO</button>
    		</div>
    		
    		</form>
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
    		<form  name="signup" action="Login"  method="POST">
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
    		<button type="submit"    class="btn btn-primary btn-xl mdl-js-button mdl-button--raised"  style="margin-top:3%;background-color:#3D5998;border:1px solid #3D5998"> GO</button>
    		</div>
    		</form>
		</div>	
		
    		
    		</div>
    		</div>
    	
    	<h2>Faculty Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="EMP_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Abhishek Agarwal">
	<input type="text" name="MOBILE_NO" value="9660440660">
	<input type="text" name="EMAIL_ID" value="abhishek.agarwal@mca.christuniversity.in">
	<input type="text" name="DEPARTMENT" value=1MCA">
	<input type="hidden" name="ROLE" value="FACULTY">
	
	<input type="submit" value="Login">

</form>
<h2>Admin Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="ADMIN_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="SUPER ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
<h2>Class Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="ADMIN_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="CLASS ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
<h2>Chal Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="ADMIN_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="CHAL ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
<h2>Cews Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="ADMIN_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="CEWS ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
<h2> CAW Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="ADMIN_ID" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="CAW ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
<h2>Commitee Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="REG_NO" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="COMMITEE ADMIN">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>

<h2>Student Login</h2>
<form id="loginForm2" action="index.jsp" method="post">
	
	<input type="text" name="REG_NO" value="1641010">
	<input type="text" name="USER_NAME" value="Aniruddho Majumder">
	<input type="text" name="ROLE" value="STUDENT">
	<input type="text" name="EMAIL_ID" value="aniruddho1997@gmail.com">
	<input type="submit" value="Login">

</form>
    <%
Connection con=DbUtil.getConnection();
int snum=0,login_flag=0;
%>
  <% 
     java.sql.Statement getClassEventsSTAT =null;
     ResultSet getClassEventsRSET,detailsfetchRSET =null;
 %>
	<%
	String eOtp = request.getParameter("otp");
	 

	 final String username = "caps@christuniversity.in";
	 final String passwordemail = "CAPS@EXPERTISE";
	 
	 
	 
	 String otpMessage = request.getParameter("email-signup");
	 
	 
	 Properties props = System.getProperties();
	 props.setProperty("mail.smtp.host", "smtp.gmail.com");
	 props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	 props.setProperty("mail.smtp.socketFactory.fallback", "false");
	 props.setProperty("mail.smtp.port", "465");
	 props.setProperty("mail.smtp.socketFactory.port", "465");
	 props.put("mail.smtp.auth", "true");
	 props.put("mail.debug", "true");
	 props.put("mail.store.protocol", "pop3");
	 props.put("mail.transport.protocol", "smtp");
	 
	 
	Random rnd = new Random();
	int rand = rnd.nextInt(900000) + 100000;

	String otp = Integer.toString(rand);
	 

	  if(request.getParameterMap().containsKey("emplreg"))
		  
		{
		
	try{
	   Session mySession = Session.getInstance(props, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, passwordemail);
				}
			});
	   
	   String to =  request.getParameter("email-signup");
	   

		 String from ="Caps@christuniveristy.in";
		 
	   
	   MimeMessage message = new MimeMessage(mySession);
	   
	   message.setFrom(new InternetAddress(from));
	   
	   message.addRecipient(Message.RecipientType.TO,
	                            new InternetAddress(to));
	   
	   
	   
	   message.setSubject("Session Booking System Registration Process");
	   
	   message.setText("Dear Sir/Ma'am\n\n"
	 		  +"\n\nThank You for registering with us." 
	 		  +"\n Your OTP is "+otp
	 		  +"\n\nThank You"
	 		  +"\nWarm Regards"
	 		   );
	 				  
	 				  Transport.send(message);
	
	
	  /// result = "Send message successfully....";
		  
			String  name=request.getParameter("name"),
						empid=request.getParameter("emplreg"),
						phone=request.getParameter("phone"),
						dept=request.getParameter("department"),
						email=request.getParameter("email-signup"),
						password=request.getParameter("password-signup");

			  getClassEventsSTAT = con.createStatement();
			getClassEventsRSET= getClassEventsSTAT.executeQuery("select sno from registeredusers");

			
			
			session.setAttribute("USER","FACULTY");
			session = request.getSession();
			session.setAttribute("USER_NAME",detailsfetchRSET.getString("name") );
			session.setAttribute("EMAIL_ID", request.getParameter("email-login"));
			session.setAttribute("REGISTER_NUMBER",detailsfetchRSET.getString("register"));
			session.setAttribute("CONTACT_NUMBER",detailsfetchRSET.getString("phone"));
			session.setAttribute("CLASS_NAME",detailsfetchRSET.getString("dept"));
			session.setAttribute("TERM", "0");
			session.setAttribute("ROLE","FACULTY");
			session.setAttribute("USER_CATEGORY", "Faculty");
			session.setAttribute("SNO",detailsfetchRSET.getString("sno") );
			session.setAttribute("PASSWORD",detailsfetchRSET.getString("password") );
			session.setAttribute("OTP",otp);
			


			while(getClassEventsRSET.next())
			{
			snum=getClassEventsRSET.getInt("sno");
			
			}
			
			
			snum+=1;
			getClassEventsSTAT.executeUpdate("insert into registeredusers(sno,name,register,phone,dept,email,password) values('"+session.getAttribute("SNO")+"','"+session.getAttribute("USER_NAME")+"','"+session.getAttribute("REGISTER_NUMBER")+"','"+session.getAttribute("CONTACT_NUMBER")+"','"+session.getAttribute("CLASS_NAME")+"','"+session.getAttribute("EMAIL_ID")+"','"+session.getAttribute("PASSWORD")+"')");
			response.sendRedirect("/sbs/class/index.jsp");
			System.out.println("Able to run till here");
	}
			catch (MessagingException mex) {
			      mex.printStackTrace();
			      //result = "Error: unable to send message....";
			   }
			
		catch(NullPointerException pe)
		{
			pe.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println(e);
		
	}
		
	}
	  
/*
			 if(request.getParameterMap().containsKey("Otp"))
			 {
			
	   if(eOtp==otp)
		 {
		   getClassEventsRSET= getClassEventsSTAT.executeQuery("select sno from registeredusers");

			
			
			session.setAttribute("USER","FACULTY");
			session = request.getSession();
			session.setAttribute("USER_NAME",detailsfetchRSET.getString("name") );
			session.setAttribute("EMAIL_ID", request.getParameter("email-login"));
			session.setAttribute("REGISTER_NUMBER",detailsfetchRSET.getString("register"));
			session.setAttribute("CONTACT_NUMBER",detailsfetchRSET.getString("phone"));
			session.setAttribute("CLASS_NAME",detailsfetchRSET.getString("dept"));
			session.setAttribute("TERM", "0");
			session.setAttribute("ROLE","FACULTY");
			session.setAttribute("USER_CATEGORY", "Faculty");
			session.setAttribute("SNO",detailsfetchRSET.getString("sno") );
			session.setAttribute("PASSWORD",detailsfetchRSET.getString("password") );
			
			




			System.out.println("Not Able to run till here");
		   
		getClassEventsSTAT.executeUpdate("insert into registeredusers(sno,name,register,phone,dept,email,password) values('"+session.getAttribute("SNO")+"','"+session.getAttribute("USER_NAME")+"','"+session.getAttribute("REGISTER_NUMBER")+"','"+session.getAttribute("CONTACT_NUMBER")+"','"+session.getAttribute("CLASS_NAME")+"','"+session.getAttribute("EMAIL_ID")+"','"+session.getAttribute("PASSWORD")+"')");
		response.sendRedirect("/sbs/class/index.jsp");
		 }
			 }

	
	
		
		
		 if(eOtp==otp)
		 {
		getClassEventsSTAT.executeUpdate("insert into registeredusers(sno,name,register,phone,dept,email,password) values('"+snum+"','"+name+"','"+empid+"','"+phone+"','"+dept+"','"+email+"','"+password+"')");
		response.sendRedirect("/sbs/christLogin.jsp");
		 }*/
		
	/* 
	REMOVE BELOW CODE IF YOU WANT TO GO AHEAD WITH LOGIN THROUGH SAME PAGE PLEASE DO WRITE THE CATCH BLOCK OF THIS COMMENT SECTION
	else if(request.getParameterMap().containsKey("email-login"))
		{
		try
		{
		getClassEventsSTAT = con.createStatement();
		String login_email=request.getParameter("email-login");
		getClassEventsRSET=getClassEventsSTAT.executeQuery("select sno, email from registeredusers");
		while(getClassEventsRSET.next())
		{
			String dbemail=getClassEventsRSET.getString("email"),
					passwd=request.getParameter("password-login"),
					password_checker;
					snum=getClassEventsRSET.getInt("sno");
			if(login_email.equals(dbemail))
			{
				login_flag++;
				getClassEventsSTAT = con.createStatement();
				detailsfetchRSET=getClassEventsSTAT.executeQuery("select * from registeredusers where email ='"+login_email+"'");
				while(detailsfetchRSET.next())
				{
				password_checker=detailsfetchRSET.getString("password");
				if(password_checker.equals(passwd))
				{
					session.setAttribute("USER","FACULTY");
					session = request.getSession();
					session.setAttribute("USER_NAME",detailsfetchRSET.getString("name") );
					session.setAttribute("EMAIL_ID", request.getParameter("email-login"));
					session.setAttribute("REGISTER_NUMBER",detailsfetchRSET.getString("register"));
					session.setAttribute("CONTACT_NUMBER",detailsfetchRSET.getString("phone"));
					session.setAttribute("CLASS_NAME",detailsfetchRSET.getString("dept"));
					session.setAttribute("TERM", "0");
					session.setAttribute("ROLE","FACULTY");
					session.setAttribute("USER_CATEGORY", "Faculty");
				}
				else
				{
					System.out.println("Wrong password");
					
					
			
					
					
		
		
					
				}
				}
			}
		}
		}
		catch()
		{
			
		}
		}
	if(login_flag==0)
		{
		
		System.out.println("User is not Registered");
	
			
		}*/
		
		
		
		  
	  try {
		  
	  
	  if(request.getParameterMap().containsKey("Otp"))
		 {
		
if(eOtp.equals(otp))
	 {

	
	
		System.out.println("Not Able to run till here");
	getClassEventsSTAT.executeUpdate("insert into registeredusers(sno,name,register,phone,dept,email,password) values('"+session.getAttribute("SNO")+"','"+session.getAttribute("USER_NAME")+"','"+session.getAttribute("REGISTER_NUMBER")+"','"+session.getAttribute("CONTACT_NUMBER")+"','"+session.getAttribute("CLASS_NAME")+"','"+session.getAttribute("EMAIL_ID")+"','"+session.getAttribute("PASSWORD")+"')");
	response.sendRedirect("/class/index.jsp");
	 }
		 }

	  }
	  catch(NullPointerException pe)
	  {
		  pe.printStackTrace();
	  }
	catch(Exception e)
	  {
		e.printStackTrace();
	  }
		
		
	%>
	
	
		
    	<%	

		
	
 
 
 
 

 
 String action =request.getParameter("action");
 if(action==null){
 
 }else if(action!=null)
 {
	 
  
  %><%if(action.equals("loginFailed")){ 
 %>
 <script> 
    
    $(".errorsnackbar").html("Please only use your Christ Email Id!");
	
    setTimeout(function(){ $(".errorsnackbar").attr("id","animatesnackbar");}, 2000);
</script>
<%}else if(action.equals("LoginAgain")){%>
 <script> 
    var x = document.getElementById("snackbar")
    x.className = "show";
    x.innerHTML="Session expired please login again";
    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
</script>

<%}else if(action.equals("NotAuthorizedUser")){%>
<script> 
var x = document.getElementById("snackbar")
x.className = "show";
x.innerHTML="You are not an Authorzed User";
setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
</script>

<%}else if(action.equals("useNewPassword")){%>
<script> 
var x = document.getElementById("snackbar")
x.className = "show";
x.innerHTML="You can use your new password";
setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
</script>

<%} else if(action.equals("AccountDoesNotExist")){%>
<script> 
var x = document.getElementById("snackbar")
x.className = "show";
x.innerHTML="Account does not exist";
setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
</script>

<%} %>
<%} %>
</body>   
     <script>
    $(document).ready(function(){
    	$("#btn_signup").click(function(){
    		$("#email-signup").val("<%=session.getAttribute("EMAIL")%>");
    		alert("<%=session.getAttribute("EMAIL")%>");
    	});
    });
    </script> 
=======
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
>>>>>>> branch 'master' of https://github.com/Sachin-Thakur/sbs.git
</html>