<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>
<div class="container_fluid  ">
<div class ="row">
<div class="col-md-4 offset-md-4">
<div class="card mt-5 ">
<div class="card-header text-center bg-custom ">
<i class="fa fa-user-circle fa-3x" aria-hidden="true"></i>

<h4>Login</h4>
</div>

<div class="card-body">
<% 
String loginfail = (String)session.getAttribute("lo-fail");
if(loginfail != null){
%>
<div class="alert alert-danger" role="alert">
  <%=loginfail  %>
</div>

<%
 session.removeAttribute("lo-fail");
}
%>
<% 

String withoutlogin = (String)session.getAttribute("login-error");
if(withoutlogin != null){
%>
<div class="alert alert-danger" role="alert"><%=withoutlogin%>
</div>

<%
 session.removeAttribute("login-error");
}
%>
<% 

String logoutmsg = (String)session.getAttribute("logout-msg");
if(logoutmsg != null){
%>
<div class="alert alert-success" role="alert"><%=logoutmsg%>
</div>

<%
 session.removeAttribute("logout-msg");
}
%>






   <form action="UserLogin" method="post">
   
  <div class="mb-3">
    <label>Enter Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="lmail">
      </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Enter Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="lpass">
  </div>
 
  <button type="submit" class="btn btn-primary  d-grid gap-2 col-6 mx-auto">Login</button>


</div>
</div>
</div>

</div>


</div>



</body>
</html>