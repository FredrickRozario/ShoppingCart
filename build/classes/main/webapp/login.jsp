
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
     <form action="LoginAction.jsp" method="post">
       <input type='email' name="email" placeholder='Enter Email'>
        <input type='password' name="password" placeholder='Enter password'>
       <input type='submit' value='Login' />
     </form>
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
    <%
String msg=request.getParameter("msg");
if("notexist".equals(msg))
{
%>
<h2>Incorrect Username or Password</h2>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h2>Some thing Went Wrong! Try Again !</h2>
<%} %>
    <h1>Get Shopping Go!<i class='fas fa-shopping-bag' style='color:black'></i></h1>
     <h3>We have groceries books and Electronics</h3>
     <div style='font-size: 20px;color:red'>
     <p>Explore our Products now <i class="fa fa-handshake-o" aria-hidden="true"></i></p>
     </div>
     
  </div>  
  </div> 




</body>
</html>