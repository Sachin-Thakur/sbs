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
String eventId;

%>
<%
	eventId = (String)session.getAttribute("eventID");
	
%>
  <%! 
     java.sql.Statement getClassEventsSTAT =null;
     ResultSet getClassEventsRSET =null;
 %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
	%>
	<script>
		
	function	submitTopic()
		{
		var topic,vol;
		topic=document.getElementById("topicId").value;
		vol=document.getElementById("noOfVolunteer").value;
		if(topic== 0)
			{
			alert("Please select topic");
			return false;
			}
		
		else if(vol == 0)
		{
		alert("Please select Number Of Voluneteer");
		return false;
		}
		else
		{
		document.getElementById("topic_form").submit(); 
		return true;
		}
	}
		
		
		</script>
	
	
	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
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
						<li class="navbar-inverse navbar-text" style="background:#303f9e;color:white;">Welcome  <%= session.getAttribute("USER_NAME") %></li>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<form name="f1" id="topic_form" action="showVolunteer.jsp" method="post">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Topic</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
			
							<%
							 try{
								 getClassEventsSTAT = connection.createStatement();
								  getClassEventsRSET = getClassEventsSTAT.executeQuery("select * from class_events where  event_date>=now() and status = 3  ");
								  getClassEventsRSET.last();
									if(!(getClassEventsRSET.getRow() == 0)){
										getClassEventsRSET.beforeFirst();
								
								
										%>
										 <input type = "hidden" value = "<%=eventId%>" name = "topicId">
								<select  class="form-control" name="noOfVolunteer" id="noOfVolunteer" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;">
									<option value = 0 style="color: #000;" selected>---Select Number of Volunteer---</option>
									<option value = 1 style="color: #000;" >1</option>
									<option value = 2 style="color: #000;" >2</option>
									
								</select>
								<br>
								<button class="btn btn-success" onclick="return submitTopic()">Submit</button>
									<%}
									
									else{%>
										<strong style="color: white;">Confirm an Event to Proceed</strong>
									<%}
							 }
					        catch(SQLException se){
					            se.printStackTrace();
					         } 
					         catch (NullPointerException e) {
					      	   e.printStackTrace();
					      	  }
					         catch(Exception e){
					            e.printStackTrace();
					         }
					        finally{
					        	if(getClassEventsSTAT!=null)
									try {
										getClassEventsSTAT.close();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} 
					        	if(getClassEventsRSET!=null)
									try {
										getClassEventsRSET.close();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} 
					        	 
					        	}
					        
							%>
							
					
				
			</div>
			</form>
		</div>

		
	</body>
</html>


