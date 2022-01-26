<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="changeDetailsHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%} %>
<%        
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from users where email='"+email+"'");
	while(rs.next())
	{
%>

<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" name="address" type="text" value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" name="city" type="text" value="<%=rs.getString(8)%>" placeholder="Enter city" required>
<hr>
<h3>Enter State</h3>
<input class="input-style" name="state" type="text" value="<%=rs.getString(9)%>" placeholder="Enter State" required>
<hr>
<h3>Enter country</h3>
<input class="input-style" name="country" type="text" value="<%=rs.getString(10)%>" placeholder="Enter country" required>
<hr>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
  <%
	}
}
catch(Exception e)
{
	System.out.println(e);
	}
%>
</body>
<br><br><br>
</html>