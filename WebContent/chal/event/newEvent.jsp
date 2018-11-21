<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") == "Student"){
		response.sendRedirect("/sbs/cews/index.jsp");
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
		<link rel="stylesheet" href="/sbs/css/pikaday.css">
		<script src="/sbs/js/moment.js"></script>
		<script src="/sbs/js/pikaday.js"></script>
		<script>
			var timepicker = new Pikaday({
				field: document.getElementById('datetimepicker'),
				firstDay: 1,
				minDate: new Date(2016, 0, 1),
				maxDate: new Date(2100, 12, 31),
				yearRange: [2016,2100],
				showTime: true,
				autoClose: false,
				use24hour: false,
				format: 'MMM Do YYYY, h:mm a'
			});

			function changeAmt(var cmbName){
				var cmb = document.getElementById(cmbName);
				var amtTF = document.getElementById(amt);

				if(cmbName.selectedIndex == 1){
					amtTF = 0.0;
					amtTF.value = 0.0;
				}
			}
		</script>

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
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("STUDENT_NAME") + "</li>   ");
						%>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Session Details</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center;">
				<form id="sessionForm" class="form-inline" action="createEvent.jsp" method="post" style="margin-left: auto; margin-right: auto; text-align: center;">

					<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="topicName" id="topicName" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Event Topic" required></input>

						<br>

						<textarea cols="100" rows="5" name="topicDesc" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Enter Topic Description" required></textarea>
					</div>

					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">

					<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<label for="eventDate">Date: </label>
						
						<%
						Statement getSemDatesSTAT = con.createStatement();
						ResultSet getSemDatesRSET = getSemDatesSTAT.executeQuery("select * from sem_dates");

						getSemDatesRSET.next();
						String semBeg = getSemDatesRSET.getString(2);
						getSemDatesRSET.next();
						String semEnd = getSemDatesRSET.getString(2);
						getSemDatesRSET.close();
						
						out.println("<input type=\"date\" name=\"eventDate\" class=\"form-control\" id=\"eventDate\" style=\" margin-right: 25px; background-color: rgba(0, 0, 0, 0); color: #aaa;\" max=\"" + semEnd + "\" min=\"" + semBeg + "\" ></input>");
						%>
						<label style="padding-top: 50px">Time: </label>


						<input type="time" name="eventTimeFrom" class="form-control" id="eventTimeFrom" style="background-color: rgba(0, 0, 0, 0); color: #fff;" required></input>

						<small id="topicHelp" class="help-text"  style="padding-top: 50px">
							to
						</small>

						<input type="time" name="eventTimeTo" class="form-control" id="eventTimeTo" style="margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" required></input>
					</div>

					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">

					<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="venue" class="form-control" style="margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Venue for the Session" required></input>
						<!--label style="margin-left: 20px;" for="maxPax">Maximum Participants: </label-->
						<input type="number" name="maxPax" id="maxPax" class="form-control" style="margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Maximum Participants" required></input>

						<br>

						<select class="form-control" name="eventType" id="eventType" style="text-align: center; margin-bottom: 5px; margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this);">
							<option style="color: #000;" disabled selected>-----Select Event Type-----</option>
							<option style="color: #000;" value="1">Free of cost</option>
							<option style="color: #000;" value="2">Paid</option>
						</select><br>

						<input type="number" name="amt" id="amt" class="form-control" style="margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Event Amount" required></input>
					</div>
					
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">

					<div class="form-group" style="margin-left: auto; margin-right: 15px;">
						<input class="btn btn-default" name="submitButton" type="submit" value="Book Session" style="font-weight: bold; background-color: #223260; color: #cc982d; border: 0px;"> <br>
						<small id="submitHelp" class="help-text" style="padding-top: 5px;">
							
						</small>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>