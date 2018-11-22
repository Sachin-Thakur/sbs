<html>
<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>

<%
Connection con=DbUtil.getConnection();
int snum=0,login_flag=0;
%>
  <%! 
     java.sql.Statement getClassEventsSTAT =null;
     ResultSet getClassEventsRSET,detailsfetchRSET =null;
 %>
	<%
	if(request.getParameterMap().containsKey("emplreg"))
	{
		try
		{
		getClassEventsSTAT = con.createStatement();
		String  name=request.getParameter("name"),
					empid=request.getParameter("emplreg"),
					phone=request.getParameter("phone"),
					dept=request.getParameter("department"),
					email=request.getParameter("email-signup"),
					password=request.getParameter("password-signup");
		getClassEventsRSET= getClassEventsSTAT.executeQuery("select sno from registeredusers");
		while(getClassEventsRSET.next())
		{
		snum=getClassEventsRSET.getInt("sno");
		}
		snum+=1;
		getClassEventsSTAT.executeUpdate("insert into registeredusers(sno,name,register,phone,dept,email,password) values('"+snum+"','"+name+"','"+empid+"','"+phone+"','"+dept+"','"+email+"','"+password+"')");
		response.sendRedirect("/sbs/class/index.jsp");
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
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
	if(login_flag==0)
		{
			%>
<div id="demo-snackbar-example" class="mdl-js-snackbar mdl-snackbar">
  <div class="mdl-snackbar__text"></div>
  <button class="mdl-snackbar__action" type="button"></button>
</div>

<script>
(function() {
  'use strict';
  var snackbarContainer = document.querySelector('#demo-snackbar-example');
  var showSnackbarButton = document.querySelector('#demo-show-snackbar');
  var handler = function(event) {
    showSnackbarButton.style.backgroundColor = '';
  };
  showSnackbarButton.addEventListener('click', function() {
    'use strict';
    showSnackbarButton.style.backgroundColor = '#' +
        Math.floor(Math.random() * 0xFFFFFF).toString(16);
    var data = {
      message: 'User not Registered!',
      timeout: 2000,
      actionHandler: handler,
      actionText: 'Undo'
    };
    snackbarContainer.MaterialSnackbar.showSnackbar(data);
  });
}());
</script>

 <%
			
			
			
			
		}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		}
	
	else if(request.getParameterMap().containsKey("EMP_ID")){
		session.setAttribute("USER", "FACULTY");
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("EMP_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("CONTACT_NUMBER", request.getParameter("MOBILE_NO"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("CLASS_NAME", request.getParameter("DEPARTMENT"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("TERM", "0");
		session.setAttribute("USER_CATEGORY", "Faculty");
		
		
	}
	else if(request.getParameterMap().containsKey("ADMIN_ID")){
		session.setAttribute("USER", "ADMIN");
		if(request.getParameter("ROLE").equals("SUPER ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "SUPER ADMIN");
		}
		if(request.getParameter("ROLE").equals("CLASS ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "CLASS ADMIN");
		}
		if(request.getParameter("ROLE").equals("CEWS ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "CEWS ADMIN");
		}
		if(request.getParameter("ROLE").equals("CHAL ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "CHAL ADMIN");
		}
		if(request.getParameter("ROLE").equals("CAW ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("ADMIN_ID"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "CAW ADMIN");
		}
	}
	else if((request.getParameterMap().containsKey("REG_NO")))
	{
		session.setAttribute("USER", "STUDENT");
		if(request.getParameter("ROLE").equals("STUDENT"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("REG_NO"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "STUDENT");
		}
		if(request.getParameter("ROLE").equals("COMMITEE ADMIN"))
		{
		
		session = request.getSession();
		session.setAttribute("REGISTER_NUMBER", request.getParameter("REG_NO"));
		session.setAttribute("USER_NAME", request.getParameter("USER_NAME"));
		session.setAttribute("ROLE", request.getParameter("ROLE"));
		session.setAttribute("EMAIL_ID", request.getParameter("EMAIL_ID"));
		session.setAttribute("USER_CATEGORY", "COMMITEE ADMIN");
		}
	}
	else if(session.getAttribute("REGISTER_NUMBER") == null){
		if(session.getAttribute("wing") == null){
			session.removeAttribute("wing");
			response.sendRedirect("christLogin.jsp");
			
		}
	} 
%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/home.css">
		<link rel="stylesheet" href="css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="js/bootstrap.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Session Booking System - Index</title>
	</head>
	<style>
	body
	{
	font-family:'lilita one',cursive;
	}
	</style>
	<body style="background-image: url(res/back.JPG); background-size: cover;">
		<nav>
			<div class="navbar navbar-inverse" style="margin-bottom: 0; border-radius: 0px; border-bottom: 0px;background:#303f9e">
				<a href="https://christuniversity.in/caps/"><img src="res/CAPS Logo White.png" style="float: left; width: 20%; margin-top: 2.25%; margin-bottom: 2.5%; margin-left: 15px; margin-right: 15px;"></a>
				<a href="https://christuniversity.in/"><img src="res/logo_new_christ.jpg" style="float: right; width: 15%; margin-top: 1%; margin-bottom: 1%; margin-left: 15px; margin-right: 10px;"></a>
			</div>
		<div class="navbar navbar-inverse" style="border-radius: 0px; border-top: 0px;background:#303f9e">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp" style="color:white">Session Booking System</a>
					</div>
					<ul class="nav navbar-nav navbar-right" style="color:white">
						
						<li class="navbar-inverse navbar-text" style="background:#303f9e;color:white;">Welcome  <%= session.getAttribute("USER_NAME") %></li>
						
						<li><a href="logout.jsp"style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>
	</nav>
		<div class="container" style="text-align: center;">
		<% 	try{if(session.getAttribute("USER").equals("ADMIN")|| session.getAttribute("USER").equals("FACULTY")|| session.getAttribute("USER").equals("STUDENT")){ %>
		<div class="container" style="padding: 0px;">
			<% if(session.getAttribute("USER_CATEGORY").equals("CAW ADMIN") || session.getAttribute("USER_CATEGORY").equals("SUPER ADMIN")  ){ %>
			<a href="underConstruction.jsp"><div class="panel panel-default caw-btn" style="max-height: 20.1%; float: left; overflow: hidden; display: inline-flex; margin-left: auto; margin-right: auto;">
					<div style="float: left; max-width: 35%;">
						<img src="res/CAW.png" style="max-width: 100%; height: auto;">
					</div><div class="description">
						Psychometric tests are offered to the university audience to get a better understanding of their strengths and aptitudes. These tests assess topics like personality types, learning style, career interest etc. The wing aims to equip the individuals for their future career prospects.
					</div>
				</div></a>
			<% } %>
			<% if(session.getAttribute("USER_CATEGORY").equals("CEWS ADMIN") || session.getAttribute("USER_CATEGORY").equals("SUPER ADMIN") || session.getAttribute("USER_CATEGORY").equals("STUDENT") ){ %>
				<a href="cews/"><div class="panel panel-default cews-btn" style="max-height: 20.1%; float: right; overflow: hidden; display: inline-flex; margin-left: auto; margin-right: auto;">
					<div style="float: left; max-width: 35%;">
						<img src="res/CEWS.png" style="max-width: 100%; height: auto;">
					</div><div class="description">
						A one stop point that offers personalised consultations and mentoring on academic and professional competencies. These consultations specifically focus on the areas that our clients need help with.
					</div>
				</div></a>
				<% } %>
			</div>
			<div class="container" style="padding: 0px;">
			<% if(session.getAttribute("USER_CATEGORY").equals("CHAL ADMIN")|| session.getAttribute("USER_CATEGORY").equals("SUPER ADMIN") ){ %>
			
				<a href="chal/"><div class="panel panel-default chal-btn" style="max-height: 20.1%; float: left; overflow: hidden; display: inline-flex; margin-left: auto; margin-right: auto;">
					<div style="float: left; max-width: 35%;">
						<img src="res/CHAL.png" style="max-width: 100%; height: auto;">
					</div><div class="description">
						The blended learning wing of CAPS organises events that bring in expertise from the professional industry that enhances the mixed group learning. These events could be attended by participants from different disciplines and varying levels of knowledge.
					</div>
				</div></a>
			<% } %>
			<% if(session.getAttribute("USER_CATEGORY").equals("CLASS ADMIN") || session.getAttribute("USER_CATEGORY").equals("SUPER ADMIN") ){ %>
				<a href="class/"><div class="panel panel-default class-btn" style="max-height: 20.1%; float: right; overflow: hidden; display: inline-flex; margin-left: auto; margin-right: auto;">
					<div style="float: left; max-width: 35%;">
						<img src="res/CLASS.png" style="max-width: 100%; height: auto;">
					</div><div class="description">
						Peer training sessions that offer real-time interactive training sessions by confident and able peers themselves on a classroom level aimed at offering a platform for students to share with their peers on campus, their skills and subject knowledge through a way of fun alternative learning.
					</div>
				</div></a>
				
				<% }
				if(session.getAttribute("USER_CATEGORY").equals("Faculty") )
				{ 
					response.sendRedirect("class/");
					
				}
			%>
			</div>
		</div>
		<% } %>
	</body>
	<% }catch(Exception e)
		{
			out.println(e);
		}
		
		%>
</html>