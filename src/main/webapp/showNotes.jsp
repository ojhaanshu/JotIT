<%@page import="com.user.post" %>
<%@page import="java.util.List" %>
<%@page import="com.db.dbconnect" %>
<%@page import="com.DAO.postDao" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
    <%
 userDetails user3 = (userDetails)session.getAttribute("userD");
 if(user3 == null){
	 response.sendRedirect("login.jsp");
	 session.setAttribute("login-error","Please, Login First...");
 }
 
 %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Show Notes</title>
</head>
<body>
<%@ include file="repeated_components/Navbar.jsp" %>

<% 

String updatemsg = (String)session.getAttribute("update_succ");
if(updatemsg != null)
{
%>
<div class="alert alert-success" role="alert"><%=updatemsg%></div>

<%
 session.removeAttribute("update_succ");
}
%>

<% 

String deletemsg = (String)session.getAttribute("delete-ms");
if(deletemsg != null)
{
%>
<div class="alert alert-success" role="alert"><%=deletemsg%></div>

<%
 session.removeAttribute("delete-ms");
}
%>

<div class="container">




<h2 class="text-center mt-3">All Notes</h2>
<div class="row">
<div class="col-md-12">

<%
if(user3 != null){
	postDao pd = new postDao(dbconnect.getConn());
	List<post> ob =pd.getData(user3.getId());
	for(post po :ob){
%>
<div class="card mt-3">
<img alt="" src="img/notes-2.png" class="card-img-top  mx-auto " style="max-width:100px;">
<div class="card-body p-4">



<h5 class="card-title"><%=po.getTitle()%></h5>
<p><%=po.getContent()%></p>

<p>
<b class="text-success">Published By :<%=user3.getName() %></b>
</br>
<b class="text-primary">Publish Date :<%= po.getPdate()%></b>
</p>

<div class="container text-center mt-2">
<a href="deleteServlet?note-id=<%=po.getId() %>" class="btn btn-danger">Delete</a>
<a href="edit.jsp?note-id=<%=po.getId()%>" class="btn btn-primary">Edit</a>


</div>
</div>
</div>

<%
}
}
%>
</div>

</div>
</div>
</body>
</html>