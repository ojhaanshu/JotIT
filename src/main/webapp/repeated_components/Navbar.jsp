
<%@page import ="com.user.userDetails" %>

    
  <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
     
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body class="p-3 m-0 border-0 bd-example m-0 border-0">

    <!-- Example Code -->
    
        
    <nav class="navbar navbar-expand-lg  bg-dark border-bottom border-body" data-bs-theme="dark" >
      <div class="container-fluid">
        <a class="navbar-brand" href="#" style="color:white;"><h1><strong>JOTit</strong></h1></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
          <a class="nav-link" aria-current="page" href="home.jsp" style="color:white;"><i class="fa fa-home" aria-hidden="true" "></i>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Addnotes.jsp" style="color:white;"><i class="fa fa-pencil-square-o" aria-hidden="true" ></i>Add Notes</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link " href="showNotes.jsp" tabindex="-1" aria-disabled="true" style="color:white;""><i class="fa fa-book" aria-hidden="true"></i>
          Show Notes</a>
        </li>
      </ul>
      
      <%
      
      userDetails user= (userDetails)session.getAttribute("userD");
      if(user != null){
    	  
      %>
  
      <a href="" class="btn btn-light me-2" data-bs-toggle="modal" data-bs-target="#exampleModal" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
       <%=user.getName() %> </a>
       
         <a href="logoutServlet" class="btn btn-light " type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
         logout</a>
         
          <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h1 class="modal-title fs-5 " id="exampleModalLabel" style="color:white;">User Profile</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <div class="container text-center " style="color:white;">
           <i class="fa fa-user-circle fa-4x" aria-hidden="true"></i>
           <h3></h3>
           <table class="table">
           <tbody>
           <tr>
           <th>User Id</th>
           <td><%=user.getId() %></td>
           </tr>
           <tr>
           <th>Full Name</th>
           <td><%=user.getName() %></td>
           </tr>
           <tr>
           <th>EMail Id</th>
           <td><%=user.getEmail() %></td>
           </tr>
           </tbody>
           </table>
     
      <div>
       <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
       </div>
        
      </div>
     
    </div>
  </div>
</div>
         
         
         <%
         }
      else {%>
     
         <a href="register.jsp" class="btn btn-light me-2" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
         Register</a>
         <a href="login.jsp" class="btn btn-light " type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
         login</a>
         
        
         <% } %>
     
    </div>
 </div>    
      
  


 
</nav>



      
    
  </body>
</html>