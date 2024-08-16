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
<script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
<style type="text/css">
.add{
background-color:#009688;
}
</style>

<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="repeated_components/allcss.jsp" %>
</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>


<div class="container-fluid">

<h1 class="text-center mt-3">Add Your Notes</h1>

<div class="container">
<div class="row">

<div class="col-md-12">
<form action="AddNotesServlet" method="post">
<div class="mb-3">
<%
userDetails us = (userDetails)session.getAttribute("userD");

if(us != null){
%>
<input type="hidden"  value="<%=us.getId()%>" name="uid">
<%
}
%>
  <label for="exampleFormControlInput1" class="form-label">Enter Title</label>
  <input type="text" class="form-control" id="exampleFormControlInput1" name="title" required="required">

</div>

<div class="mb-3">
  <label for="exampleFormControlTextarea1" class="form-label">Enter Content</label>
  <textarea class="form-control exampleFormControlTextarea1" id="editor" rows="11" name="content" required="required"></textarea>
</div>
 
</div>
<div class="container text-center">
<button type="submit" class="btn-primary add">Add</button>
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