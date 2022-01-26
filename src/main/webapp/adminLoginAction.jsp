<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password))
{
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}
else
{
		response.sendRedirect("adminLogin.jsp?msg=notexist");
	
}
%>