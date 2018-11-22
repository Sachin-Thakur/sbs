<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%
Connection connection=DbUtil.getConnection();
%>
	<%! 
     java.sql.Statement insertClassEventSTAT =null;
     String  topicName,eventDate,startTime,endTime,venue,bookerName,
     bookerEmail,bookerPhone,classInchargeName,classInchargeEmail,
     classInchargePhone,classRepresentativeName,classRepresentativeEmail,
     classRepresentativePhone,classEmail,type,status,classTopicsId,bookedOn,numberOfParticipants;
     
     %>
     
  <%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}
 	 else if(session.getAttribute("USER_CATEGORY") == "SUPER ADMIN"){
		response.sendRedirect("/sbs/class/index.jsp");
	}
  
	%>
<%
try
{	
			topicName= "'" + request.getParameter("topicName") + "'";
			eventDate = "'" + request.getParameter("eventDate") + "'";
			startTime = "'" + request.getParameter("eventTime").substring(0, 5) + ":00" + "'";
			endTime = "'" + request.getParameter("eventTime").substring(8) + ":00" + "'";
			venue = request.getParameter("venue");
			bookerName = "'" +session.getAttribute("USER_NAME")+ "'";
			bookerEmail = "'" +session.getAttribute("CONTACT_NUMBER")+ "'";
			bookerPhone = "'" +session.getAttribute("EMAIL_ID")+ "'";
			classInchargeName = request.getParameter("facultyName");
			classInchargePhone = request.getParameter("facultyPhone");
			classInchargeEmail = request.getParameter("facultyEmail");
			classRepresentativeName = request.getParameter("classRepName");
			classRepresentativeEmail = request.getParameter("classRepEmail");
			classRepresentativePhone = request.getParameter("classRepPhone");
			classEmail = request.getParameter("classEmail");
			status="1";
			bookedOn = "now()";
			classTopicsId= request.getParameter("topicId") ;
			numberOfParticipants = request.getParameter("numberOfParticipants");
%>
<%
			insertClassEventSTAT = connection.createStatement();
			insertClassEventSTAT.executeUpdate("insert into class_events (topic_name,start_time,end_time,event_date,booked_on,venue,booker_name,booker_email,booker_phone,class_incharge_name,class_incharge_email,class_incharge_phone,class_representative_name,class_representative_email,class_representative_phone,class_email,max_participants,status,class_topics_id)values("+topicName+","+startTime+","+endTime+","+eventDate+","+bookedOn+","+venue+","+bookerName+","+bookerEmail+","+bookerPhone+","+classInchargeName+","+classInchargeEmail+","+classInchargePhone+","+classRepresentativeName+","+classRepresentativeEmail+","+classRepresentativePhone+","+classEmail+","+numberOfParticipants+","+status+","+classTopicsId+")");
			
		%>
<%
response.sendRedirect("/sbs/class/index.jsp");
}
catch (NullPointerException e) {
    e.printStackTrace();
    
} catch (Exception e) {
    e.printStackTrace();
} finally {
    if (insertClassEventSTAT != null)
        try {
        	insertClassEventSTAT.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    
    
}
%>	