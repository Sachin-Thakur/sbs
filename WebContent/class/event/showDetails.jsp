<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%
Connection con=DbUtil.getConnection();
%>
<% session.setAttribute("Wing", "CLASS"); %>
	 <%!
	 	java.sql.Statement selectClassEventsIdSTAT =null;
	 	ResultSet selectClassEventsIdRSET=null;
	 	int id=0,dept_id,i=0,hours;
	 	int nofaculty;
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
	.label
	{
	font-size:1.25em;
	color:white;
	font-weight:lighter;
	float:left;
	padding-top:6%;
	}
	input[type="text"]
	{
	float:right;
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
		<%
		selectClassEventsIdSTAT=con.createStatement();
		selectClassEventsIdRSET=selectClassEventsIdSTAT.executeQuery("select id from class_events");
		while(selectClassEventsIdRSET.next())
		{
			id=selectClassEventsIdRSET.getInt("id");
		}
		selectClassEventsIdSTAT=con.createStatement();
		selectClassEventsIdRSET=selectClassEventsIdSTAT.executeQuery("select * from class_events where id='"+id+"'");
		while(selectClassEventsIdRSET.next())
		{
		%>
		<div class="container" style="text-align: center;">
			<div class="panel panel-header" style="	font-family:'Lilita One', cursive;margin-left:50%;transform:translate(-50%,0%);margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;min-width:70%">
			<strong>You Just Booked A Session With Caps!!
			<br>The details Entered By You Are<br></strong>
			</div>
			<div class="panel panel-default" style="font-family:'lilita one',cursive;background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; margin-right: auto; margin-left: auto;max-width:70%">
			<form  class="form-inline" style="margin-left: auto; margin-right: auto; text-align: center;" autocomplete="off">
			
			<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">
			<div class="label">Class</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" value="<%=selectClassEventsIdRSET.getString("class_name")%>" disabled>
			<br>
			<div class="label">Number Of Participants</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("max_participants")%>" disabled>
			<br>
			<div class="label">Class Representative Name</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("class_representative_name") %>" disabled>
			<br>
			<div class="label">Class Representative Phone</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("class_representative_phone")%>" disabled>
			<br>
			<div class="label">Class Representative Email</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("class_representative_email")%>" disabled>
			<br>
			<div class="label">Class Email Address</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("class_email")%>" disabled>
			<br>
			<% 
			dept_id=selectClassEventsIdRSET.getInt("dept_id");
			}
			%>
			<% 
			selectClassEventsIdSTAT=con.createStatement();
			selectClassEventsIdRSET=selectClassEventsIdSTAT.executeQuery("select dept from department where dept_id='"+dept_id+"'");
			while(selectClassEventsIdRSET.next())
			{
		%>
			<br>
			<div class="label">Department</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("dept") %>" disabled>
			<br>
			<%} %>
			<%		
			int j=1;
			selectClassEventsIdSTAT=con.createStatement();
			selectClassEventsIdRSET=selectClassEventsIdSTAT.executeQuery("select * from  classwing_class_incharge where class_events_id='"+id+"'");
			while(selectClassEventsIdRSET.next()) 
			{
			%>
			<br>
			<div class="label">Class Incharge Name (<%=j %>)</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("incharge_name") %>" disabled>
			<br>
			<div class="label">Class Incharge Phone (<%=j %>)</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("incharge_email") %>" disabled>
			<br>
			<div class="label">Class Incharge Email (<%=j %>)</div>
			<input type="text" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;"value="<%=selectClassEventsIdRSET.getString("incharge_phone") %>" disabled>
			<br>
			<%j++;
			}%>
			</div>
			</form>
			<span style="color:white;font-size:1em;font-weight:light">*Contact CAPS office to change the input details.</span>
			
	</div>
		</div>

	</body>
</html>
