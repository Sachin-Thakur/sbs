<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="event.TimeSlot" %>
	<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%
Connection connection=DbUtil.getConnection();

%>
  <%! 
     java.sql.Statement getClassEventsSTAT =null;
     ResultSet getClassEventsRSET =null;
     java.sql.Statement getVolunteersSTAT =null;
     ResultSet getVolunteersRSET = null;
     
     String id;
     int noOfVolunteer;
 %>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	%>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
		
		
		<style>
		


.dropdown {
  position: absolute;
  top:50%;
  transform: translateY(-50%);
}


.dropdown dd,
.dropdown dt {
  margin: 0px;
  padding: 0px;
}

.dropdown ul {
  margin: -1px 0 0 0;
}

.dropdown dd {
  position: relative;
}

.dropdown a,
.dropdown a:visited {
  color: #fff;
  text-decoration: none;
  outline: none;
  font-size: 12px;
}

.dropdown dt a {
  background-color: #4F6877;
  display: block;
  padding: 8px 20px 5px 10px;
  min-height: 25px;
  line-height: 24px;
  overflow: hidden;
  border: 0;
  width: 272px;
}

.dropdown dt a span,
.multiSel span {
  cursor: pointer;
  display: inline-block;
  padding: 0 3px 2px 0;
}

.dropdown dd ul {
  background-color: #4F6877;
  border: 0;
  color: #fff;
  display: none;
  left: 0px;
  padding: 2px 15px 2px 5px;
  position: absolute;
  top: 2px;
  width: 280px;
  list-style: none;
  height: 100px;
  overflow: auto;
}

.dropdown span.value {
  display: none;
}

.dropdown dd ul li a {
  padding: 5px;
  display: block;
}

.dropdown dd ul li a:hover {
  background-color: #fff;
}


		</style>
	
	<style>
	body
	{
	font-family:'lilita one',cursive;
	}
	.dropdown
	{
	margin-top:25px !important;
	}
	</style>	
	<head>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">

		<jQuery library >
		
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
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
		<!--script src="whatever.js" type="text/javascript"></script-->

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
		
	<div class="container" style="text-align: center; min-width: 100%;">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Volunteer </strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
			id = request.getParameter("topicId");
			noOfVolunteer = Integer.parseInt(request.getParameter("noOfVolunteer"));
			
				getClassEventsSTAT = connection.createStatement();
				 getClassEventsRSET = getClassEventsSTAT.executeQuery("select id, topic_name, event_date, start_time, end_time, booked_on, booker_name, venue ,topic_description from class_events where   id ="+id+"");
				 getVolunteersSTAT = connection.createStatement();
				getVolunteersRSET = getVolunteersSTAT.executeQuery("select reg_id,volunteer_name,email_id,volunteer_type from volunteer_registration where wings = '"+session.getAttribute("Wing")+"'");
				getClassEventsRSET.last();

				if(!(getClassEventsRSET.getRow() == 0)){
					getClassEventsRSET.beforeFirst();

			%>
			<form name="volunterWOrkDiary" id="topic_form" action="assignVolunteerProcess.jsp" method="post">

			<table class="table table-bordered" style="white-space: nowrap;">

				<thead style="color: #ffffff">
					<tr>
					<td>Topic
					<td width="15px">Date
					<td width="15px">Start Time
					<td width="15px">End Time
					<td width="19px">Booked On
					<td width="35px">Booked By
					<td>Venue
					<td >Choose Volunteer
					
					</tr>
				</thead>

				<%
				
				int cols = getClassEventsRSET.getMetaData().getColumnCount();
				getClassEventsRSET.next();
%>
				
					<tr style="color: white">
					<td><%=getClassEventsRSET.getString(2)%></td>
					<td><%=getClassEventsRSET.getString(3)%></td>
					<td><%=getClassEventsRSET.getString(4)%></td>
					<td><%=getClassEventsRSET.getString(5)%></td>
					<td><%=getClassEventsRSET.getString(6)%></td>
					<td><%=getClassEventsRSET.getString(7)%></td>
					<td><%=getClassEventsRSET.getString(8)%></td>
					<td>
					<dl class="dropdown"> 
				  
				    <dt>
				    <a href="#">
				      <span class="hida">Select</span>    
				      <p class="multiSel"></p>  
				    </a>
				    </dt>
				  
				    <dd>
				        <div class="mutliSelect">
				            <ul>
				            <% 
				            while(getVolunteersRSET.next()){%>
				                <li>
				                    <input name = "volunteersID" class="single-checkbox"  type="checkbox" value="<%=getVolunteersRSET.getString(1)%>"><%=getVolunteersRSET.getString(2)%></li>
				              
				                    <%
				                    }  
				                    %>
				          </ul>
				        </div>
				    </dd>
				  	
				</dl>
			</td>
					
					</tr>
			</table>
			<input type= "hidden" name = "proEndDate" value = "<%=getClassEventsRSET.getString(3)%>">
			<input type= "hidden" name = "topicId" value = "<%=getClassEventsRSET.getString(1)%>">
			<input type = "hidden" name = "proDesc" value =  "<%=getClassEventsRSET.getString(9)%>">
			<input type = "hidden" name = "topicName" value =  "<%=getClassEventsRSET.getString(2)%>">
			<button class="btn btn-success" onclick="return submitName()">Submit</button>
			<%
				}else{
					out.println("<strong style=\"color: white;\">No data to display</strong>");
				}
			%>
			
				
			
			</form>
			</div>
		</div>
		<script>
		
	function	submitName()
		{
		var topic;
		topic=document.getElementById("topicName").value;
		if(topic== 0)
			{
			alert("please choose a volunteer");
			return false;
			}
		else
			{
			document.getElementById("topic_form").submit(); 
			return true;
			}
		}
	$(".dropdown dt a").on('click', function() {
	    
	    $(".dropdown dd ul").slideToggle('fast');
	  });




	  $('.single-checkbox').on('change', function() {
	     if($('.single-checkbox:checked').length > <%=noOfVolunteer%>) {
	         this.checked = false;
	     }
	  });
		</script>
	</body>
	
</html>


