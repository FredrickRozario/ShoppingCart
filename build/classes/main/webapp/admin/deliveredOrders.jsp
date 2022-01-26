<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; margin-left:20px; font-size:30px; display:inline-block;">Delivered Orders <i class='fas fa-dolly'></i></div>
<a href="generateCSV.jsp?csvpage=4"><div style="color: white; margin-right:20px; float:right; font-size: 30px; display:inline-block;">Generate CSV <i class='fas fa-file-csv'></i></div></a>
<%
String msg=request.getParameter("msg");
if("cancel".equals(msg))
{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%} %>
<%
if("done".equals(msg))
{
%>
<h3 class="alert">Successfully Updated!</h3>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>

<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th>Order Date</th>
             <th>Expected Delivery Date</th>
             <th>Payment Method</th>
              <th>T-ID</th>
              <th>Status</th>
          </tr>
        
        <%        
try
{
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered' order by cart.orderDate desc");
	while(rs.next())
	{
		sno=sno+1;
%>
          <tr>
          <td><%=rs.getString(11) %></td>
            <td><%=rs.getString(18) %></td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i>  <%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
               <td><%=rs.getString(8) %></td>
                <td><%=rs.getString(9) %></td>
                 <td><%=rs.getString(10) %></td>
             <td><%=rs.getString(12) %></td>
              <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
               <td><%=rs.getString(15) %></td>
               <td><%=rs.getString(16) %></td>
              </tr>
          <%
	}
}
catch(Exception e)
{
	System.out.println(e);
	}
%>
        </table>
      <br>
      <br>
      <br>

</body>
</html>