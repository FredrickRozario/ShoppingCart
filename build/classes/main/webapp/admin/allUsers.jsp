<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; margin-left:20px; font-size:30px; display:inline-block;">All Users <i class='fab fa-elementor'></i></div>
<a href="generateCSV.jsp?csvpage=5"><div style="color: white; margin-right:20px; float:right; font-size: 30px; display:inline-block;">Generate CSV <i class='fas fa-file-csv'></i></div></a>

<table>
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
             <th>Country</th>
          </tr>
        </thead>
        <tbody>
        <%        
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from users");
	while(rs.next())
	{
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
              <td><%=rs.getString(7) %></td>
            <td><%=rs.getString(8) %></td>
            <td><%=rs.getString(9) %></td>
              <td><%=rs.getString(10) %></td>
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