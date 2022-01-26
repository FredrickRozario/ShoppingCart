<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
<%
String msg=request.getParameter("msg");
if("read".equals(msg))
{
%>
<h3 class="alert">Sent to user complaints team</h3>
<%} %>

<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Subject</th>
            <th>Body</th>
            <th>status</th>
          </tr>
        </thead>
        <tbody>
        <%        
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from message where status='unread'");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><a href="readMessages.jsp?id=<%=rs.getString(1)%>">read <i class='fas fa-check'></i></a></td>
            
          </tr>
          <%
	}
}
catch(Exception e)
{
	System.out.println(e);
	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>