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
     ResultSet getClassEventsRSET =null;
 %>
	<%
	
	if(session.getAttribute("REGISTER_NUMBER") == null){
		response.sendRedirect("/sbs/index.jsp");
	}else if(session.getAttribute("USER_CATEGORY") == "SUPER ADMIN"){
		response.sendRedirect("/sbs/class/index.jsp");
	}
%>
<style>
	option,#topicId,btn
	{
	font-family:'Lilita One', cursive;
	}
	
	#details_header
	{
    width: 100%;
    height: 35px;
    font-weight: bold;
    text-align: center;
    background: #223260;
    color: white;
    font-family: 'Lilita One', cursive;;
    font-size: 24px;
    border-radius: 7px;
	}
</style>
	<script>
		function	submitTopic()
		{
			var topic;
			topic = document.getElementById("topicId").value;
			if(topic == 0)
				{
					alert("Please select topic");
					return false;
				}
			
			}	
		function show_hide(option)
		{
				if(option != 0)
				{
					document.getElementById('show').style.display = "block";
				}
				else
				{
					document.getElementById('show').style.display = "none";	
					document.getElementById("details_show").innerHTML="";
				    return;
				}
				if (window.XMLHttpRequest) {
				    // code for IE7+, Firefox, Chrome, Opera, Safari
				    xmlhttp=new XMLHttpRequest();
				  } else { // code for IE6, IE5
				    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
				  }
				  xmlhttp.onreadystatechange=function() {
				    if (this.readyState==4 && this.status==200) {
				      document.getElementById("details_show").innerHTML=this.responseText;
				      
				    }
				  }
				  xmlhttp.open("GET","getDetails.jsp?id="+option.value,true);
				  
				  
				  xmlhttp.send();
			}
		</script>
		
	
	
	<head>
		
		<link rel="stylesheet" href="/sbs/css/bootstrap.css">
		<link rel="stylesheet" href="/sbs/css/home.css">
		<link rel="stylesheet" href="/sbs/css/w3.css">
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
		<link href="https://fonts.googleapis.com/css?family=Lilita+One" rel="stylesheet">
		
   
   
    <script type="text/js">
		
		  webshims.setOptions('waitReady', false);
		  webshims.setOptions('forms-ext', {types: 'date'});
		  webshims.polyfill('forms forms-ext');
		</script>

			<title>CAPS Learning and Sharing Sessions - Class Session</title>
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
						
						<li class="navbar-inverse navbar-text" style="background:#303f9e;color:white;">Welcome  <%= session.getAttribute("USER_NAME") %></li>
						
						<li><a href="/sbs/logout.jsp" style="color:white">Log Out</a></li>
					</ul>
				</div>
			</div>

		</nav>
		<script>			   
	        $(document).ready(function () {
	        	$("#txtDate").datepicker({
	                minDate: '3',
	                dateFormat: 'yy-mm-dd' 
	            });
	            $('#startTime').timepicker({
	            	'minTime': '09:00am',
	            	'maxTime': '05:00pm',
	            	'step': 15,
	            	'timeFormat': 'H:i'
	            });

                
				var  previous = $('#startTime').val();
                $('#startTime').on('changeTime', function() {
                	
                	$('#endTime').timepicker({
                        'minTime': '09:00am',
                        'maxTime': '06:00pm',
                        'step': 15,
                        'timeFormat': 'H:i',
                        'showDuration': true
                    });
                    $('#endTime').timepicker('option', 'minTime', $(this).val());
                    if($('#startTime').val() >= $('#endTime').val()   &&  $('#endTime').val() != "")
                    	{ 
                    		alert("Start Time Is greater than End Time");
                    		
                    		$('#startTime').val(previous);
                    	}
                    previous = $('#startTime').val();
                    
                });
                $('#endTime').on('changeTime', function() {
                	if($('#startTime').val() >= $('#endTime').val()  )
                	{
                		alert("End Time is equal to Start Time");
                		
                	}
                });
               
	        	
	        });
			$(document).ready(function(){
				$('#show').css({"font-family": "'Lilita One', cursive","color":"white"});
				$('#details_show').css({"font-family":"'Lilita One', cursive","color":"white","background-color":"#223260","margin-bottom":"10px","border-radius":"5px","font-size":"15px"});
			});
    </script>
     <% try{
			 getClassEventsSTAT = connection.createStatement();
			  getClassEventsRSET = getClassEventsSTAT.executeQuery("select * from class_topics ");
		%>	
		<div class="container" style="color: #fff">
			<form name="f1" id="topic_form" action="getInfo.jsp" method="post" autocomplete="off">
			<div class="panel panel-header" style="	font-family:'Lilita One', cursive;margin-bottom: 0px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 15px; border-top-left-radius: 15px; background-color: #223260; color: #cc982d; padding: 15px;">
				<strong>Choose Topic</strong>
			</div>
						  
			<div class="panel panel-default" style="background-color: rgba(55, 55, 55, .80); border: 0px; padding: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px; border-top-right-radius: 0px; border-top-left-radius: 0px; text-align: center; overflow: auto;">
				 <div id="details_header">Topics </div>
				 <br>
				 			<div id = "details_show" ></div>
				 <select  class="form-control" name="topicId" id="topicId" style="margin-top: 15px; margin-right: 15px; background-color: rgba(0, 0, 0, 0); color: #aaa;" onchange = "show_hide(this)">
							<option  value="0" style="color: #000;" selected disabled>---Select Topics---</option>
							<%
									while(getClassEventsRSET.next()){%>
										 <option  style="color: #000" value="<%=getClassEventsRSET.getString(1)%>"><%=getClassEventsRSET.getString(2)%></option>
								<% }
								
							 %>		
				</select>
				
	<div id = "show" style = "display :none">	
				<br>
			  	Date :
			    <input id="txtDate" type="text" name = "Date"  style="	font-family:'Lilita One', cursive;outline:none;border-radius:5px;width: 115px; background-color: rgba(0, 0, 0, 0); color: #fff;" required >
			    From Time:
			    <input id="startTime" type = "text" name  = "Start_Time"  style=" 	font-family:'Lilita One', cursive;outline:none;border-radius:5px;width: 115px; background-color: rgba(0, 0, 0, 0); color: #fff;" required>
			    To Time :
			    <input id="endTime" type = "text" name  = "End_Time"  style="	font-family:'Lilita One', cursive; outline:none;border-radius:5px;width: 115px; background-color: rgba(0, 0, 0, 0); color: #fff;" required>
	</div>
						
						
						<br>
						<button class="btn btn-success"onclick="return submitTopic()">Submit</button>
				
			</div>
			</form>
		</div>
				
	</body>
		
</html>
		
<%}
					        catch(SQLException se){
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
					        	 
					        	}
					        
							%>
							


