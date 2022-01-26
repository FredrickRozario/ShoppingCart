
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form action="adminLoginAction.jsp" method="post">
       <input type='email' name="email" placeholder='Enter Email'>
        <input type='password' name="password" placeholder='Enter password'>
       <input type='submit' value='Login' />
     </form>
  </div>
  <div class='whysignLoginAdmin'>
    <%
String msg=request.getParameter("msg");
if("notexist".equals(msg))
{
%>
<h2>Incorrect Username or Password</h2>
<%} %>
    <h1>Get Shopping Go!<i class='fas fa-shopping-bag' style='color:black'></i></h1>
     <h3>We have orders to deal with, Get your work started admin <i class="fa fa-thumbs-up" style="font-size:36px;color:red"></i></h3>
     
     
  </div>  
  </div> 




</body>
</html>