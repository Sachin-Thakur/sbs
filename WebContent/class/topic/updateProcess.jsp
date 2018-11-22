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
			desc = "'" + request.getParameter("topicDesc") + "'",
			duration =  "'" + request.getParameter("topicDuration") + "'",
			startDate =  "'" + request.getParameter("topicDate") + "'",
			id = request.getParameter("topicId"),
			details = "'" +request.getParameter("topicDetails") + "'" ;

	insertSTAT.executeUpdate("update class_topics set topic = "+ topic + ", description = " + desc +",duration = "+ duration +",start_date = "+ startDate + ",details =" + details +"  where id = "+id );

	response.sendRedirect("/sbs/class/index.jsp");

} catch(Exception e){
	out.println(e);
}
%>