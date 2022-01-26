<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<script>
if(window.history.forward(1) != null)
                 window.history.forward(1);
</script>
</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
          <th><a href="home.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th style="background-color: yellow;">Total: <i class="fa fa-inr"></i> <%out.print(total); %></th>
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
            <td> <%=rs.getString(11) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(13) %></td>
            </tr>
          <%
	}
		ResultSet rs2=st.executeQuery("select *from users where email='"+email+"'");
		while(rs2.next())
		{
%>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Enter Address</h3>
 <input class="input-style" name="address" type="text"  value="<%=rs2.getString(7)%>" placeholder="Enter Address" required>
 </div>

<div class="right-div">
<h3>Enter city</h3>
 <input class="input-style" name="city" type="text"  value="<%=rs2.getString(8)%>" placeholder="Enter city" required>
</div> 

<div class="left-div">
<h3>Enter State</h3>
<input class="input-style" name="state" type="text"  value="<%=rs2.getString(9)%>" placeholder="Enter State" required>
</div>

<div class="right-div">
<h3>Enter country</h3>
<input class="input-style" name="country" type="text" value="<%=rs2.getString(10)%>" placeholder="Enter country" required>

</div>
<h3 style="color: red">*The address you set will be saved/updated to your profile in our database</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
  <select class="input-style" name="paymentMethod">
       <option value="Cash on delivery (COD)">Cash on delivery(COD)</option>
       <option value="UPI Transaction">UPI Transaction</option>
       <option value="Net Banking">Net Banking</option>
       </select>
</div>

<div class="right-div">
<h3>Mobile Number</h3>
<input class="input-style" type="number" name="mobileNumber" value="<%=rs2.getString(3)%>" placeholder="Enter Mobile Number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<hr style="width: 100%">


<div class="left-div">
<button class="button">Procced to Generate Bill & Save <i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
  <%
	}
}
catch(Exception e)
{
	System.out.println(e);
	}
%>
      <br>
      <br>
      <br>

</body>
</html>