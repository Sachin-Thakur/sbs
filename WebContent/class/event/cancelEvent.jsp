<html>
	<%@ page import="java.sql.*" %>
	<%@page import="com.daniel.util.DbUtil"%>
	<%@ page import="com.daniel.util.DbUtil.*" %>
	<% Connection connection=DbUtil.getConnection(); %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	%>
	 <%! 
     java.sql.Statement getClassEventsSTAT =null;
     ResultSet getClassEventsRSET =null;
 	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="/sbs/js/bootstrap.js" type="text/javascript"></script>
		<script src="/sbs/js/home.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

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
						<%
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("USER_NAME") + "</li>   ");
						%>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="text-align: center; min-width: 100%;">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Which Session to Cancel</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
				 getClassEventsSTAT = connection.createStatement();
				 getClassEventsRSET = getClassEventsSTAT.executeQuery("select id, topic_name, event_date,start_time,end_time, booked_on, booker_name,venue from class_events where booker_name = '" + session.getAttribute("USER_NAME") + "' and event_date >= (now() + INTERVAL 3 DAY) and status =1");

				getClassEventsRSET.last();

				if(!(getClassEventsRSET.getRow() == 0)){
					getClassEventsRSET.beforeFirst();

			%>

			<table class="table table-bordered" style="white-space: nowrap;">

				<thead style="color: #ffffff">
				<tr>
					<td>Topic</td>
					<td>Date
					<td>Start Time
					<td>End Time
					<td>Booked On
					<td>Booked By
					<td>Venue
					<td>Cancellation
					</tr>
				</thead>

				<%
				
				int cols = getClassEventsRSET.getMetaData().getColumnCount();

				while(getClassEventsRSET.next()){
					out.println("<tr style=\"color: white\">");
					out.println("<td>" + getClassEventsRSET.getString(2) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(3) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(4) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(5) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(6) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(7) + "</td>");
					out.println("<td>" + getClassEventsRSET.getString(8) + "</td>");
					out.println("<td><button class=\"btn btn-danger\" onclick=\"feedVal('eventId', '" + getClassEventsRSET.getString(1) + "','event');\"><strong>CANCEL</strong></button></td>");
					out.println("</tr>");
				}
				
				%>
				
			</table>
			<%
				}else{
					out.println("<strong style=\"color: white;\">No data to display</strong>");
				}
			%>
			</div>
		</div>

	</body>
</html>

<form id="event" action="cancellation.jsp" method="post" autocomplete="off">
	<input type="hidden" id="eventId" name="eventId">
</form>