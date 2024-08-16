

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.responsive-img{


height:auto;
background-repeat:no-repeat;
background-size:cover;

}
.backimg {
            
        
           /* Adjust height as needed */
             height:auto;
            background-size: cover;
            text-align: center;
            display: flex;
            justify-content: center; 
            align-items: center; 
             flex-direction:column; 
        }

       

.tag {
font-weight:bold;
background-color:black;
opacity:50%;
width:20vw;
text-align:center;
height:20vh;
padding-top:130px;
 position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white; /* Adjust text color as needed */
            text-align: left;
}

.tag p{

font-size:3vw;
font-weight:bold;
color :white;

}
.buttons .btc{

font-size:2vw;
font-weight:bold;
background-color:black;
color:white;
}
.buttons .btc:hover{
background-color:white;
color:black;
}



</style>
<meta charset="ISO-8859-1">


<title>Home page</title>





</head>
<body>
<%@include file="repeated_components/Navbar.jsp" %>


  

<div class="container-fluid  ">
<div class="backimg">
<img src="img/Name.png""  class="responsive-img">
<div class="buttons">
<a href="register.jsp" class="btn btc mt-2 mb-2" type="submit "><i class="fa fa-user-plus" aria-hidden="true" ></i>
         Register</a>
         <a href="login.jsp"  class="btn btc" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true" ></i>
         login</a>
 </div>
<!-- <div class="tag  text-center">
<!--  <p class="logo">Note it using JOTit</p>
<div class="buttons">
<a href="register.jsp" class="btn btc mt-2 mb-2" type="submit "><i class="fa fa-user-plus" aria-hidden="true" ></i>
         Register</a>
         <a href="login.jsp"  class="btn btc" type="submit"><i class="fa fa-user-circle-o" aria-hidden="true" ></i>
         login</a>
 </div>
 </div>
 <%@include file="repeated_components/Footer.jsp" %>
 </div>-->
  
 
  
 </div>
  


</body>
</html>