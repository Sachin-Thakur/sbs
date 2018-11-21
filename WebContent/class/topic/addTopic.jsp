<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<% Connection connection=DbUtil.getConnection(); %>
	<%!
	java.sql.Statement insertSTAT =null;

		
	%>
<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	

	 insertSTAT = connection.createStatement();

	String	topic = "'" + request.getParameter("topicName") + "'",
			desc = "'" + (request.getParameter("topicDesc").contains("Enter")?"":request.getParameter("topicDesc")) + "'",
			duration =  "'" + request.getParameter("topicDuration") + "'",
			startDate =  "'" + request.getParameter("topicDate") + "'",
			details  =  "'" + request.getParameter("topicDetails") + "'";

	insertSTAT.executeUpdate("insert into class_topics(	topic,description,duration,start_date,details) values(" + topic + ", " + desc + ", " + duration + ", " + startDate + "," + details +")" );

	response.sendRedirect("/sbs/class/index.jsp");

} catch(Exception e){
	out.println(e);
}
%>