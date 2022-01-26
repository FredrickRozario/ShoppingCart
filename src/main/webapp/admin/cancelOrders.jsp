<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String tid=request.getParameter("tid");
String email=request.getParameter("email");
String status="Cancelled";
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where transactionId='"+tid+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=cancel");
	}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	}
%>


