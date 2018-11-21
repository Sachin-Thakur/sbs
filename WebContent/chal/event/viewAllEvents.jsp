<html>
	<%@ page import="java.sql.*" %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	
	Connection con = (Connection) session.getAttribute("DB_CONNECTION");
	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="/sbs/js/bootstrap.js" type="text/javascript"></script>

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
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="text-align: center;">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>All Events</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
				Statement getEventsSTAT = con.createStatement();
				ResultSet getEventsRSET = getEventsSTAT.executeQuery("select e.topic, e.event_date, e.start_time, e.end_time, e.booked_on, c.name, e.venue, e.status from event e, contact c where e.id like '" + request.getParameter("wing") + "%' and e.id = c.event_id and c.role = 'Booker'");
				getEventsRSET.last();

				if(!(getEventsRSET.getRow() == 0)){
					getEventsRSET.beforeFirst();

			%>

			<table class="table table-bordered" style="white-space: nowrap;">

				<thead style="color: #ffffff">
					<td>Topic
					<td>Date
					<td>Start Time
					<td>End Time
					<td>Booked On
					<td>Booked By
					<td>Venue
					<td>Status
				</thead>

				<%
				
				int cols = getEventsRSET.getMetaData().getColumnCount();

				while(getEventsRSET.next()){
					out.println("<tr style=\"color: white\">");
					out.println("<td>" + getEventsRSET.getString(1) + "</td>");
					out.println("<td>" + getEventsRSET.getString(2) + "</td>");
					out.println("<td>" + getEventsRSET.getString(3) + "</td>");
					out.println("<td>" + getEventsRSET.getString(4) + "</td>");
					out.println("<td>" + getEventsRSET.getString(5) + "</td>");
					out.println("<td>" + getEventsRSET.getString(6) + "</td>");
					out.println("<td>" + getEventsRSET.getString(7) + "</td>");
					String str = getEventsRSET.getString(8);
					String stat = str.equals("cancelled")?"Session Cancelled":str.equals("confirmed")?"Session Confirmed":str.equals("pending_approval")?"Session Pending Approval":"Session Completed";

					out.println("<td>" + stat + "</td>");
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