
<%@page import="finalFile.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp"%>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}%>
<form action="addNewBookAction.jsp" method="post">
<h3 style="color: yellow;">Product ID: <%out.println(id); %></h3>
<%
	}
catch(Exception e)
{}
%>
<input type="hidden" name="id" value="<% out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" name="name" type="text" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Category</h3>
<select class="input-style" name="category">
       <option value="Books">Books</option>
       </select>
<hr>
</div>

<div class="left-div">
 <h3>Enter Author/Authors</h3>
 <input class="input-style" name="author" type="text" placeholder="Enter Author" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Genre</h3>
 <input class="input-style" name="genre" type="text" placeholder="Enter Genre" required>

<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" name="price" type="text" placeholder="Enter Price" required>
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
</body>
<br><br><br>
</body>
</html>