<html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@  page import="java.util.Date" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
Connection connection=DbUtil.getConnection();
%>
<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	else if(session.getAttribute("USER_CATEGORY") == "SUPER ADMIN"){
		response.sendRedirect("/sbs/class/index.jsp");
	}
	%>
	<%! 
     java.sql.Statement getTopicDataSTAT =null;
     ResultSet getTopicDataRSET =null;
     java.sql.Statement getBookedEventSTAT =null;
     ResultSet getBookedEventRSET =null;
     java.sql.Statement getExceptionSTAT =null;
     ResultSet getExceptionRSET =null;
     java.sql.Statement getDeptQuotaSTAT =null;
     ResultSet getDeptQuotaRSET =null;
     Calendar eventStartDate,curDate,curDate1 ;
     String id;
     Date newDate ;
     %>
	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
		<script>
		  webshims.setOptions('waitReady', false);
		  webshims.setOptions('forms-ext', {types: 'date'});
		  webshims.polyfill('forms forms-ext');
		</script>

		<!-- Latest compiled JavaScript -->
		<script src="/sbs/js/bootstrap.js" type="text/javascript"></script>
		<script src="/sbs/js/home.js" type="text/javascript"></script>
		
		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Learning and Sharing Sessions - Class Session</title>
	</head>
	<style>
	table,th,td
	{
	border:2px dotted black;
	}
	button
	{
	width:140px;
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
						
						<li class="navbar-inverse navbar-text">Welcome <%= session.getAttribute("USER_NAME") %></li>
						
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Session Date and Time</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
  
<%

id = request.getParameter("topicId");

eventStartDate= Calendar.getInstance();curDate = Calendar.getInstance(); curDate1 =new GregorianCalendar();
newDate = new Date();


try{%>
<%	

getTopicDataSTAT = connection.createStatement();  
getTopicDataRSET = getTopicDataSTAT.executeQuery("select * from cews_topics where id="+id);
getExceptionSTAT = connection.createStatement();
getExceptionRSET =   getExceptionSTAT.executeQuery("select  exception_date,exception_start_time from cews_exceptions ");
getDeptQuotaSTAT = connection.createStatement();
getDeptQuotaRSET = getDeptQuotaSTAT.executeQuery("select * from department");



 getTopicDataRSET.next();
 Date d1  = getTopicDataRSET.getDate(6);
 out.println(d1);
 eventStartDate.setTime(d1);
 eventStartDate.add(Calendar.DAY_OF_MONTH, 3);
 if(eventStartDate.before(curDate1))
{
	 eventStartDate = curDate1;
	 eventStartDate.add(Calendar.DAY_OF_MONTH, 3);
	 curDate.setTime(newDate);
}
 else{
		curDate.setTime(d1);
		
	}
 curDate.add(Calendar.DATE, 11);

List<TimeSlot> eventExceptSlots = new ArrayList<TimeSlot>();
List<TimeSlot> offDayExceptSlots = new ArrayList<TimeSlot>();
List<TimeSlot> workingSlots = new ArrayList<TimeSlot>();


	

while(getExceptionRSET.next())
{
	TimeSlot sl = new TimeSlot( Integer.parseInt(getExceptionRSET.getString(1).substring(0, 4)),
		 Integer.parseInt(getExceptionRSET.getString(1).substring(5, 7)),
		 Integer.parseInt(getExceptionRSET.getString(1).substring(8)),
		 Integer.parseInt(getExceptionRSET.getString(2).substring(0, 2)),
		 Integer.parseInt(getExceptionRSET.getString(2).substring(3, 5)));
	offDayExceptSlots.add(sl);
	
}


getExceptionRSET.close();


while(eventStartDate.before(curDate)){
	
	if(eventStartDate.get(Calendar.DAY_OF_WEEK) != 1){
		for(int i=9; i<=17;i ++)
		{	
			
				TimeSlot sl = new TimeSlot(eventStartDate.get(Calendar.YEAR),
					(eventStartDate.get(Calendar.MONTH) + 1),
					eventStartDate.get(Calendar.DAY_OF_MONTH),
					i,0);
				workingSlots.add(sl);
				
		}
	}
	eventStartDate.add(Calendar.DAY_OF_MONTH, 1);
	
}


for(int i=0; i<workingSlots.size(); i++){
	if(workingSlots.get(i).getDayOfWeek() == 7 && workingSlots.get(i).getHour()>12){
		workingSlots.get(i).setAvailability(false,0);
	}else{
		for(int j=0; j<offDayExceptSlots.size(); j ++){
			if(workingSlots.get(i).toString().equals(offDayExceptSlots.get(j).toString())){
				System.out.println("Working:"+workingSlots.get(i).toString());
				System.out.println("\nOff DAy:"+offDayExceptSlots.get(j).toString());
				
				workingSlots.get(i).setAvailability(false,0);// 0 is passed for offdy color
				
				break;
			}
		}
	
		}
}

%>
		<h1>Topic Name:<%= getTopicDataRSET.getString(2) %></h1>
		<h1>Topic Details:<%=getTopicDataRSET.getString(3) %></h1>
<table>
					<thead>
					<%
						String prevDate = "";
						for(int i=0; i<workingSlots.size(); i++){
							if(!prevDate.equals(workingSlots.get(i).getShortDate())){
								out.print("<td><span class=\"btn");
								out.print(" btn-default\">" + workingSlots.get(i).getShortDate());
								prevDate = workingSlots.get(i).getShortDate();
								out.println("</span></td>");
							}
						}
					%>
					</thead>
					<%
						for(int i=9; i<17; i ++){
							out.println("<tr>");
							for(int j=0; j<workingSlots.size(); j ++){
									if(workingSlots.get(j).getHour() == i){
										out.println(workingSlots.get(j).getSlot(1));
								}
							}
							out.println("</tr>");
						}
					%>
				</table> 
				</div>
			<a name="sessionDetails" id="sessionDetails"></a>
		</div>
			<div class="container collapse" id="formFill" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Session Details</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center;">
				<form id="sessionForm" name="sessionForm" class="form-inline" action="bookingProcess.jsp" method="post" style="margin-left: auto; margin-right: auto; text-align: center;" autocomplete="off">

					 <div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="facultyName" id="facultyName"  value = "<%= session.getAttribute("USER_NAME") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Name" oninput="allLetter('facultyName', 'sessionForm');"></input>

						<input type="text" name="facultyPhone" id="facultyPhone" value = "<%= session.getAttribute("CONTACT_NUMBER") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Phone Number" oninput="allNumeric('facultyPhone', 'sessionForm');" required></input>

						<input type="text" name="facultyEmail" id="facultyEmail" value ="<%= session.getAttribute("EMAIL_ID") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Email ID" oninput="emailVal('facultyEmail', 'sessionForm');" required></input>
					</div>

					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">

				<div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="forClass" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class"></input>
						
						<input type="text" name="numberOfParticipants" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Number OF Participants" oninput="allNumeric('numberOfParticipants', 'sessionForm');"></input>

						 <select class="form-control" name="dept" id="dept" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this)">
							<option style="color: #000;" disabled selected>-----Select Department-----</option>
							<%while(getDeptQuotaRSET.next()){
									if(getDeptQuotaRSET.getInt(4)<getDeptQuotaRSET.getInt(3)){%>
										<option style="color: #000" value="<%=getDeptQuotaRSET.getString(1)%>"><%=getDeptQuotaRSET.getString(2)%></option>
									<%}
								}	%>
							
						</select>

						<input type="text" name="venue" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Venue for the Session" required></input>
					</div>
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
					<div class="form-group" style="margin-left: auto; margin-right: auto; margin-top: 15px; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="classRepName" id="classRepName" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Name" oninput="allLetter('classRepName', 'sessionForm');" required></input>

						<input type="text" name="classRepPhone" id="classRepPhone" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Phone Number" oninput="allNumeric('classRepPhone', 'sessionForm');" required></input>

						<input type="text" name="classRepEmail" id="classRepEmail" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Email" oninput="emailVal('classRepEmail', 'sessionForm');" required></input>
						
						<input type="text" name="classEmail" id="classEmail" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class  Email" oninput="emailVal('classEmail', 'sessionForm');" required></input>

					</div>
					
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
				
	<% for(int k = 0;k< 1;k++){  %>
	
					<div class="form-group" style="margin-left: auto; margin-right: auto; margin-top: 15px; border-bottom-color: #cc982d; border-bottom: 2px;">
					<%=(k+1)%>
	 				<input type="text" name="facultyInchargeName<%=k%>" id="facultyInchargeName<%=k%>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Incharge Name" oninput="allLetter('facultyInchargeName<%=k%>', 'sessionForm');" required></input>

						<input type="text" name="facultyInchargePhone<%=k%>" id="facultyInchargePhone<%=k%>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Incharge Phone Number" oninput="allNumeric('facultyInchargePhone<%=k%>', 'sessionForm');" required></input>

						<input type="text" name="facultyInchargeEmail<%=k%>" id="facultyInchargeEmail<%=k%>" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Incharge Email" oninput="emailVal('facultyInchargeEmail<%=k%>', 'sessionForm');" required></input>
						
							
					</div>
<%} %>
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
 
					<div class="form-group" style="margin-left: auto; margin-right: 15px;">
						<input class="btn btn-default" name="submitButton" type="submit" id="submitButton" value="Book Session" style="font-weight: bold; background-color: #223260; color: #cc982d; border: 0px;"> <br>
						<small id="submitHelp" class="help-text" style="padding-top: 5px;">
							
						</small>
					</div>

					<input type="hidden" id="eventDate" name="eventDate">
					<input type="hidden" id="eventTime" name="eventTime">
					<input type="hidden" id="topicId" name="topicId" value =" <%= getTopicDataRSET.getString(1) %>" >
					<input type="hidden" id="topicName" name="topicName" value =" <%= getTopicDataRSET.getString(2) %>" >
					<input type="hidden" id="topicDesc" name="topicDesc" value =" <%= getTopicDataRSET.getString(3) %>" >
					
				</form>
			</div>
		</div>
		<script>
		$("button").click(function() {
		    $('html, body').animate({
		        scrollTop: $("#sessionDetails").offset().top
		    }, 1800, 'swing');

		    $("body").css({"overflow":"visible"});
		});

		//$(window).bind('mousewheel', function(event){ return false});
		</script>
	</body>
</html>
		
<%
} catch (SQLException se) {
    se.printStackTrace();
}

catch (NullPointerException e) {
    e.printStackTrace();
    
} catch (Exception e) {
    e.printStackTrace();
} finally {
   
    
    if (getBookedEventSTAT != null)
        try {
        	getBookedEventSTAT.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    
    if (getBookedEventRSET != null)
        try {
        	getBookedEventRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    if (getTopicDataSTAT != null)
        try {
        	getTopicDataSTAT.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

 
    if (getTopicDataRSET != null)
        try {
        	getTopicDataRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    
    
    if (getExceptionSTAT != null)
        try {
        	getExceptionSTAT.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    
    if (getExceptionRSET != null)
        try {
        	getExceptionRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
   
}
%>