<html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%@  page import="java.util.Date" %>
	<%@ page import= "java.util.Calendar" %>
	<% Connection connection=DbUtil.getConnection(); %>
	<%!
	java.sql.Statement getEventsSTAT =null;
    ResultSet getEventsRSET =null;
		
	%>
	
	
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	
		%>
		<%try{ %>

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
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
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
		
		<div class="container" style="text-align: center;">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>All Events</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
				 getEventsSTAT = connection.createStatement();
				 getEventsRSET = getEventsSTAT.executeQuery("select topic_name, event_date, start_time, end_time, booked_on, booker_name, venue, status from class_events  ");
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
					String status = str.equals("cancelled")?"Session Cancelled":str.equals("confirmed")?"Session Confirmed":str.equals("pending")?"Session Pending Approval":str.equals("rejected")?"Rejected By the Admin":str.equals("volunteer_assigned")?"Volunteer Assigned":"Session Completed";

					out.println("<td>" + status + "</td>");
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

<%} catch (SQLException se) {
    se.printStackTrace();
}

catch (NullPointerException e) {
    e.printStackTrace();
    
} catch (Exception e) {
    e.printStackTrace();
}
finally {
   
    
    if (getEventsSTAT != null)
        try {
        	getEventsSTAT.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    
    if (getEventsRSET != null)
        try {
        	getEventsRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        }%>
