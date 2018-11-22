<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%

if(session.getAttribute("REGISTER_NUMBER") == null){
	response.sendRedirect("/sbs/index.jsp");
}

try{
	
	Connection con = (Connection) session.getAttribute("DB_CONNECTION");

	Statement getSTAT = con.createStatement(),
		insertSTAT = con.createStatement(),
		newSTAT = con.createStatement();

	ResultSet getRSET = getSTAT.executeQuery("select id from event where id like '" + session.getAttribute("wing") + "%'" );

	getRSET.last();

	String eventId = "'" + ( ((String) session.getAttribute("wing")) + getRSET.getRow() ) + "'";

	getRSET.close();

	String topic = "'" + request.getParameter("topicName") + "'",
			desc = "'" + request.getParameter("topicDesc") + "'",
			date = "'" + request.getParameter("eventDate") + "'",
			startTime = "'" + request.getParameter("eventTimeFrom") + "'",
			endTime = "'" + request.getParameter("eventTimeTo") + "'",
			bookedOn = "now()",
			type = request.getParameter("eventType"),
			amt = "",
			status = "2",
			venue = "'" + request.getParameter("venue") + "'",
			max_part = request.getParameter("maxPax"),
			wing = "'" + session.getAttribute("wing") + "'";

	String query = "insert into event values(" + eventId + ", " + topic + ", " + desc + ", " + date + ", " + startTime + ", " + endTime + ", " + bookedOn + ", " + type + ", " + status + ", " + venue + ", " + max_part + ", " + wing + ")";

	insertSTAT.executeUpdate(query);

	String dept = "'" + request.getParameter("dept") + "'",
			bookerName = "'" + session.getAttribute("STUDENT_NAME") + "'",
			bookerPhone = "'" + session.getAttribute("CONTACT_NUMBER") + "'",
			bookerEmail = "'" + session.getAttribute("EMAIL_ID") + "'",
			bookerRole = "'Booker'";

	query = "insert into contact values(" + eventId + ", " + bookerName + ", " + dept + ", " + bookerPhone + ", " + bookerEmail + ", " + bookerRole + ")";


	newSTAT.executeUpdate(query);

	response.sendRedirect("/sbs/chal/index.jsp");
	
} catch(Exception e){
	out.println(e);
}
%>