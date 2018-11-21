<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%
Connection connection=DbUtil.getConnection();
%>
<% session.setAttribute("Wing", "CLASS"); %>
	 <%!
	 	java.sql.Statement selectClassEventsIdSTAT =null;
	 	ResultSet selectClassEventsIdRSET=null;
	 %>  

<head>
		
		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
		<link rel="stylesheet" href="http://jonthornton.github.io/jquery-timepicker/jquery.timepicker.css" type="text/css" />
		<!-- <jQuery library > -->
		<script src=" https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
		 
   	 <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   	 <script src="http://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js"></script>
   	 <script src="/sbs/js/bootstrap.js" type="text/javascript"></script>
		<script src="/sbs/js/home.js" type="text/javascript"></script>
		
		<title>CAPS Learning and Sharing Sessions - Index</title>
	</head>
	<style>
	body
	{
	font-family:'lilita one',cursive;
	}
	</style>	
	<body style="background-image: url(../res/otherback.jpg); background-size: cover;">
		
		<nav>

			<div class="navbar navbar-inverse" style="margin-bottom: 0; border-radius: 0px; border-bottom: 0px;background:#303f9e">
				<a href="https://christuniversity.in/caps/"><img src="/sbs/res/CAPS Logo White.png" style="float: left; width: 20%; margin-top: 2.25%; margin-bottom: 2.5%; margin-left: 15px; margin-right: 15px;"></a>
				<a href="https://christuniversity.in/"><img src="/sbs/res/logo_christ_new.jpg" style="float: right; width: 15%; margin-top: 1%; margin-bottom: 1%; margin-left: 15px; margin-right: 10px;"></a>
			</div>

			<div class="navbar navbar-inverse" style="border-radius: 0px; border-top: 0px;background:#303f9e">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="/sbs/index.jsp" style="color:white">Session Booking System</a>
					</div>
					
					<ul class="nav navbar-nav navbar-right" style="color:white">
						
						<li class="navbar-inverse navbar-text" style="background:#303f9e;color:white;">Welcome  <%= session.getAttribute("USER_NAME") %></li>
						
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		<div class="container" style="text-align: center;">
			<div class="panel panel-default" style="font-family:'lilita one',cursive;background-color: rgba(155, 155, 155, .25); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 15px; border-top-left-radius: 15px; margin-right: auto; margin-left: auto;">
			
			You Just Booked A Session With Caps!!
			<br>The details Entered By You Are:-
			
			<%
			selectClassEventsIdSTAT = connection.createStatement();
			
			selectClassEventsIdRSET = selectClassEventsIdSTAT.executeQuery("select topic_name,start_time,end_time,event_date,venue,booker_name,booker_email,booker_phone,class_representative_name,class_representative_email,class_representative_phone,class_email from class_events where id = "+request.getParameter("id"));
			selectClassEventsIdRSET.next();
			
		
			%>
		
			
	</div>
		</div>

	</body>
</html>
