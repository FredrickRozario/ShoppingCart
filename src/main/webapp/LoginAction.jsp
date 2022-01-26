<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");


	int z=0;
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select *from users where email='"+email+"'and password='"+password+"' ");
		while(rs.next())
		{
			response.sendRedirect("home.jsp");
			session.setAttribute("email", email);
			z=1;
		}
		if(z==0)
		{
			response.sendRedirect("login.jsp?msg=notexist");
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
	}
%>