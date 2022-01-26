<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String status="processing";

try
{
	//Update mobile number and update mobile number in users table
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update cart set status=? where email =? and status='bill'");
	ps.setString(1,status);
	ps.setString(2,email);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
	}
catch(Exception e)
{
	System.out.println(e);
	//response.sendRedirect("addressPaymentForOrder.jsp?msg=invalid");
	}
%>