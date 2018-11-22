<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
Connection connection=DbUtil.getConnection();
%>
	<%! 
     java.sql.Statement insertClassEventSTAT =null;
	java.sql.Statement selectClassEventsIdSTAT =null;
	java.sql.Statement insertClassInchargeSTAT =null;
	java.sql.Statement getHourSTAT =null;
	ResultSet selectClassEventsIdRSET=null;
	ResultSet getHourRSET=null;
	
     String  topicName,topicDesc,topicId,eventDate,startTime,endTime,className,venue,bookerName,bookerPhone,
     bookerEmail,classRepresentativeName,classRepresentativePhone,classEventsId,classRepresentativeEmail,
     classEmail,type,status,classTopicsId,bookedOn,numberOfParticipants,dept_id,str_hours,to,from;
  int hours;
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
			topicName=  "'" + request.getParameter("topicName")+ "'" ;
			eventDate = "'" + request.getParameter("eventDate") + "'";
			topicDesc= "'" + request.getParameter("topicDesc") + "'";;
			topicId= "'" + request.getParameter("topicId") + "'";;
			startTime = "'" + request.getParameter("startTime") + "'";
			endTime = "'" + request.getParameter("endTime") + "'";
			className="'" + request.getParameter("forClass")+ "'";
			
			venue = "'" +  request.getParameter("venue")+ "'";
			to = request.getParameter("facultyEmail");
			bookerName = "'" +request.getParameter("facultyName")+ "'";
			bookerEmail = "'"+to+"'";
			bookerPhone = "'" +request.getParameter("facultyPhone")+ "'";
			classRepresentativeName = "'" + request.getParameter("classRepName")+ "'";
			classRepresentativeEmail = "'" + request.getParameter("classRepEmail")+ "'";
			classRepresentativePhone = request.getParameter("classRepPhone");
			classEmail ="'" +  request.getParameter("classEmail")+ "'";
			hours = Integer.parseInt(request.getParameter("noOfTeachers"));
			dept_id = "'" +request.getParameter("dept")+ "'";
			status="1";
			bookedOn = "now()";
			classTopicsId=request.getParameter("topicId");
			numberOfParticipants = "'" + request.getParameter("numberOfParticipants")+ "'";
			
			

