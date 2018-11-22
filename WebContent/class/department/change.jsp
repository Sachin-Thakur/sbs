<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	java.sql.Statement removeSTAT =null;
  
 %>
<%
try{

	removeSTAT = connection.createStatement();

	String dept = request.getParameter("dept"),
		quota = request.getParameter("newQuota");

	removeSTAT.executeUpdate("update department set quota = " + quota + " where dept = '" + dept + "'");

	response.sendRedirect("/sbs/class/index.jsp");
}catch(Exception e){
	out.println(e);
}
%>