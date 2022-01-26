<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String status="read";
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update message set status='"+status+"' where id='"+id+"' ");
	response.sendRedirect("messagesReceived.jsp?msg=read");
	}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("messagesReceived.jsp?msg=invalid");
	}
%>

