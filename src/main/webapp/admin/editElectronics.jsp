<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allElectronicsEditElectronics.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where id='"+id+"'");
	while(rs.next())
	{
	%>
<form action="editElectronicsAction.jsp" method="post">
<input type="hidden" name="id" value="<% out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" name="name" value="<%=rs.getString(2) %>" type="text" required>
<hr>
</div>

<div class="right-div">
<h3>Category</h3>
   <select class="input-style" name="category">
       <option value="Electronics">Electronics</option>
       </select>
       </div>

<div class="left-div">
 <h3>Enter Device Type</h3>
 <input class="input-style" name="deviceType" value="<%=rs.getString(4) %>" type="text" required>
<hr>
</div>

<div class="right-div">
<h3>Enter power rating</h3>
  <select class="input-style" name="powerRating">
       <option value="5-star">5-star</option>
       <option value="4-star">4-star</option>
        <option value="3-star">3-star</option>
         <option value="2-star">2-star</option>
          <option value="1-star">1-star</option>
           <option value="no rating">no rating</option>
       </select>

<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" name="price" value="<%=rs.getString(6) %>"type="number" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   <select class="input-style" name="active">
       <option value="Yes">Yes</option>
       <option value="No">No</option>
       </select>
<hr>
</div>
<button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
	}
	}
catch(Exception e)
{}
%>
</body>
<br><br><br>
</body>
</html>