<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; margin-left:20px; font-size:30px; display:inline-block;">My Orders <i class='fab fa-elementor'></i></div>
<a href="admin/generateCSV.jsp?csvpage=1"><div style="color: white; margin-right:20px; float:right; font-size: 30px; display:inline-block;">Generate CSV <i class='fas fa-file-csv'></i></div></a>

<table>
        <thead>
          <tr>
            <th>S.No</th>
            <th>Product Name</th>
            <th>category</th>
            <th><i class="fa fa-inr"></i>  Price</th>
            <th>Quantity</th>
            <th><i class="fa fa-inr"></i> Sub Total</th>
            <th>Order Date</th>
             <th>Expected Delivery Date</th>
             <th>Payment Method</th>
              <th>Status</th>
              
          </tr>
        </thead>
        <tbody>
        <%        
try
{
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL order by cart.orderDate desc");
	while(rs.next())
	{
		sno=sno+1;
%>
          <tr>
            <td><%out.print(sno); %></td>
            <td><%=rs.getString(18) %></td>
            <td><%=rs.getString(19) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(22) %></td>
            <td><%=rs.getString(4) %></td>
            <td><i class="fa fa-inr"></i>  <%=rs.getString(6) %></td>
             <td><%=rs.getString(12) %></td>
              <td><%=rs.getString(13) %></td>
               <td><%=rs.getString(14) %></td>
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
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>