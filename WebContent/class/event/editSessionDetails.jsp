<html>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="event.TimeSlot" %>
	<%@page import="java.lang.reflect.Array"%>
<%@ page import ="javax.sql.*" %>
<%@page import="com.daniel.util.DbUtil"%>
<%@ page import="com.daniel.util.DbUtil.*" %>
<%
Connection connection=DbUtil.getConnection();

%>
  <%! 
     java.sql.Statement getClassEventsSTAT =null;
  java.sql.Statement getClassEventsTopicsSTAT =null;
     ResultSet getClassEventsRSET =null;
     ResultSet getClassEventsTopicsRSET =null;
     int k = 0;
 %>
	<%
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") != "SUPER ADMIN"){
		response.sendRedirect("/sbs/class/index.jsp");
	}
	%>

	<head>
	<style>
		body
	{
		overflow-y:scroll !important;
	}
	</style>
		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
		<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
		<link rel="stylesheet" href="http://jonthornton.github.io/jquery-timepicker/jquery.timepicker.css" type="text/css" />
		<!-- <jQuery library > -->
		<script src=" https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/extras/modernizr-custom.js"></script>
		<script src="http://cdn.jsdelivr.net/webshim/1.12.4/polyfiller.js"></script>
		 
   	 <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
   	 <script src="http://jonthornton.github.io/jquery-timepicker/jquery.timepicker.js"></script>
   	 <script src="/sbs/js/bootstrap.js" type="text/javascript"></script>
		<script src="/sbs/js/home.js" type="text/javascript"></script>
		 
   	 <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
		<script>
		  webshims.setOptions('waitReady', false);
		  webshims.setOptions('forms-ext', {types: 'date'});
		  webshims.polyfill('forms forms-ext');
		</script>
		
		
		

		<title>CAPS Learning and Sharing Sessions - Class Session</title>
		<script>
				
			function	update()
			{
				id = arguments[0];
				
				valuee = arguments[1];
				name = arguments[2];
				if(confirm("You Are Going to update :-"+arguments[3]))
				 {
					 if (window.XMLHttpRequest)
					 {
					    // code for IE7+, Firefox, Chrome, Opera, Safari
					    xmlhttp=new XMLHttpRequest();
					  } else { // code for IE6, IE5
					    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					  }
					  
					  
					  xmlhttp.open("GET","check.jsp?id="+id+"&val="+valuee+"&name="+name+"&cc=0",true);
				
					 xmlhttp.send(); 
					 setTimeout(function(){
					       window.location.href = 'editSessionDetails.jsp';
					    }, 100);
				}	
				else
				{
					setTimeout(function(){
					       window.location.href = 'editSessionDetails.jsp';
					    }, 50);
				}
			}
			
		</script>
	</head>
	<style>
	body
	{
	font-family:'lilita one',cursive;
	}
	</style>
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
						
						<li class="navbar-inverse navbar-text">Welcome <%=session.getAttribute("USER_NAME")%></li>
						
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		<script>			   
	        $(document).ready(function () {
	        	$("input[name = 'Date']").datepicker({
	                minDate: '3',
	                dateFormat: 'yy/mm/dd' 
	            });
	            $("input[name = 'Start Time']").timepicker({
	            	'minTime': '09:00am',
	            	'maxTime': '05:00pm',
	            	'step': 15,
	            	'timeFormat': 'H:i'
	            });
	            $("input[name = 'End Time']").timepicker({
                    'minTime': '09:00am',
                    'maxTime': '06:00pm',
                    'step': 15,
                    'timeFormat': 'H:i'
                    
                });
                
	
                $("input[name = 'Start Time']").on('changeTime', function() {
                	
                	if($('#startTime').val() >= $('#endTime').val()  )
                	{
                		alert("Start Time is Greater");
                	}
                	
                    
                });
                $("input[name = 'End Time']").on('changeTime', function() {
                	if($('#startTime').val() >= $('#endTime').val()  )
                	{
                		alert("Start Time is Greater");
                	}
                	
                });
               
	      
	        	$("button[name = 'modalclick']").click(function()
	    		{
	        		var id = this.value;
	        		alert(id);
	        		if (window.XMLHttpRequest) {
					    // code for IE7+, Firefox, Chrome, Opera, Safari
					    xmlhttp=new XMLHttpRequest();
					  } else { // code for IE6, IE5
					    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					  }
					  xmlhttp.onreadystatechange=function() {
					    if (this.readyState==4 && this.status==200) {
					      document.getElementById("modalB").innerHTML=this.responseText;
					      
					    }
					  }
					  xmlhttp.open("GET","check.jsp?id="+id+"&cc=1",true);
					  
					  
					  xmlhttp.send();			
	    		});
	        	

	        	});
    	</script>
	<div class="container" style="text-align: center; min-width: 100%;">
			<div class="panel panel-header" style="margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Tap To edit</strong>
			</div>
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">

			<%
			
				getClassEventsSTAT = connection.createStatement();
			getClassEventsTopicsSTAT = connection.createStatement();
			getClassEventsRSET = getClassEventsSTAT.executeQuery("select id, topic_name, event_date, start_time, end_time, booked_on, booker_name, venue ,status,class_topics_id from class_events  where  event_date >= now(); ");
			
					if((getClassEventsRSET.next())){
						getClassEventsRSET.beforeFirst();

			%>
			<form name="updateDetails" id="topic_form" action="check.jsp" method="post">

			<table class="table table-bordered" style="white-space: nowrap;">
	
				<thead style="color: #ffffff">
				<tr>
					
					<td>Topic
					<td width="15px">Date
					<td width="15px">Start Time
					<td width="15px">End Time
					<td width="15px">Booked By
					<td>Venue
					<td  width= "15px">Status
					<td width ="10px">Click For More Info 
					</tr>
				</thead>

				<%
				
				
				while(getClassEventsRSET.next())
				{	
					getClassEventsTopicsRSET = getClassEventsTopicsSTAT.executeQuery("select id,topic from class_topics");
					k++;
					getClassEventsTopicsRSET.next();
					
				%>
				
					<tr style="color: white" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;width:150px;" >
					<td>
						<select class="form-control"  style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;width:150px;" name = "Topic"  onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'topic_name',this.name)">
						
							<%
								
							getClassEventsTopicsRSET.beforeFirst();	
							while(getClassEventsTopicsRSET.next()){%>
								<option id="Topic<%=k%>"value="<%=getClassEventsTopicsRSET.getString(1) %>" <%if(getClassEventsTopicsRSET.getString(1).equals(getClassEventsRSET.getString(10))) out.println("selected='selected'"); %>  style="color: #000;" ><%=getClassEventsTopicsRSET.getString(2) %></option>
							<%} %>
						</select>
					</td>
					
					<td><input type = "text" id="eventDate" name = "Date" class="form-control" style="margin-top: 10px; margin-right: 10px; background-color: rgba(0, 0, 0, 0); color: #fff;width :100px" value = "<%=getClassEventsRSET.getString(3)%>" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'event_date',this.name)"></td>
					<td><input type = "text" id="startTime" name = "Start Time" class="form-control" style="margin-top: 10px; margin-right: 10px; background-color: rgba(0, 0, 0, 0); color: #fff;width :80px" value = "<%=getClassEventsRSET.getString(4)%>" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'start_time',this.name)"></td>
					<td><input type = "text" id="endTime"  name = "End Time" class="form-control" style="margin-top: 10px; margin-right: 10px; background-color: rgba(0, 0, 0, 0); color: #fff;width :80px" value = "<%=getClassEventsRSET.getString(5)%>" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'end_time',this.name)"></td>
					<td><input type = "text"  class="form-control"  name = "Booked By" style="margin-top: 10px; margin-right: 10px; background-color: rgba(0, 0, 0, 0); color: #fff;width :200px" value = "<%=getClassEventsRSET.getString(7)%>" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'booker_name',this.name)"></td>
					<td><input type = "text"  class="form-control" name = "Venue" style="margin-top: 10px; margin-right: 10px; background-color: rgba(0, 0, 0, 0); color: #fff;width :200px" value = "<%=getClassEventsRSET.getString(8)%>" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'venue',this.name)"></td>
					<td>
					
					<select  class="form-control" name="Status" id="volunteersID" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;width:150px;" onchange= "update(<%=getClassEventsRSET.getString(1)%>,this.value,'status',this.name)">
					
					<option  style = "width:100%;" value="3" <%if(getClassEventsRSET.getString(9).equals("confirmed")) out.println("selected='selected'"); %> style="color: #000;" >Confirmed</option>
					<option style = "width:100%;"  value="6" <%if(getClassEventsRSET.getString(9).equals("volunteer_assigned")) out.println("selected='selected'"); %>   style="color: #000;" >Volunteer Assigned</option>
					<option  style = "width:100%;" value="1" <%if(getClassEventsRSET.getString(9).equals("pending")) out.println("selected='selected'"); %> style="color: #000;" >Pending</option>
					</select>
					</td>
					 <td>
						 <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" name= "modalclick" id ="modalButton" value = "<%=getClassEventsRSET.getString(1)%>">Open Modal</button> 
					</td> 	
					</tr>
				
				
				
				<%} %>
				
			</table>
			 <div class="modal fade" id="myModal" role="dialog" >
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Details</h4>
        </div>
        <div class="modal-body" id = "modalB">
         
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> 
			
		
			
			<%
				}else{%>
				
					<strong style="color: white;">No data to display</strong>
			<%	}
			%>
			
				
			
			</form>
			

			</div>
		</div>
	</body>
</html>
