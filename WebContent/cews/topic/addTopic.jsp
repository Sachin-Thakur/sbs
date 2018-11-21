<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<% Connection connection=DbUtil.getConnection(); %>
	<%!
	java.sql.Statement insertSTAT =null;
	ResultSet getMAXIdRSET = null;
	String topic,desc,startTime,endTime,startDate,prerequisite,maxPart ,days[],id;
	%>
<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	topic = "'" +request.getParameter("topicName") +"'";
	desc = "'" +request.getParameter("topicDesc") +"'";
	startTime = "'" +request.getParameter("startTime") +"'";
	endTime = "'" +request.getParameter("endTime") +"'";
	startDate = "'" +request.getParameter("topicDate") +"'";
	prerequisite  = "'" +request.getParameter("topicPre") +"'";
	maxPart  = request.getParameter("maxParticipants");
	days = request.getParameterValues("DAY");
	
	insertSTAT = connection.createStatement();
	
	
	insertSTAT.executeUpdate("insert into cews_topics(topic,description,start_time,end_time,start_date,prerequisite,max_participants)values("+topic+", "+desc+", "+startTime+", "+endTime+","+startDate+","+prerequisite+","+maxPart+")" );

	getMAXIdRSET = insertSTAT.executeQuery("select max(id) from cews_topics");
	getMAXIdRSET.next();
	id = getMAXIdRSET.getString(1);
	for (int i =0;i< days.length;i++)
	{
		insertSTAT.executeUpdate("insert into cews_topic_day values("+id+",'"+days[i]+"')"); 
	}
	response.sendRedirect("/sbs/cews/index.jsp");

} catch(Exception e){
	out.println(e);
}
%>