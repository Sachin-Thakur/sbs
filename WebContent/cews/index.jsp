<html>
	<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>

<% session.setAttribute("Wing", "class"); %>
	   

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->
		<base target="_parent"></base>
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
				<a href="https://christuniversity.in/caps/"><img src="../res/CAPS Logo White.png" style="float: left; width: 20%; margin-top: 2.25%; margin-bottom: 2.5%; margin-left: 15px; margin-right: 15px;"></a>
				<a href="https://christuniversity.in/"><img src="../res/Christ University Logo White-Gold.png" style="float: right; width: 15%; margin-top: 1%; margin-bottom: 1%; margin-left: 15px; margin-right: 10px;"></a>
			</div>

			<div class="navbar navbar-inverse" style="border-radius: 0px; border-top: 0px;background:#303f9e">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="/sbs/index.jsp" style="color:white">Session Booking System</a>
					</div>
					
					<ul class="nav navbar-nav navbar-right" style="color:white">
						<%
						out.println("<li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("USER_NAME") + "</li>   ");
						%>
						<li><a href="../logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="text-align: center;">
			<div class="panel panel-default" style="background-color: rgba(155, 155, 155, .25); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 15px; border-top-left-radius: 15px; margin-right: auto; margin-left: auto;">

			<!-- checking the session for the   faculty-->
	  <%
			if(session.getAttribute("ROLE").equals("SUPER ADMIN") || session.getAttribute("ROLE").equals("CEWS ADMIN")){
			
		%> 
				
				<button type="submit" class="btn" form="viewAllSessionAdmin" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">View All Sessions</button>
				
				<button type="submit" class="btn" form="viewRequestedSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">View Requested Sessions</button>

				<button type="submit" class="btn" form="viewConfirmedSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">View Confirmed Sessions</button>

				<button type="submit" class="btn" form="assignVolunteer" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Assign Volunteer</button>

							

				
				<br>

				<button type="submit" class="btn" form="addOffDay" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Add an Off Day or Hour</button>

				<button type="submit" class="btn" form="remOffDay" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Delete an Off Day or Hour</button>

				<br>

				<button type="submit" class="btn" form="newTopic" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Add Topic</button>

				<button type="submit" class="btn" form="removeTopics" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Remove Topics</button>

				<button type="submit" class="btn" form="updateTopics" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Update Topic Details</button>
				
				<br>

				<button type="submit" class="btn" form="changeQuota" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Change Department Quotas</button>

				<button type="submit" class="btn" form="addDept" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Add Department</button>
			
				

				

			 	<%
				}
				else if(session.getAttribute("ROLE").equals("STUDENT")){
					%>
					
					<button type="submit" class="btn" form="bookSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Book a Session</button>
					
					<button type="submit" class="btn" form="cancelSession" style="background-color: #223260; color: #cc928d; margin-right: 15px; margin-bottom: 15px;">Cancel a Session</button>
					<%}
				else{
						response.sendRedirect("../");
					}
				%>
  


			</div>
		</div>

	</body>
</html>

<form id="bookSession" action="event/newEvent.jsp"  method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>
<form id="assignVolunteer" action="event/assignVolunteer.jsp"  method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="viewAllSession" action="event/viewAllEvents.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="viewAllSessionAdmin" action="event/viewAllEventsAdmin.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="viewRequestedSession" action="event/viewRequestedEvents.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="viewConfirmedSession" action="event/viewConfirmedEvents.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="cancelSession" action="event/cancelEvent.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="cancelSessionAdmin" action="event/cancelEventAdmin.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="modifySessionAdmin" action="event/modifyEventAdmin.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="addOffDay" action="offDay/selectOffDay.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="remOffDay" action="offDay/removeOffDay.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="newTopic" action="topic/newTopic.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="removeTopics" action="topic/removeTopic.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>


<form id="updateTopics" action="topic/showTopic.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="changeQuota" action="department/changeQuota.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

<form id="addDept" action="department/newDept.jsp" method="post" autocomplete="off">
	<input type="hidden" name="wing" value="class">
</form>

