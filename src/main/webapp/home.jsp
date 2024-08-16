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
<style type="text/css">


#background-video{
height:auto;
margin:auto;
max-width:300px;

}
.box1{
width:20 vw;
display: flex;
 justify-content: center;
 align-items: center;
 flex-direction:column;
}
.button{
color:#009688;
background-color:#F6BBB7;
padding:10px;
border-radius:10px;

}
#background-video{
border-radius:20px;
}
.but{
margin:25px 0px;
}

#btn2{
background-color:#F07C5D;
}
.ima{
display:flex;
margin-top:50px;
}
.ima1 {
margin:0px 100px;}

@media(max-width: 800px) {
  .ima{
  flex-direction:column;
  }
}

</style>



<meta name="viewport"  content="width=device-width , initial-scale=1" charset="ISO-8859-1" >

<title>Home Page</title>

</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>

<div class="box1">
<div class=" text-center">


<div class="ima">
<div class="ima1">
<video id="background-video" class="vid" autoplay loop muted ">
  <source src="img/homebg2.mp4" type="video/mp4">
</video>
<div class= "but">
  <a class="button" href="Addnotes.jsp"  class="btn btc" type="submit">Start</a>
  </div>
  </div>
 <div class="ima1">
<video id="background-video" autoplay loop muted ">
  <source src="img/event.mp4" type="video/mp4">
</video>
<div class= "but">
 
   <a class="button" href="Calendar.jsp"  class="btn btc" type="submit" id="btn2">Start</a>
</div>
</div>

</div>


</div>
</div>
</div>



</body>
</html>