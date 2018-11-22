<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="event.TimeSlot" %>
		<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	 
	     java.sql.Statement removeSTAT =null;
	     ResultSet removeRSET =null;
	     
	     java.sql.Statement getSTAT =null;
	     ResultSet getRSET =null;
     %>
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
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
		<title>CAPS Learning and Sharing Sessions - Class Session</title>
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
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Session Details</strong>
				<button class="btn btn-default" style="float: right;" data-toggle="modal" data-target="#tip"><strong>?</strong></button>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				
				<%
					removeSTAT = connection.createStatement();
					getSTAT = connection.createStatement();

					 getRSET = getSTAT.executeQuery("select * from class_exceptions ");

					List<TimeSlot> offSlots = new ArrayList<TimeSlot>();

					while(getRSET.next()){
						TimeSlot t = new TimeSlot(Integer.parseInt(getRSET.getString(1).substring(0, 4)),
							Integer.parseInt(getRSET.getString(1).substring(5, 7)),
							Integer.parseInt(getRSET.getString(1).substring(8)),
							Integer.parseInt(getRSET.getString(2).substring(0, 2)),
							Integer.parseInt(getRSET.getString(2).substring(3, 5)));

						offSlots.add(t);
					}

					if(offSlots.size()>0){
				%>
				<table class="table" style="white-space: nowrap; max-width: 30%; margin-left: auto; margin-right: auto;">
					<thead>
						<td style="color: ffffff">Date</td>
						<td style="color: ffffff">Time Slot</td>
					</thead>
					<%
						String prevDate="";
						for(int i=0; i<offSlots.size(); i++){
							if(!prevDate.equals(offSlots.get(i).getShortDate())){
								out.println("<tr style=\"margin-bottom: 15px; border-top: 10px;\">\n<td style=\"border-top: 0px;\"><button class=\"btn btn-primary\" onclick=\"feedDateTime('" + offSlots.get(i).getNumDate() + "', 'all day', 'date'); document.getElementById('date').submit();\">" + offSlots.get(i).getShortDate());
								prevDate = offSlots.get(i).getShortDate();
							}else{
								out.println("<td style=\"border-top: 15px;\"></td>");
							}
							out.println("<td style=\"border-top: 0px;\"><button class=\"btn btn-success\"onclick=\"feedDateTime('" + offSlots.get(i).getNumDate() + "', '" + offSlots.get(i).getSlotText(1) + "', 'date'); document.getElementById('date').submit();\">"+offSlots.get(i).getSlotText(1) + "\n</tr>");
			
						}
					%>
				</table>
				<%
					}else{
						out.println("<strong>No data to display</strong>");
					}
				%>
			</div>
		</div>
	</body>
	<form id="date" action="remOffDay.jsp" method="post">
		<input type="hidden" id="eventDate" name="eventDate">
		<input type="hidden" id="eventTime" name="eventTime">
	</form>
</html>
<div id="tip" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color: #223260; color: #fff;">
      <div class="modal-body">
        <p>Click on a Date to Remove all off Time Slots</p><br>
        <p>Click on a Time Slot to Remove it as Off Hour</p>
      </div>
      <div class="modal-footer" style="border-top-color: #cc982d;">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>