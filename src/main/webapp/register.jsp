<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Registration Page</title>
</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>
<div class="container_fluid  ">
<div class ="row">
<div class="col-md-4 offset-md-4">
<div class="card mt-5 ">
<div class="card-header text-center bg-custom ">
<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
<h4>Registration</h4>
</div>

<%
String regsuccess = (String)session.getAttribute("rsuccess");
if(regsuccess != null){
%>
<div class="alert alert-success" role="alert">
 <%=regsuccess %> <a href="login.jsp">login here</a>
</div>

<%
session.removeAttribute("rsuccess");
}
%>
<%
String regfail = (String)session.getAttribute("rfail");
if(regfail != null){
%>
<div class="alert alert-danger" role="alert">
  <%=regfail %>
</div>

<%
session.removeAttribute("rfail");
}
%>


<div class="card-body">
   <form   action="UserServlet" method ="post">
   <div class="mb-3">
    <label>Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uname">
      </div>
  <div class="mb-3">
    <label>Enter Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="uemail">
      </div>
  <div class="mb-3">
    <label >Enter Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1"  name="upass">
  </div>
 
  <button type="submit" class="btn btn-primary  d-grid gap-2 col-6 mx-auto">Register</button>

</form>
</div>
</div>
</div>

</div>


</div>


</body>
</html>