<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String deviceType=request.getParameter("deviceType");
String powerRating=request.getParameter("powerRating");
String price=request.getParameter("price");
String active=request.getParameter("active");
try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?)");
	ps.setString(1,id);
	ps.setString(2,name);
	ps.setString(3,category);
	ps.setString(4,deviceType);
	ps.setString(5,powerRating);
	ps.setString(6,price);
	ps.setString(7,active);
	ps.executeUpdate();
	response.sendRedirect("addNewElectronics.jsp?msg=done");
	}
catch(Exception e)
{
	response.sendRedirect("addNewElectronics.jsp?msg=wrong");
	}
%>