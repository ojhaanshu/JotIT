<%@page import="com.user.userDetails" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
 userDetails user1 = (userDetails)session.getAttribute("userD");
 if(user1 == null){
	 response.sendRedirect("login.jsp");
	 session.setAttribute("login-error","Please, Login First...");
 }
 
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
 
<div class="modal fade" id="addEventModal" tabindex="-1" role="dialog" aria-labelledby="addEventModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addEventModalLabel">Add Event</h5>
              
            </div>
            <div class="modal-body">
                <form  action="AddEvent" method="post">
                <%
userDetails is = (userDetails)session.getAttribute("userD");

if(is != null){
%>
<input type="hidden"  value="<%=is.getId()%>" name="eid" id="inp">
<%
}
%>
                
                    <div class="form-group">
                        <label for="eventDateInput">Date</label>
                        <input type="text" class="form-control" id="eventDateInput" name="date" readonly>
                    </div>
                    <div class="form-group">
                        <label for="eventDescription">Event Description</label>
                        <textarea class="form-control" id="eventDescription" rows="3" name="event" ></textarea>
                    </div>
                    <button type="button" class="btn btn-secondary mt-2" data-bs-dismiss="modal">Close</button>
                    
                    <button type="submit" class="btn btn-primary mt-2">Add Event</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>