<html>
	<%@ page import="java.sql.*" %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("../index.jsp");
	}
	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/home.css">
		<link rel="stylesheet" href="../css/w3.css">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="../js/bootstrap.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Learning and Sharing Sessions - Index</title>
	</head>
	
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
						<%
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("STUDENT_NAME") + "</li>   ");
						%>
						<li><a href="../logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="text-align: center;">
			<div class="panel panel-default" style="background-color: rgba(155, 155, 155, .25); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 15px; border-top-left-radius: 15px; margin-right: auto; margin-left: auto;">

				<button type="submit" class="btn" form="bookSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">New Event</button>

				<button type="submit" class="btn" form="cancelSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Cancel an Event</button>

				<button type="submit" class="btn" form="viewAllSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">View All Events</button>

				<button type="submit" class="btn" form="viewConfirmedSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">View Confirmed Sessions</button>

				<br>

				<button type="submit" class="btn" form="listEvent" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Register for an Event</button>

			</div>
		</div>

	</body>
</html>

<form id="bookSession" action="event/newEvent.jsp" method="post">
	<input type="hidden" name="wing" value="chal">
</form>

<form id="viewAllSession" action="event/viewAllEvents.jsp" method="post">
	<input type="hidden" name="wing" value="chal">
</form>

<form id="viewConfirmedSession" action="event/viewConfirmedEvents.jsp" method="post">
	<input type="hidden" name="wing" value="chal">
</form>

<form id="cancelSession" action="event/cancelEvent.jsp" method="post">
	<input type="hidden" name="wing" value="chal">
</form>

<form id="listEvent" action="register/listEvent.jsp" method="post">
	<input type="hidden" name="wing" value="chal">
</form>