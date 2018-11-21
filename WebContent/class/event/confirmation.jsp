<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
	<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%Connection connection=DbUtil.getConnection(); %>
	<%! 
	java.sql.Statement getClassEventsSTAT =null;
	java.sql.Statement getClassEventsUpdateSTAT =null;
	     java.sql.Statement getDepartmentSTAT =null;
	     ResultSet getClassEventsRSET =null;
	     
	     String topic_id;
     %>

<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	topic_id = "'"+request.getParameter("eventId")+"'";
	
	getClassEventsUpdateSTAT = connection.createStatement();
	getDepartmentSTAT = connection.createStatement();
	getClassEventsSTAT = connection.createStatement();
	getClassEventsRSET = getClassEventsSTAT.executeQuery("select dept_id from class_events where id = "+topic_id);
	getClassEventsRSET.next();
	
	if(request.getParameter("status").equals("c")){
		getClassEventsUpdateSTAT.executeUpdate("update class_events set status = 3 where id = "+topic_id);
		getDepartmentSTAT.executeUpdate("update department set used = used +1 where dept_id ='"+getClassEventsRSET.getString(1)+"'");
		
	}else{
		getClassEventsUpdateSTAT.executeUpdate("update class_events set status = 5 where id = "+topic_id);
		
	}
	session.setAttribute("eventID", topic_id);
	response.sendRedirect("/sbs/class/event/assignVolunteer.jsp");
	
}  catch(SQLException se){
    se.printStackTrace();
 } 
 catch (NullPointerException e) {
	   e.printStackTrace();
	  }
 catch(Exception e){
    e.printStackTrace();
 }
finally{
	if(getClassEventsSTAT!=null)
		try {
			getClassEventsSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(getClassEventsRSET!=null)
		try {
			getClassEventsRSET.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(getClassEventsUpdateSTAT!=null)
		try {
			getClassEventsUpdateSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(getDepartmentSTAT!=null)
		try {
			getDepartmentSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	
}
%>