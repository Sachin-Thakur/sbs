<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="com.daniel.util.DbUtil"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import= "java.util.Calendar" %>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
Connection connection=DbUtil.getConnection();

%>
<%
java.sql.Statement assignSTAT = null;
java.sql.Statement topicStatusUpdateSTAT = null;
java.sql.Statement insertSTAT =null;
java.sql.Statement databasefetchSTAT=null;
ResultSet getMAXIdRSET=null;
ResultSet databasedetailsRSET = null;

String regNo[],projectName,projectDesc,projectStartDate,projectEndDate,proEndDate,topicId,id;
Date curDate;
SimpleDateFormat formatter;
String eventDate,className,to,bookerName,eventStatus; 


%>
<%
topicId = (String)session.getAttribute("eventID");
curDate = new Date();
formatter = new SimpleDateFormat("MM/dd/yyyy");
proEndDate = request.getParameter("proEndDate");
 projectEndDate ="'"+ proEndDate.substring(5,7) + "/" +
		 proEndDate.substring(8) + "/" +
		 proEndDate.substring(0,4)+"'"; 

regNo = request.getParameterValues("volunteersID");
projectName= "'"+request.getParameter("topicName")+"'";  
projectDesc ="'"+ request.getParameter("proDesc")+"'";
projectStartDate = "'"+formatter.format(curDate)+"'";  
assignSTAT = connection.createStatement();
topicStatusUpdateSTAT = connection.createStatement(); 
try{
	
	for (int i =0;i< regNo.length;i++)
	{
			
	assignSTAT.executeUpdate("INSERT INTO assign_projects (reg_id,project_title,project_desc,pro_start_date,pro_end_date) values ("+regNo[i]+","+projectName+","+projectDesc+","+projectStartDate+","+projectEndDate+")");
    
	
	}
	topicStatusUpdateSTAT.executeUpdate("Update class_events set status = 6 where id = "+topicId);
	%>
<% 
databasefetchSTAT = connection.createStatement();
databasedetailsRSET=databasefetchSTAT.executeQuery("select * from class_events where id="+topicId);
if(databasedetailsRSET.next())
{
eventDate = databasedetailsRSET.getString("event_date");
className = databasedetailsRSET.getString("class_name");
to = databasedetailsRSET.getString("booker_email");
bookerName = databasedetailsRSET.getString("booker_name");
eventStatus = databasedetailsRSET.getString("status");
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
	      message.setText( "Dear '"+bookerName+"',"
	    		  +"\n\nYour request to book a session on '"+eventDate+"' for class '"+className+"' on topic '"+projectName+"' was received by us and was '"+eventStatus+"'." 
	    		  +"\n\n\nHope you are happy with our service. Contact CAPS office for any queries."
	    		  +"\nCAPS Team 2018-1019"
	    		  +"\nCentre for Academic and Professional Support"
	    		  +"\n\nYou are receiving this email because you booked a session with the CAPS SBS system."			  
	    				);  
	    				  
	      Transport.send(message);
}

		
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
	      Transport.send(message);*/	
 %>
 <%
 response.sendRedirect("/sbs/class/index.jsp");
}catch (NullPointerException e) {
    e.printStackTrace();
    
} catch (Exception e) {
    e.printStackTrace();
}   finally{
	 
	if(assignSTAT!=null)
		try {
			assignSTAT.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
%>