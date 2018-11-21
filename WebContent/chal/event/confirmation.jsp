<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	Connection con = (Connection) session.getAttribute("DB_CONNECTION");

	Statement getSTAT = con.createStatement();

	ResultSet getRSET;

	if(request.getParameter("status").equals("c")){
		getSTAT.executeUpdate("update event set status = 2 where id = '" + request.getParameter("eventId") + "'");
	}else{
		getSTAT.executeUpdate("update event set status = 3 where id = '" + request.getParameter("eventId") + "'");
		getRSET = getSTAT.executeQuery("select dept from contact where event_id = '" + request.getParameter("eventId") + "'");

		getRSET.next();
		String dept = "'" + getRSET.getString(1) + "'";

		getSTAT.executeUpdate("update department set used = used-1 where name = " + dept);
	}
	
	response.sendRedirect("/sbs/class/index.jsp");
} catch(Exception e){
	out.println(e);
}
%>