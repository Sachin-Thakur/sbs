<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%@ page import="java.sql.*" %>
<%
	Connection connection=DbUtil.getConnection();
%>

<%!
	java.sql.Statement getTopicNameSTAT = null;
	java.sql.Statement updateDetailsSTAT =null;
	ResultSet getTopicNameRSET =null;
	java.sql.Statement getDetailsSTAT =null;
	ResultSet getDetailsRSET =null;
	
	String id,value,name,ctopicid,check;

%>
<%
try
{
	id = request.getParameter("id");
	value = request.getParameter("val");
	name = request.getParameter("name");
	check = request.getParameter("cc");
	updateDetailsSTAT = connection.createStatement();
		
	
	
	if(check.equals("0"))
	{
		if(name.equals("topic_name"))
		{	
				getTopicNameSTAT = connection.createStatement();
				getTopicNameRSET = getTopicNameSTAT.executeQuery("select topic from class_topics where id = "+value);
				getTopicNameRSET.next(); 
				updateDetailsSTAT.executeUpdate("update class_events set "+name+" = '"+getTopicNameRSET.getString(1)+"',class_topics_id= "+value+"  where id = "+id );
		}
		else
		{
			updateDetailsSTAT.executeUpdate("update class_events set "+name+" = '"+value+"' where id = "+id );
		}
	}
	else
	{
		getDetailsSTAT = connection.createStatement();
		getDetailsRSET = getDetailsSTAT.executeQuery(" select booker_name,booker_email,booker_phone,class_representative_name,class_representative_email,class_representative_phone,class_email,class_name from class_events where id =  "+ id);
		getDetailsRSET.next();
		 %>
		 <
		 <input type = "text" value = "<%=getDetailsRSET.getString(1) %>">
		 <input type = "text" value = "<%=getDetailsRSET.getString(2) %>"> 
		<input type = "text" value = "<%=getDetailsRSET.getString(3) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(4) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(5) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(6) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(7) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(8) %>">
		<input type = "text" value = "<%=getDetailsRSET.getString(9) %>">
			<%
	}	 
} 
catch(Exception e){e.printStackTrace();}  
%>

