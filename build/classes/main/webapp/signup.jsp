<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
     <form method="post" action="signupAction.jsp">
       <input type='text' name="name" placeholder='Enter Name'>
       <input type='email' name="email" placeholder='Enter Email'>
       <input type='number' name="mobileNumber" placeholder='Enter Mobile Number'>
       <select name="securityQuestion">
       <option value="What was your first car?">What was your first car?</option>
       <option value="What is the name of your first pet?">What is the name of your first pet?</option>
       <option value="What elementary school did you attend?">What elementary school did you attend?</option>
       <option value="What is the name of the town where you were born?">What is the name of the town where you were born?</option>
       </select>
       <input type='text' name="answer" placeholder='Enter answer'  />
        <input type='password' name ="password" placeholder='Enter password'  />
       <input type='submit' value='Signup' />
     </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h1>Successfully Updated</h1>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>
    <h1>Get Shopping Go!<i class='fas fa-shopping-bag' style='color:black'></i></h1>
     <h3>We have groceries,books and Electronics</h3>
     <div style='font-size: 20px;color:red'>
     <p>Explore our Products now <i class="fa fa-handshake-o" aria-hidden="true"></i></p>
     </div>
  </div>
</div>

</body>
</html>