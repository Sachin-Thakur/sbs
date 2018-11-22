<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<% Connection connection=DbUtil.getConnection(); %>
<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	

	Statement delSTAT = connection.createStatement();

	String topicId = "'" + request.getParameter("eventId") + "'";
		
	
	delSTAT.executeUpdate("update class_events set status = 4  where id = " + topicId + "" );


		response.sendRedirect("/sbs/class/index.jsp");

} catch(Exception e){
	out.println(e);
}
%>