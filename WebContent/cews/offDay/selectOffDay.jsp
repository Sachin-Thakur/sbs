<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="event.TimeSlot" %>
	<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
	<%! 
	Connection connection=DbUtil.getConnection();
	  java.sql.Statement getBookedDatesSTAT =null;
	     ResultSet getBookedDatesRSET =null;
	     java.sql.Statement getExceptDatesSTAT =null;
	     ResultSet getExceptDatesRSET =null;
    Calendar curDate,curDate1 ;
 %>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") == "Student"){
		response.sendRedirect("/sbs/class/index.jsp");
	}

	
	%>

	<head>
		<!-- Latest compiled and minified CSS >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"-->

		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">

		<jQuery library >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

		<!-- Latest compiled JavaScript -->
		<script src="/sbs/js/bootstrap.js" type="text/javascript"></script>
		<script src="/sbs/js/home.js" type="text/javascript"></script>

		<!--script src="whatever.js" type="text/javascript"></script-->

		<title>CAPS Learning and Sharing Sessions - Class Session</title>
	</head>
	
	<body style="background-image: url(../res/otherback.jpg); background-size: cover;">
		
		<nav>

			<div class="navbar navbar-inverse" style="margin-bottom: 0; border-radius: 0px; border-bottom: 0px;background:#303f9e">
				<a href="https://christuniversity.in/caps/"><img src="/sbs/res/CAPS Logo White.png" style="float: left; width: 20%; margin-top: 2.25%; margin-bottom: 2.5%; margin-left: 15px; margin-right: 15px;"></a>
				<a href="https://christuniversity.in/"><img src="/sbs/res/logo_christ_new.jpg" style="float: right; width: 15%; margin-top: 1%; margin-bottom: 1%; margin-left: 15px; margin-right: 10px;"></a>
			</div>

			<div class="navbar navbar-inverse" style="border-radius: 0px; border-top: 0px;background:#303f9e">
				<div class="container-fluid">
					<div class="navbar-header">
						<a class="navbar-brand" href="/sbs/index.jsp" style="color:white">Session Booking System</a>
					</div>
					
					<ul class="nav navbar-nav navbar-right" style="color:white">
						<%
						out.println("   <li class=\"navbar-inverse navbar-text\">Welcome " + session.getAttribute("USER_NAME") + "</li>   ");
						%>
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		
		<div class="container" style="color: #fff">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Enter Session Details</strong>
				<button class="btn btn-default" style="float: right;" data-toggle="modal" data-target="#tip"><strong>?</strong></button>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				<%try{ %>
				<%
				

				curDate = Calendar.getInstance(); curDate1 =new GregorianCalendar();
				curDate.add(Calendar.DAY_OF_MONTH, 3);
				curDate1.add(Calendar.DATE, 11);
				getBookedDatesSTAT = connection.createStatement();
				getBookedDatesRSET = getBookedDatesSTAT.executeQuery("select event_date,start_time from class_events where status not in (3)" );
				getExceptDatesSTAT = connection.createStatement();
				getExceptDatesRSET =   getExceptDatesSTAT.executeQuery("select  exception_date,exception_start_time from class_exceptions ");
				
				
				List<TimeSlot> exceptSlots = new ArrayList<TimeSlot>();
					List<TimeSlot> workingSlots = new ArrayList<TimeSlot>();

					List<TimeSlot> holSlots = new ArrayList<TimeSlot>();
					List<TimeSlot> bookSlots = new ArrayList<TimeSlot>();

					int days = 0;

					while(getBookedDatesRSET.next()){
						TimeSlot sl = new TimeSlot( Integer.parseInt(getBookedDatesRSET.getString(1).substring(0, 4)),
							 Integer.parseInt(getBookedDatesRSET.getString(1).substring(5, 7)),
							 Integer.parseInt(getBookedDatesRSET.getString(1).substring(8)),
							 Integer.parseInt(getBookedDatesRSET.getString(2).substring(0, 2)),
							 Integer.parseInt(getBookedDatesRSET.getString(2).substring(3, 5)));

						exceptSlots.add(sl);
						bookSlots.add(sl);
					}

					getBookedDatesRSET.close();

					while(getExceptDatesRSET.next()){
						TimeSlot sl = new TimeSlot( Integer.parseInt(getExceptDatesRSET.getString(1).substring(0, 4)),
							 Integer.parseInt(getExceptDatesRSET.getString(1).substring(5, 7)),
							 Integer.parseInt(getExceptDatesRSET.getString(1).substring(8)),
							 Integer.parseInt(getExceptDatesRSET.getString(2).substring(0, 2)),
							 Integer.parseInt(getExceptDatesRSET.getString(2).substring(3, 5)));

						exceptSlots.add(sl);
						holSlots.add(sl);
					}

					getExceptDatesRSET.close();

					while(curDate.before(curDate1)){
						if(curDate.get(Calendar.DAY_OF_WEEK) != 1){
							for(int i=9; i<16; i++){
								if(i!=13){
									TimeSlot sl = new TimeSlot(curDate.get(Calendar.YEAR),
										(curDate.get(Calendar.MONTH) + 1),
										curDate.get(Calendar.DAY_OF_MONTH),
										i, 0);

									workingSlots.add(sl);
								}
							}
						}
						curDate.add(Calendar.DAY_OF_MONTH, 1);
					}

					for(int i=0; i<workingSlots.size(); i++){
						if(workingSlots.get(i).getDayOfWeek() == 7 && workingSlots.get(i).getHour()>12){
							workingSlots.get(i).setAvailability(false,0);
						}else{
							for(int j=0; j<exceptSlots.size(); j++){
								if(workingSlots.get(i).toString().equals(exceptSlots.get(j).toString())){
									workingSlots.get(i).setAvailability(false,0);
									break;
								}
							}
						}
					}
				%>
				<table class="table table-bordered" style="white-space: nowrap;">
					<thead>
					<%
						String prevDate = "";
						for(int i=0; i<workingSlots.size(); i++){
							if(!prevDate.equals(workingSlots.get(i).getShortDate())){
								int max = 0;
								boolean valid = true;

								if(workingSlots.get(i).getDayOfWeek() == 7){
									max = 4;
								}else{
									max = 6;
								}

								for(int j=0; j<max; j++){
									if(!workingSlots.get(i+j).isAvailable()){
										for(int k=0; k<bookSlots.size(); k++){
											if(workingSlots.get(i+j).toString().equals(bookSlots.get(k).toString())){
												valid = false;
												break;
											}
										}
									}
								}

								if(valid){
									out.print("<td><button class=\"btn");
									out.print(" btn-primary\" onclick=\"feedDateTime('" + workingSlots.get(i).getNumDate() + "', 'all day', 'date'); document.getElementById('date').submit();\">" + workingSlots.get(i).getShortDate());
									prevDate = workingSlots.get(i).getShortDate();
									out.println("</button></td>");
								}else{
									out.print("<td><button class=\"btn");
									out.print(" btn-warning\" onclick=\"alert('Date already contains a class.\\nCancel Session before adding as off day.');\">" + workingSlots.get(i).getShortDate());
									prevDate = workingSlots.get(i).getShortDate();
									out.println("</button></td>");
								}
							}
						}
					%>
					</thead>
					<%
						for(int i=9; i<16; i++){
							out.println("<tr>");
							if(i!=13){
								for(int j=0; j<workingSlots.size(); j++){
									if(workingSlots.get(j).getHour() == i){
										out.println(workingSlots.get(j).getSlotSubmit(1));
									}
								}
							}
							out.println("</tr>");
						}
					%>
				</table>
			</div>
		</div>
	</body>
	<form id="date" action="addOffDay.jsp" method="post">
		<input type="hidden" id="eventDate" name="eventDate">
		<input type="hidden" id="eventTime" name="eventTime">
	</form>
</html>
<div id="tip" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content" style="background-color: #223260; color: #fff;">
      <div class="modal-body">
        <p>Click on a Date to set it as Off Day</p><br>
        <p>Click on a Time Slot to set it as Off Hour</p>
      </div>
      <div class="modal-footer" style="border-top-color: #cc982d;">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<%}catch (SQLException se) {
    se.printStackTrace();
}

catch (NullPointerException e) {
    e.printStackTrace();
    
} catch (Exception e) {
    e.printStackTrace();
} finally {
   
    
    
    if (getBookedDatesRSET != null)
        try {
        	getBookedDatesRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

 
    if (getBookedDatesRSET != null)
        try {
        	getBookedDatesRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    
    
    if (getExceptDatesSTAT != null)
        try {
        	getExceptDatesRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    
    if (getExceptDatesRSET != null)
        try {
        	getExceptDatesRSET.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
   
}
%>