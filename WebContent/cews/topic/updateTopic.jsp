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
     java.sql.Statement getTopicDataSTAT =null;
  java.sql.Statement getTopicDaySTAT =null;
     ResultSet getTopicDataRSET =null;
     ResultSet getTopicDayRSET =null;
 	String id,name,description,start_date,start_time,end_time,prerequisite,days[];
 	int counter = 0;
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
			<form name="f1" id="topic_form" action="updateProcess.jsp" method="post">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Topic</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				
				
							<%
							id = request.getParameter("topicId");
						//	out.println(id);
							
							try{
								 //getTopicDataSTAT = connection.createStatement();  
								 //getTopicDataRSET = getTopicDataSTAT.executeQuery("select * from cews_topics where id ="+id);
								 getTopicDaySTAT = connection.createStatement();
								 getTopicDayRSET = getTopicDaySTAT.executeQuery("select day from cews_topic_day where id="+id);
								 //getTopicDataRSET.next();
								 /*name = getTopicDataRSET.getString(2);
								 description = getTopicDataRSET.getString(3);
								 start_time = getTopicDataRSET.getString(4);
								 end_time = getTopicDataRSET.getString(5);
								 start_date = getTopicDataRSET.getString(6);
								 prerequisite = getTopicDataRSET.getString(7);*/
								 while(getTopicDayRSET.next())
								 
								 {
									System.out.println("abc");
									 days[counter] = getTopicDayRSET.getString(1);
								 	 counter ++;
								 }
								 
								 out.println(counter);
						%>
							
							<!-- Topic Name:-<input type="text" value = "<%=name%>">
							Description:-<textarea cols="100" rows="5" name="topicDesc" ><%=description%></textarea>
							
							
							Start Date:-<input type="text" name="topicDate" id="topicDate" value = "<%=start_date%>">				
							prerequisite : -<textarea cols="100" rows="5" name="topicDesc" ><%=prerequisite %></textarea>
							Start Time :-<input type = "time" name = "startTime"  value = <%=start_time %>>
							End Time:-<input type = "time" name = "endTime"  value = <%=end_time %>> -->

						<% for (int i =0 ;i< counter;i++)
						{
							out.print(i);
						}
						%>							
						<input type="submit" >
						<input type = "hidden" name = "topicId" value ="<%=id%>"> 
				
			</div>
			</form>
		</div>
			<% } 
							
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
					        	if(getTopicDataSTAT!=null)
									try {
										getTopicDataSTAT.close();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} 
					        	if(getTopicDataRSET!=null)
									try {
										getTopicDataRSET.close();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									} 
					        	 
					        	}
					        %>	
	</body>
</html>
		



