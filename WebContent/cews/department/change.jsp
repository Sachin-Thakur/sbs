<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="com.daniel.util.DbUtil"%>
<%
try{
	Connection con = (Connection) session.getAttribute("DB_CONNECTION");

	Statement removeSTAT = con.createStatement();

	String dept = request.getParameter("dept"),
		quota = request.getParameter("newQuota");

	removeSTAT.executeUpdate("update department set quota = " + quota + " where name = '" + dept + "'");

	response.sendRedirect("/sbs/class/index.jsp");
}catch(Exception e){
	out.println(e);
}
%>