<html>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@  page import="java.util.Date" %>
<%@ page import="event.TimeSlot" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
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
     SimpleDateFormat df = new SimpleDateFormat("HH:mm");
     String id,startTime,endTime,eventDate,date,startTimee,endTimee;
     int i,max,flag = 0,max1,j,flag1 = 0;
     long hours,diff; 
     Date time = null,time1  = null;
     
     
     %>
	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css?family=Passion+One" rel="stylesheet">

		<jQuery library>
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
	<title>CAPS Learning and Sharing Sessions - Class Session</title>
	</head>
	<style>
	body
	{
		overflow-y:scroll !important;
	}
	input,select,option
	{
	font-family:'lilita one',cursive;
	}
	#details_header
	{
    width: 100%;
    height: 45px;
    font-weight: bold;
    text-align: center;
    background: #223260;
    color: white;
	font-family: 'Passion One', cursive;;
    font-size: 36px;
    border-radius: 7px;
	}
	
	</style>
	<script>
	$(document).ready(function()
	{
	$("#classEmail,#classRepEmail,#facultyInchargeEmail").blur(function()
			{
			$(".errorsnackbar").removeAttr("id","animatesnackbar");
			if(document.activeElement !== this)
			{
			if($(this).val()!="")
			{
			var christemail=$(this).val();
			var i=0;
			var emailarray=[];
			emailarray=christemail.split("@");
			var length=emailarray.length;
			var partchrist;
			var flag=0;
			while(i!=length)
			{
				partchrist=emailarray[i];
				i++;
			}
			var splitemailchrist=[];
			splitemailchrist=partchrist.split(".");
			length=splitemailchrist.length;
			var splitemailpartchrist;
			i=0;
			while(i!=length)
			{
			splitemailpartchrist=splitemailchrist[i];
			splitemailpartchrist=splitemailpartchrist.toLowerCase();
			if(splitemailpartchrist=="christuniversity")
			{	
				if(i+1>=length)
				{
					flag=0;
					break;
				}
				else
				splitemailpartchrist=splitemailchrist[i+1]
				splitemailpartchrist=splitemailpartchrist.toLowerCase();
				if(splitemailpartchrist=="in")
				flag=1; 
				break;
			}
			else
				i++;
			}
				if(flag==1){
				alert("right");
				}
			else
				{
				alert("wrong");
				$(".errorsnackbar").html("Please only use your Christ Email Id!");
				$(".errorsnackbar").attr("id","animatesnackbar");
				$(this).val("");
				}
			}
			}
			});
	});
		function submit1()
		{
			var dept1;
			dept1 = document.getElementById("dept").value;
			
			if(dept1 == 0)
			{
				alert("Please select Department");
				return false;
			}
			if(confirm("Please Recheck All the details \n Press OK to confirm "))
			{
				document.getElementById("sessionForm").submit();
			} 
			else
			{
				return false;
			}
		}
		
	</script>
	
	<body style="background-image: url(../res/otherback.jpg); background-size: cover;">
		<%
		id = request.getParameter("topicId");
		eventDate  = request.getParameter("Date");
		startTime = request.getParameter("Start_Time");
		endTime = request.getParameter("End_Time");
		getTopicDataSTAT = connection.createStatement();  
		getTopicDataRSET = getTopicDataSTAT.executeQuery("select * from class_topics where id="+id);
		getBookedEventSTAT = connection.createStatement();
		getBookedEventRSET = getBookedEventSTAT.executeQuery("select event_date,start_time,end_time from class_events where class_topics_id = "+id +" and status in(1,3,6)" );
		getExceptionSTAT = connection.createStatement();
		getExceptionRSET =   getExceptionSTAT.executeQuery("select  exception_date,exception_start_time,exception_end_time from class_exceptions ");
		getDeptQuotaSTAT = connection.createStatement();
		getDeptQuotaRSET = getDeptQuotaSTAT.executeQuery("select * from department");
		getTopicDataRSET.next();
		hours =getTopicDataRSET.getInt(6);
		
		ArrayList<String> eventExceptSlots = new ArrayList<String>();
		ArrayList<String> eventExceptSlotsStartTime = new ArrayList<String>();
		ArrayList<String> eventExceptSlotsEndTime = new ArrayList<String>();
		
		time = df.parse(startTime);
		time1 = df.parse(endTime);
		
		diff = time1.getTime() - time.getTime();
		hours = diff / (60 * 1000) ;
	
		while(getBookedEventRSET.next()){
			
			 date =""+ getBookedEventRSET.getString(1).substring(0,4) + "-" +
					 getBookedEventRSET.getString(1).substring(5,7) + "-" +
					 getBookedEventRSET.getString(1).substring(8)+"";
			 startTimee = getBookedEventRSET.getString(2);
			 endTimee = getBookedEventRSET.getString(3);
			 eventExceptSlotsStartTime.add(startTimee); 
			 eventExceptSlotsEndTime.add(endTimee);
			eventExceptSlots.add(date);
		}
		getBookedEventRSET.close();
		
		while(getExceptionRSET.next())
		{
			date =""+ getExceptionRSET.getString(1).substring(0,4) + "-" +
					getExceptionRSET.getString(1).substring(5,7) + "-" +
					getExceptionRSET.getString(1).substring(8)+"";
			 startTimee = getExceptionRSET.getString(2);
			 endTimee = getExceptionRSET.getString(3);
			 eventExceptSlotsStartTime.add(startTimee); 
			 eventExceptSlotsEndTime.add(endTimee);
			eventExceptSlots.add(date);
			
		}
		
		getExceptionRSET.close();
		
		 
		max = eventExceptSlots.size();
		System.out.println(eventDate);
		getExceptionRSET =   getExceptionSTAT.executeQuery("select  count(exception_date) from class_exceptions  where exception_date ='"+eventDate+"'");
		getExceptionRSET.next();
		if(getExceptionRSET.getString(1).equals("6"))
		{
			flag = 2;
			
		}
		 for(i = 0;i < max ;i++)
		{
			 if((eventExceptSlots.get(i).toString().contains(eventDate) 
				&& eventExceptSlotsStartTime.get(i).toString().substring(0,2).equals(startTime.substring(0,2)))
				&&( eventExceptSlotsEndTime.get(i).toString().substring(0,2).equals(endTime.substring(0,2)) && 
						eventExceptSlotsEndTime.get(i).toString().substring(3,5).equals(endTime.substring(3,5)))  )
			{
				flag1 = 1;
				
				
				break;
			} 
			
 		} 
	 	if(flag1 ==1 && flag == 0  )
	 	{
	 		flag1	 =  0;	
	 	%>
	 	
	 	<script>
		    setTimeout(function(){
		       window.location.href = 'newEvent.jsp';
		    }, 100);
		    
		    	alert ("Slot Not Available");	
		    
		</script>
<%	 	}
	 	else if(flag == 2)
	 		
	 	{
	 		
	 		flag = 0;
	 		%>
	 			<script>
		    setTimeout(function(){
		       window.location.href = 'newEvent.jsp';
		    }, 100);
		    
		    alert("Try For Another Day Class Is Not Taking any session for this day");	
		    
		    
		</script>
	 		
		    
	 		<%
	 	}
	 	else
	 	{
		%>
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
			<div class="panel panel-header" style="	font-family:'Lilita One', cursive;margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Session Details</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
					<form id="sessionForm" name="sessionForm" class="form-inline" action="bookingProcess.jsp" method="post">
				 <div class="form-group" style="margin-left: auto; margin-right: auto; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="facultyName" id="facultyName"  value = "<%= session.getAttribute("USER_NAME") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Name" oninput="allLetter('facultyName', 'sessionForm');"></input>
						<input type="text" name="facultyPhone" id="facultyPhone" value = "<%= session.getAttribute("CONTACT_NUMBER") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Phone Number" oninput="allNumeric('facultyPhone', 'sessionForm');" required></input>
						<input type="text" name="facultyEmail" id="facultyEmail" value ="<%= session.getAttribute("EMAIL_ID") %>" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Faculty In-Charge Email ID" oninput="emailVal('facultyEmail', 'sessionForm');" required></input>
					</div>

					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
				<div id="details_header">DETAILS</div>
				<div class="form-group" style="margin-left: auto; margin-rig	ht: auto; border-bottom-color: #cc982d; border-bottom: 2px;">
						 <input type="text" name="forClass" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class"  required></input>
					 <br><br>
						<input type="number" min = "1" name="numberOfParticipants" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Number OF Participants"  required oninput="allNumeric('numberOfParticipants', 'sessionForm');"></input>
 						<br><br>
						 <select class="form-control" name="dept" id="dept" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange="selectUsed(this)">
							<option style="color: #000;" disabled selected value = "0">-----Select Department-----</option>
							<%while(getDeptQuotaRSET.next()){
									if(getDeptQuotaRSET.getInt(4)<getDeptQuotaRSET.getInt(3)){%>
										<option style="color: #000" value="<%=getDeptQuotaRSET.getString(1)%>"><%=getDeptQuotaRSET.getString(2)%></option>
									<%}
								}	%>
							<option style="color: #000;"  >Others</option>
						</select>
						<br><br>
						<input type="text" name="venue" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" placeholder="Venue for the Session" required></input>
					</div>
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
					<div class="form-group" style="margin-left: auto; margin-right: auto; margin-top: 15px; border-bottom-color: #cc982d; border-bottom: 2px;">

						<input type="text" name="classRepName" id="classRepName" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Name" oninput="allLetter('classRepName', 'sessionForm');" required></input>
						<br><br>
						<input type="text" name="classRepPhone" id="classRepPhone" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Phone Number" oninput="allNumeric('classRepPhone', 'sessionForm');" required></input>
						<br><br>
						<input type="text" name="classRepEmail" id="classRepEmail" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class Rep. Email" oninput="emailVal('classRepEmail', 'sessionForm');"  ></input>
						<br><br>
						<input type="text" name="classEmail" id="classEmail" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Class  Email" oninput="emailVal('classEmail', 'sessionForm');" ></input>
						<br><br>
					</div>
					
					<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
				
	<%int k  = 0; for(;hours > 0;hours -= 60,k++){ 
	 %>
	
					<div class="form-group" style="margin-left: auto; margin-right: auto; margin-top: 15px; border-bottom-color: #cc982d; border-bottom: 2px;">
					<%=(k+1)%>
	 				<input type="text" name="facultyInchargeName<%=k%>" id="facultyInchargeName" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Subject Teacher  Incharge Name" oninput="allLetter('facultyInchargeName', 'sessionForm');" required></input>
						<br><br>
						<input type="text" name="facultyInchargePhone<%=k%>" id="facultyInchargePhone" class="form-control" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Subject Teacher Incharge Phone Number" oninput="allNumeric('facultyInchargePhone', 'sessionForm');" required></input>
						<br><br>
						<input type="text" name="facultyInchargeEmail<%=k%>" id="facultyInchargeEmail" class="form-control" style="margin-top: 15px; background-color: rgba(0, 0, 0, 0); color: #fff;" placeholder="Subject Teacher Incharge Email" oninput="emailVal('facultyInchargeEmail', 'sessionForm');" required></input>
						<br><br>
							
					</div>
<%} %> 
 				<hr style="border-color: #cc982d; margin-top: 45px; margin-bottom: 45px;">
  
					<div class="form-group" style="margin-left: auto; margin-right: 15px;">
						<input class="btn btn-default" name="submitButton" type="submit" id="submitButton" value="Book Session"  onclick="return submit1()" style="font-weight: bold; background-color: #223260; color: #cc982d; border: 0px;"> <br>
						<small id="submitHelp" class="help-text" style="padding-top: 5px;">
							
						</small>
					</div>

					<input type="hidden" id="eventDate" name="eventDate" value = "<%=eventDate %>">
					<input type="hidden" id="noOfTeachers" name="noOfTeachers" value="<%=k%>">
					<input type="hidden" id="startTime" name="startTime" value = "<%=startTime %>">
					<input type="hidden" id="endTime" name="endTime" value = "<%=endTime %>">
					<input type="hidden" id="topicId" name="topicId" value =" <%= getTopicDataRSET.getString(1) %>" >
					<input type="hidden" id="topicName" name="topicName" value =" <%= getTopicDataRSET.getString(2) %>" >
					<input type="hidden" id="topicDesc" name="topicDesc" value =" <%= getTopicDataRSET.getString(3) %>" >
					 
					<% } %>  
					</div>
					
</div>
	
	</body>
	</html>