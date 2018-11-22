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
	String topicId = "'" + request.getParameter("topicName") + "'";
	delSTAT.executeUpdate("delete from cews_topic_day where id = " + topicId + "" );
	delSTAT.executeUpdate("delete from cews_topics where id = " + topicId + "" );
	response.sendRedirect("/sbs/cews/index.jsp");

} catch(Exception e){
	out.println(e);
}
%>