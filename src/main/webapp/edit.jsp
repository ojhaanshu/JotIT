
<%@page import="com.db.dbconnect" %>
<%@page import="com.user.post" %>
<%@page import="com.DAO.postDao" %>

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
<script src="https://cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
<%@include file="repeated_components/allcss.jsp" %>
</head>
<body>

<%
Integer noteid = Integer.parseInt(request.getParameter("note-id"));

postDao postd = new postDao(dbconnect.getConn());
post p = postd.getdatabyid(noteid);
%>

<%@include file="repeated_components/Navbar.jsp" %>


<div class="container-fluid">

<h1 class="text-center mt-3">Edit Your Notes</h1>

<div class="container">
<div class="row">

<div class="col-md-12">
<form action="EditNotesServlet" method="post">
<input type="hidden" value="<%=noteid%>" name="note">
<div class="mb-3">

  <label for="exampleFormControlInput1" class="form-label">Enter Title</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" required="required" value="<%=p.getTitle()%>">

</div>

<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Enter Content</label>
  <textarea class="form-control" id="editor" rows="11" name="content" ><%=p.getContent()%></textarea>
</div>
 
</div>
<div class="container text-center">
<button type="submit" class="btn-primary add">Edit</button>
</div>
</form>
<script>
        CKEDITOR.replace('editor', {
            toolbar: [
                { name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'Undo', 'Redo'] },
                { name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll'] },
                { name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', '-', 'RemoveFormat'] },
                { name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote'] },
                { name: 'links', items: ['Link', 'Unlink'] },
                { name: 'insert', items: ['Image', 'Table', 'HorizontalRule', 'SpecialChar'] },
                { name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize'] },
                { name: 'colors', items: ['TextColor', 'BGColor'] },
                { name: 'tools', items: ['Maximize'] }
            ]
        });
    </script>

</div>
</div>
</div>


</body>
</html>