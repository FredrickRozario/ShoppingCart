<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String author=request.getParameter("author");
String genre=request.getParameter("genre");
String price=request.getParameter("price");
String active=request.getParameter("active");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update product set name='"+name+"',category='"+category+"',feature1='"+author+"',feature2='"+genre+"',price='"+price+"',active='"+active+"' where id='"+id+"'");
	
	if(active.equals("No"))
	{
		st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
	}
	response.sendRedirect("allBooksEditBooks.jsp?msg=done");
	}
catch(Exception e)
{
	System.out.print(e);
	response.sendRedirect("allBooksEditBooks.jsp?msg=wrong");
	}
%>