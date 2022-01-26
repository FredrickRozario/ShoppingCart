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
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+category+"',feature1='"+deviceType+"',feature2='"+powerRating+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	
	if(active.equals("No"))
	{
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allElectronicsEditElectronics.jsp?msg=done");
	}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("allElectronicsEditElectronics.jsp?msg=wrong");
	}
%>