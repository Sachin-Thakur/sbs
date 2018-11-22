<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
	<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	 
	     java.sql.Statement getSTAT =null;
	     ResultSet getRSET =null;
	     
     %>

<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	

	getSTAT = connection.createStatement();



	if(request.getParameter("status").equals("c")){
		getSTAT.executeUpdate("update class_events set status = 3 where id = '" + request.getParameter("eventId") + "'");
	}else{
		getSTAT.executeUpdate("update class_events set status = 5 where id = '" + request.getParameter("eventId") + "'");
		/*getRSET = getSTAT.executeQuery("select dept from contact where event_id = '" + request.getParameter("eventId") + "'");

		getRSET.next();
		String dept = "'" + getRSET.getString(1) + "'";

		getSTAT.executeUpdate("update department set used = used-1 where name = " + dept);*/
	}

	response.sendRedirect("/sbs/class/index.jsp");
} catch(Exception e){
	out.println(e);
}
%>