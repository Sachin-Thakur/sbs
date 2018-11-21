<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	 
	     java.sql.Statement removeSTAT =null;
	     ResultSet removeRSET =null;
	 
   
 %>
<%
try{
	

	Statement removeSTAT = connection.createStatement();

	String date = request.getParameter("eventDate"),
		time = request.getParameter("eventTime");

	if(time.equals("all day")){
		removeSTAT.executeUpdate("delete from class_exceptions where exception_date = '" + date + "' ");
	}else{
		removeSTAT.executeUpdate("delete from class_exceptions where exception_date = '" + date + "' and exception_start_time = '" + (time.substring(0, 5) + ":00") + "' ");
	}

	response.sendRedirect("/sbs/class/index.jsp");
}catch(Exception e){
	out.println(e);
}
%>