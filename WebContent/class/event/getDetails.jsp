<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%@ page import="java.sql.*" %>
<%
	Connection connection=DbUtil.getConnection();
%>
<%!
	java.sql.Statement getDetailsSTAT =null;
	ResultSet getDetailsRSET =null;

%>
<%
try
{
String id = request.getParameter("id");

getDetailsSTAT = connection.createStatement();
getDetailsRSET = getDetailsSTAT.executeQuery("select description,details from class_topics where id ="+id);
getDetailsRSET.next();
out.println(getDetailsRSET.getString(1));
out.println("<br>"+getDetailsRSET.getString(2));


}catch(Exception e){e.printStackTrace();}  
%>
