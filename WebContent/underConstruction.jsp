<html>
	<%@ page import="java.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
	<%
	
	Connection con;

	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("index.jsp");
	}

	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/home.css">
		<link rel="stylesheet" href="css/w3.css">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="js/bootstrap.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Session Booking System - Index</title>
	</head>
	
	<body style="background-image: url(res/back.JPG); background-size: cover;">
		
		<nav>

			<div class="navbar navbar-inverse" style="margin-bottom: 0; border-radius: 0px; border-bottom: 0px;background:#303f9e">
				<a href="https://christuniversity.in/caps/"><img src="res/CAPS Logo White.png" style="float: left; width: 20%; margin-top: 2.25%; margin-bottom: 2.5%; margin-left: 15px; margin-right: 15px;"></a>
				<a href="https://christuniversity.in/"><img src="res/logo_new_christ.jpg" style="float: right; width: 15%; margin-top: 1%; margin-bottom: 1%; margin-left: 15px; margin-right: 10px;"></a>
			</div>

			<div class="navbar navbar-inverse" style="border-radius: 0px; border-top: 0px;background:#303f9e">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="index.jsp">Session Booking System</a>
					</div>
					
					<ul class="nav navbar-nav navbar-right" style="color:white">
						<%
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("STUDENT_NAME") + "</li>   ");
						%>
						<li><a href="logout.jsp">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container">
			<div class="panel panel-default" style="text-align: center; padding-top: 15px; padding-bottom: 15px; background-color: #223260; color: #cc982d; border: 0px;">
				<strong>This page is under construction.</strong>
			</div>
		</div>
	</body>
</html>