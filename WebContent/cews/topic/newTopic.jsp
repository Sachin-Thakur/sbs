<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") == "Student"){
		response.sendRedirect("/sbs/class/index.jsp");
	}

	
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
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("USER_NAME") + "</li>   ");
						%>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Topic Details</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				<form class="form-inline" action="addTopic.jsp" method="post" style="margin-left: auto; margin-right: auto; text-align: center;">

					<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="topicName" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Enter Topic Name" required></input>
						
						<input type = "time" name="startTime" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Enter Starting Time" required></input>
						
						<input type = "time" name="endTime" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Enter Ending Time" required></input>
						
						<input type= "Date" name="topicDate" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;"  required ></input> -->
						
						<input type= "number" name="maxParticipants" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder ="Maximum Participants" required ></input>
						

						 <br>

						<textarea cols="100" rows="5" name="topicDesc" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Enter Topic Description" required></textarea>


						<br><input type = "checkbox" name = "DAY" Value = "MONDAY">Monday<br>
						<input type = "checkbox" name = "DAY" Value = "TUESDAY">Tuesday<br>
						<input type = "checkbox" name = "DAY" Value = "WEDNESDAY">Wednesday<br>
						<input type = "checkbox" name = "DAY" Value = "THURSDAY">Thursday<br>
						<input type = "checkbox" name = "DAY" Value = "FRIDAY">Friday<br>
						<input type = "checkbox" name = "DAY" Value = "SATURDAY">Saturday<br>
							
							<textarea cols="100" rows="5" name="topicPre" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Enter The Prerequistes Material" required></textarea>
					</div>

					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">

					<div class="form-group" style="margin-left: auto; margin-right: 15px;">
						<input class="btn btn-default" name="submitButton" type="submit" value="Add Topic" style="background-color: #223260; color: #cc982d; border: 0px;">
					</div>
				</form>
			</div>
		</div>
	</body>
</html>