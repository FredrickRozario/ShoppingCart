<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>
<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table>
<thead>
<%
try
{
	int total=0;
	int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}
	%>
          <tr>
            <th style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.print(total); %></th>
            <%if(total>0){%><th><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%}%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th>S.No</th>
            <th>Product Name</th>
            <th>Category</th>
            <th><i class="fa fa-inr"></i> price</th>
            <th>Quantity</th>
            <th>Sub Total</th>
            <th>Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
	ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'and cart.address is NULL ");
	while(rs.next())
	{
%>
          <tr>
          <%sno=sno+1; %>
           <td><%out.println(sno);%></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(6) %></td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rs.getString(11) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(13) %></td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getInt(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
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