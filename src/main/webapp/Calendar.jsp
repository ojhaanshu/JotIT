<%@page import="java.util.List" %>
<%@page import="com.servlet.EventServlet" %>
<%@page import="com.user.userDetails" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"  content="width=device-width , initial-scale=1" charset="ISO-8859-1" >

<style type="text/css">

#calendar{
width :60vw;

margin:10px;
margin-top:10px;
}
.box{
display:flex;
justify-content: space-between;
align-items: stretch;
}

.fc-toolbar {
  background-color:white;
}

.fc-daygrid {
  background-color:N/A ;
  border:None;
  color:black;
}

#view{
 background-color: black;
margin:50px;
width :30vw;
 max-width: 100%;
height: auto;

color:white;
border-radius: 25px;
}

.viewbox{
margin:40px 0px 0px 0px;
display:flex;
flex-direction:column;
height:auto;
}
#date{
font-size:100px;
margin:0px;
padding:0px;
height:125px
}
#ye-mon{
font-size:20px;
margin:0px;
padding:0px;
}
#list{
margin-top:30px;
margin-left:auto;
width:170px;
align-items: center;
margin-right: auto;
}

.items{
color : white;
background-color:blue;
font-size:20px;
margin-right:auto;


//width:170px;
border-radius: 25px;

display: flex;
    justify-content: space-between;
    align-items: center;
    padding-left:10px;/* Optional: Add padding for better spacing */
    border-bottom: 1px solid #ccc; /* Optional: Add border for separation */
    position: relative;
}
#addEventt{

background-color:#76ff03;

width:100px;
border-radius: 25px;
font-color:#000;


}

#addEvent{
margin:40px;
}

#delbtn{
 margin-left: 30px;
  position: absolute;
    right: 10px;
}

#pic img{
 max-width: 100%;
    height: auto;
    display: block;
    margin-left: auto;
    margin-right: auto;
    }
  
  @media (max-width: 768px) {
    .fc .fc-toolbar {
        flex-wrap: wrap;
    }
    .fc .fc-toolbar-title {
        font-size: 1.2em;
    }
    .fc .fc-daygrid-event {
        font-size: 0.8em;
    }
    #calendar{
    margin:auto;
    }
    .box{
    flex-direction:column;
 }
 #view{
width :60vw;
}
  
 
</style>

<title>Note Event</title>


 <link href='https://unpkg.com/fullcalendar@5.10.2/main.min.css' rel='stylesheet' />
<script src='https://unpkg.com/fullcalendar@5.10.2/main.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
    
<%@include file="AddEvent.jsp" %>

</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>

<div class="container-fluid">
<%
userDetails ud = (userDetails)session.getAttribute("userD");

if(ud != null){
%>
<input type="hidden"  value="<%=ud.getId()%>" name="eid" id="inp">
<%
}
%>
<div class="box">
<div id="calendar"  style="width: 100%;"> </div>
<div id="view" class="text-center mx-auto" >
<div id="mes">
<% 

String add = (String)session.getAttribute("add_succ");
if(add != null)
{
%>
<div class="alert alert-success"   role="alert"><%=add%></div>

<%
 session.removeAttribute("add_succ");
}
%>
</div>
<div id="pic">
<img alt=""  src="img/Events here2.png " style="width:70vw; " class="mt-5">
</div>
<div class="viewbox mx-auto" >

<div id ="date" >
</div>
<div id="ye-mon">
</div>

<div id="list"  >

</div>

<div id="addEvent"  class="text-center" >
</div>


      
     

</div>
</div>
</div>
 
            



<script type="text/javascript">
var formattedDate
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth', // Default view
      contentHeight: 'auto',
      
      headerToolbar: {
    	  left:   'title',
    	  center: '',
    	  right:  'today prev,next'
      },
     
      eventClick: function(info) {
        alert('Event: ' + info.event.title);
        // You can add custom actions here
      },
     
      dateClick: function(info) {
    	  $('#mes').empty();
    	  $('#pic').empty();
    	  var clickedDate = moment(info.dateStr);
          var dayOfMonth = clickedDate.format('D');
          var formattedDateDisplay = clickedDate.format('MM YYYY , dddd '); // e.g., "Thursday, June 6, 2024"
          formattedDate = clickedDate.format('YYYY-MM-DD');
          $('#date').text(dayOfMonth);
          $('#ye-mon').text(formattedDateDisplay);
          var btn =$('#addEvent');
          $('#eventDateInput').val(formattedDate);
         var eid= $('#inp').val();
         console.log(eid);
          
          $('#addEvent').empty();
          $('#addEvent').append(' <a href="" id ="addeventt" class="btn btn-light " data-bs-toggle="modal" data-bs-target="#addEventModal" type="submit">Add Event</i> </a>');
          
         
         

         
          // Fetch events for the clicked date
          $.ajax({
              url: 'EventServlet', // URL of your server-side endpoint to fetch events
              method: 'GET',
              data: { date: formattedDate,
            	  id:eid},
              success: function(response) {
                  var events = response.eventNames; // Access the events property of the response
                  var eventList = $('#list');
                  eventList.empty();
                  if (events.length > 0) {
                      events.forEach(function(event) {
                    	  eventList.append('<li class="items">' + '<span class="event-text">' + event + '</span>' +  '<button type="button" id="delbtn" class="btn delete-btn"><i class="fa fa-times" aria-hidden="true"></i></button>' + '</li>');
                          
                      });
                  } else {
                      eventList.append('<li style="background-color:red; border-radius:25px ">No events </li>');
                  }
                  
              },
              error: function(xhr, status, error) {
                  console.error('Error fetching events:', error);
              }
          });
      }
  });
   
  calendar.render();
 

  $('#addEventt').on('click', function() {
      $('#addEventModal').modal('show');
  });
 $('#list').on('click', '#delbtn', function() {
      var clevent = $(this).siblings('.event-text').text();
      var listItem = $(this).closest('.items');

      $.ajax({
          url: 'deleteEvent',
          method: 'POST',
          data: {
              date: formattedDate, // Ensure 'formattedDate' is defined appropriately
              content: clevent
          },
          success: function(response) {
             
              listItem.remove(); // Remove the list item on successful deletion
          },
          error: function(xhr, status, error) {
              alert('AJAX error: ' + error);
          }
      });
      });
          
     
  });


  
 
</script>

</body>
</html>