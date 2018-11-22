<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="event.TimeSlot" %>
<%@page import="com.daniel.util.DbUtil"%>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") == "Student"){
		response.sendRedirect("/sbs/class/index.jsp");
	}

	Connection con = (Connection) session.getAttribute("DB_CONNECTION");

	session.setAttribute("wing", request.getParameter("wing"));
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
		<script src="/sbs/js/home.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Learning and Sharing Sessions - Class Session</title>
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
<<<<<<< HEAD
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("STUDENT_NAME") + "</li>   ");
=======
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("USER_NAME") + "</li>   ");
>>>>>>> branch 'master' of https://github.com/Sachin-Thakur/sbs.git
						%>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Change Department Quotas</strong>
				
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				<form id="sessionForm" name="sessionForm" class="form-inline" action="change.jsp" method="post" style="margin-left: auto; margin-right: auto; text-align: center;">
					<div class="form-group" style="margin-left: auto; margin-right: auto;">
						<select class="form-control" name="dept" id="dept" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this); document.getElementById('quota').selectedIndex = document.getElementById('dept').selectedIndex; document.getElementById('used').selectedIndex = document.getElementById('dept').selectedIndex;">
							<option style="color: #000;" selected>-----Select Department-----</option>
							<%
								Statement getDeptQuotaSTAT = con.createStatement();
								ResultSet getDeptQuotaRSET = getDeptQuotaSTAT.executeQuery("select * from department");

								while(getDeptQuotaRSET.next()){
									out.println("<option style=\"color: #000\">"+getDeptQuotaRSET.getString(1)+"</option>");
								}

								getDeptQuotaRSET.beforeFirst();
							%>
						</select>

						<select class="form-control" name="quota" id="quota" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this)" disabled>
							<option style="color: #000;" selected>-----Department Quota-----</option>
							<%
								while(getDeptQuotaRSET.next()){
									out.println("<option style=\"color: #000\">"+getDeptQuotaRSET.getString(2)+"</option>");
								}

								getDeptQuotaRSET.beforeFirst();
							%>
						</select>

						<select class="form-control" name="used" id="used" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this)" disabled>
							<option style="color: #000;" selected>-----Used From Quota-----</option>
							<%
								while(getDeptQuotaRSET.next()){
									out.println("<option style=\"color: #000\">"+getDeptQuotaRSET.getString(3)+"</option>");
								}

								getDeptQuotaRSET.close();
							%>
						</select>
					</div>
					<br>
					<div class="form-group" style="margin-left: auto; margin-right: auto;">
						<input type="text" name="newQuota" id="newQuota" class="form-control" style="min-width: 70%; margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Enter New Department Quota" oninput="allNumeric('newQuota', 'sessionForm');"></input>

						<br>

						<input class="btn btn-default" name="submitButton" type="submit" id="submitButton" value="Change Quota" style="margin-top: 15px; font-weight: bold; background-color: #223260; color: #cc982d; border: 0px;">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>