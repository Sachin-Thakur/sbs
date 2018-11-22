<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="event.TimeSlot" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	  java.sql.Statement insertSTAT =null;
	     ResultSet getBookedDatesRSET =null;
	     java.sql.Statement getExceptDatesSTAT =null;
	     ResultSet getExceptDatesRSET =null;
    Calendar curDate,curDate1 ;
 %>
<%
try{
	
	insertSTAT = connection.createStatement();

	String date = request.getParameter("eventDate"),
		time = request.getParameter("eventTime");

	int yr = Integer.parseInt(date.substring(0, 4)),
		mt = Integer.parseInt(date.substring(5, 7)),
		dt = Integer.parseInt(date.substring(8));

	TimeSlot temp = new TimeSlot(yr, mt, dt);

	int slots = 1;

	List<TimeSlot> slotList = new ArrayList<TimeSlot>();
	
	if(time.equals("all day")){
		if(temp.getDayOfWeek() == 7){
			for(int i=9; i<13; i++){
				TimeSlot t = new TimeSlot(yr, mt, dt, i, 0);

				slotList.add(t);
			}
		}else{
			for(int i=9; i<16; i++){
				if(i!=13){
					TimeSlot t = new TimeSlot(yr, mt, dt, i, 0);

					slotList.add(t);
				}
			}
		}
	}else{
		int hr = Integer.parseInt(time.substring(0, 2));

		TimeSlot t = new TimeSlot(yr, mt, dt, hr, 0);

		out.println(t.toString());

		slotList.add(t);
	}

	
	for(int i=0; i<slotList.size(); i++){
		insertSTAT.executeUpdate("insert into class_exceptions values('" + slotList.get(i).getNumDate() + "', '" + slotList.get(i).getNumTime() + "', '" + slotList.get(i).getNumTimeEnd(1, 0) + "')");
	}

	response.sendRedirect("/sbs/class/index.jsp");
}catch(Exception e){
	out.println(e);
}
%>