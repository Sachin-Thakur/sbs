<html>
	<%@ page import="java.sql.*" %>
	<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	 
	     java.sql.Statement getEventsSTAT =null;
	     ResultSet getEventsRSET =null;
	     
     %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	
	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		

		<jQuery library >
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
				<strong>Choose Whether to Confirm or Reject Session Request</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
				getEventsSTAT = connection.createStatement();
				 getEventsRSET = getEventsSTAT.executeQuery("select id, topic_name, event_date, start_time, end_time, booked_on, booker_name,booker_phone venue from class_events where  event_date>now() and status = 1");
				getEventsRSET.last();

				if(!(getEventsRSET.getRow() == 0)){
					getEventsRSET.beforeFirst();

			%>

			<table class="table table-bordered" style="white-space: nowrap;">

				<thead style="color: #ffffff">
					<td>Topic</td>
					<td>Date</td>
					<td>Start Time</td>
					<td>End Time</td>
					<td>Venue</td>
					<td>Booked By</td>
					<td>Booker Phone Number</td>
					<td colspan="2">Confirmation</td>
				</thead>

				<%
				
				int cols = getEventsRSET.getMetaData().getColumnCount();

				while(getEventsRSET.next()){ %>
					<tr style="color: white">
					<td><%=getEventsRSET.getString(2)%></td>
					<td><%=getEventsRSET.getString(3) %></td>
					<td><%=getEventsRSET.getString(4) %></td>
					<td><%=getEventsRSET.getString(5) %></td>
					<td><%=getEventsRSET.getString(6) %></td>
					<td><%=getEventsRSET.getString(7) %></td>
					<td><%=getEventsRSET.getString(8) %></td>
					<td><button class="btn btn-success" onclick="feedValue('eventId', <%=getEventsRSET.getString(1) %>);feedVal('status', 'c', 'event');"><strong>CONFIRM</strong></button></td>
					<td><button class="btn btn-danger" onclick="feedValue('eventId', <%=getEventsRSET.getString(1) %>);feedVal('status', 'r', 'event');"><strong>REJECT</strong></button></td>
					</tr>
				<%}
				
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

<form id="event" action="confirmation.jsp" method="post" autocomplete="off">
	<input type="hidden" id="eventId" name="eventId">
	<input type="hidden" id="status" name="status">
</form>