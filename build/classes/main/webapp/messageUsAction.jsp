<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String subject=request.getParameter("subject");
String body=request.getParameter("body");
String status="unread";
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into message (email,subject,body,status)values(?,?,?,?)");
	ps.setString(1,email);
	ps.setString(2,subject);
	ps.setString(3,body);
	ps.setString(4,status);
	ps.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
	}
catch(Exception e)
{
	response.sendRedirect("messageUs.jsp?msg=invalid");
	}
%>