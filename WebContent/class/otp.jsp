<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <html>
<%@ page import="java.sql.*" %>
<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>

<% session.setAttribute("Wing", "CLASS"); %>
	   

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->
		<base target="_parent"></base>
		<link rel="stylesheet" href="../css/bootstrap.css">
		<link rel="stylesheet" href="../css/home.css">
		<link rel="stylesheet" href="../css/w3.css">
<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="../js/bootstrap.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Learning and Sharing Sessions - Index</title>
	</head>
	<style>
	button,body
	{
	font-family:'Lilita One', cursive;
	}
	</style>
	
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
												
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="text-align: center;">
			<div class="panel panel-default" style="background-color: #000e55;width:50%; border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 15px; border-top-left-radius: 15px; margin-right: auto; margin-left: auto;">

			<!-- checking the session for the   faculty-->
	  <%
			//if(session.getAttribute("ROLE").equals("SUPER ADMIN") || session.getAttribute("ROLE").equals("CLASS ADMIN") ){
		%> 
				
				<button type="submit" class="btn" form="viewAllSessionAdmin" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;">View All Sessions</button>
				
				<button type="submit" class="btn btn-primary" form="viewRequestedSession" style="border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">View Requested Sessions</button>

				<button type="submit" class="btn" form="viewConfirmedSession" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;">View Confirmed Sessions</button>
				
				<button type="submit" class="btn btn-primary" form="cancelSessionAdmin" style=" border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">Cancel Session</button>

				

				
				<button type="submit" class="btn" form="editSessionDetails" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;">Edit Session Details</button>
				<br>

				<button type="submit" class="btn btn-primary" form="addOffDay" style="border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">Add an Off Day or Hour</button>

				<button type="submit" class="btn btn-primary" form="remOffDay" style="border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">Delete an Off Day or Hour</button>

				<br>

				<button type="submit" class="btn btn-primary" form="newTopic" style="border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">Add  Topic</button>

				<button type="submit" class="btn btn-primary" form="removeTopics" style="border-radius:100px;margin-right: 15px; margin-bottom: 15px;background:#1668ce;">Remove Topics</button>
	
				<button type="submit" class="btn" form="updateTopics" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;">Update Topic Details</button>			
				
				<br>

				<button type="submit" class="btn" form="changeQuota" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;">Change Department Quotas</button>
				<button type="submit" class="btn" form="changeQuota" style="border-radius:100px;background-color: #1668ce; color: white; margin-right: 15px; margin-bottom: 15px;"></button>
				
			
				

				

			 	<%
				/*}
				else if(session.getAttribute("ROLE").equals("FACULTY")){*/ %>
					
					<button type="submit" class="btn btn-primary" form="bookSession" style="border-radius:100px;font-size:20px;margin-right: 15px; margin-bottom: 30px;margin-top:5px; background:#1668ce;width:53%;">Book a Session</button>
					<br>
					<button type="submit" class="btn btn-primary" form="cancelSession" style="border-radius:100px;font-size:20px;margin-right: 15px; margin-bottom: 5px;background:#1668ce;width:53%;">Cancel a Session</button>
					<%
					/*}
				else{
						response.sendRedirect("../");
					}*/
				%>
  


			</div>
		</div>

	</body>
</html>

<form id="bookSession" action="event/newEvent.jsp"  method="post" autocomplete="off">
	<input type="text" name="wing" value="class">
</form>
<%	 }
				         catch (NullPointerException e) {
				      	   e.printStackTrace();
				      	  }
				         catch(Exception e){
				            e.printStackTrace();
				         }
						
				        
				        %>
    