%>
<%
		insertClassEventSTAT = connection.createStatement();
			
			insertClassEventSTAT.executeUpdate("insert into class_events (topic_name,start_time,end_time,event_date,class_name,booked_on,venue,booker_name,booker_email,booker_phone,class_representative_name,class_representative_email,class_representative_phone,class_email,max_participants,status,class_topics_id,topic_description,dept_id)	values("+topicName+","+startTime+","+endTime+","+eventDate+","+className+","+bookedOn+","+venue+","+bookerName+","+bookerEmail+","+bookerPhone+","+classRepresentativeName+","+classRepresentativeEmail+","+classRepresentativePhone+","+classEmail+","+numberOfParticipants+","+status+","+topicId+","+topicDesc+","+dept_id+")");
			
		%>
		<%
		selectClassEventsIdSTAT = connection.createStatement();
		insertClassInchargeSTAT = connection.createStatement();
		
		//System.out.println(hours);
		selectClassEventsIdRSET = selectClassEventsIdSTAT.executeQuery("select max(id) from class_events");
		selectClassEventsIdRSET.next();
		classEventsId = selectClassEventsIdRSET.getString(1);
		
		
		String classInchargeName[] = new String[hours];
		String classInchargeEmail[] = new String[hours];
		String classInchargePhone[] = new String[hours];
		for (int i = 0;i < hours;i++)
		{
			classInchargeName[i] = "'" +request.getParameter("facultyInchargeName"+i) +"'";
			classInchargeEmail[i]= "'" +request.getParameter("facultyInchargeEmail"+i) +"'";
			classInchargePhone[i]= "'" +request.getParameter("facultyInchargePhone"+i) +"'";
			insertClassInchargeSTAT.executeUpdate("insert into classwing_class_incharge(class_events_id,incharge_name,incharge_email,incharge_phone) values("+classEventsId+","+classInchargeName[i]+","+classInchargeEmail[i]+","+classInchargePhone[i]+")");
		}
		  final String from="caps@christuniversity.in";//change accordingly  
		  final String password="CAPS@EXPERTISE";//change accordingly  
		  
		    String host = "smtp.gmail.com";
	  
	     //Get the session object  
	      
	      Properties props = new Properties();
	     
	      props.put("mail.smtp.starttls.enable", "true"); 
          props.put("mail.smtp.host", "smtp.gmail.com");

          props.put("mail.smtp.port", "587");
          props.put("mail.smtp.auth", "true");
          
	      Session session1 = Session.getInstance(props,  
	    		    new javax.mail.Authenticator() {  
	    		      protected PasswordAuthentication getPasswordAuthentication() {  
	    		    return new PasswordAuthentication(from,password);  
	    		      }  
	    		    }); 
	      
	      
 MimeMessage message = new MimeMessage(session1);
	      
	      message.setFrom(new InternetAddress(from));
	      
	      message.addRecipient(Message.RecipientType.TO,
	                               new InternetAddress(to));
	      
	      message.setSubject("CAPS - Request for a Session");
	      message.setText( "Dear Christite,"
	    		  +"\n\nYour request to book a session on '"+eventDate+"' for class '"+className+"' on topic '"+topicName+"' was received by us." 
	    		  +"\n\n\nWe will get back to you about it shortly"
	    		  +"\nCAPS Team 2018-1019"
	    		  +"\nCentre for Academic and Professional Support"
	    		  +"\n\nYou are receiving this email because you booked a session with the CAPS SBS system."			  
	    				);  
	    				  
	      Transport.send(message);

		
/*	  Properties props = System.getProperties();
	     props.setProperty("mail.smtp.host", "smtp.gmail.com");
	     props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	     props.setProperty("mail.smtp.socketFactory.fallback", "false");
	     props.setProperty("mail.smtp.port", "465");
	     props.setProperty("mail.smtp.socketFactory.port", "465");
	     props.put("mail.smtp.auth", "true");
	     props.put("mail.debug", "true");
	     props.put("mail.store.protocol", "pop3");
	     props.put("mail.transport.protocol", "smtp");
	     final String username = "info.caps@christuniversity.in";
	     final String password = "";
	     Session mySession = Session.getInstance(props, new Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
	      
	      MimeMessage message = new MimeMessage(mySession);
	      
	      message.setFrom(new InternetAddress(from));
	      
	      message.addRecipient(Message.RecipientType.TO,
	                               new InternetAddress(to));
	      
	      message.setSubject("CAPS - One Time Password (OTP)");
	      message.setText( "Dear Christite,"
	    		  +"\n\nKindly use this OTP for creating your password." 
	    		  +"\n\n\nWarm Regards"
	    		  +"\nOPERATION Team 2017-18"
	    		  +"\nCentre for Academic and Professional Support"
	    		  +"\n\nDisclaimer: This email is intended to remind the prospective participants of CAPS Recruitment 2017-18, Christ University. The organisation is not liable for any implications beyond this intended purpose."			  
	    				);  
	      Transport.send(message);
		 
 */		%>
<%
response.sendRedirect("/sbs/class/event/showDetails.jsp");
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
    if(selectClassEventsIdSTAT!=null)
		try {
			selectClassEventsIdSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(insertClassInchargeSTAT!=null)
		try {
			insertClassInchargeSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	if(getHourSTAT!=null)
		try {
			insertClassInchargeSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(getHourRSET!=null)
		try {
			getHourRSET.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	if(selectClassEventsIdRSET!=null)
		try {
			selectClassEventsIdRSET.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    
}
%>	