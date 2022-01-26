<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
String categ=request.getParameter("category");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try
{
	//find product
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where id='"+product_id+"'");
	while(rs.next())
	{
	product_price=rs.getInt(6);
	product_total=product_price;
	}
	
	
	ResultSet rs1=st.executeQuery("select *from cart where product_id="+product_id+" and email='"+email+"' and address is NULL");
	while(rs1.next())
	{
	cart_total=rs1.getInt(6);
	cart_total=cart_total+product_total;
	quantity=rs1.getInt(4);
	quantity=quantity+1;
	z=1;
	}
	if(z==1)
	{
	st.executeUpdate("update cart set total="+cart_total+",quantity="+quantity+" where product_id="+product_id+" and email='"+email+"' and address is NULL");
	if(categ.equals("Grocery Items"))
		response.sendRedirect("groceryItems.jsp?msg=exist");
	else if(categ.equals("Books"))
		response.sendRedirect("books.jsp?msg=exist");
	else if(categ.equals("Electronics"))
		response.sendRedirect("electronics.jsp?msg=exist");
	else
		response.sendRedirect("home.jsp?msg=exist");
	}
	//insert product first time
	if(z==0)
	{
	PreparedStatement ps=con.prepareStatement("insert into cart (email,product_id,category,quantity,price,total)values(?,?,?,?,?,?)");
	ps.setString(1,email);
	ps.setString(2,product_id);
	ps.setString(3,categ);
	ps.setInt(4,quantity);
	ps.setInt(5,product_price);
	ps.setInt(6,product_total);
	ps.executeUpdate();
	if(categ.equals("Grocery Items"))
		response.sendRedirect("groceryItems.jsp?msg=added");
	else if(categ.equals("Books"))
		response.sendRedirect("books.jsp?msg=added");
	else if(categ.equals("Electronics"))
		response.sendRedirect("electronics.jsp?msg=added");
	else
		response.sendRedirect("home.jsp?msg=added");
	}
	}
catch(Exception e)
{
	System.out.print(e);
	if(categ.equals("Grocery Items"))
		response.sendRedirect("groceryItems.jsp?msg=invalid");
	else if(categ.equals("Books"))
		response.sendRedirect("books.jsp?msg=invalid");
	else if(categ.equals("Electronics"))
		response.sendRedirect("electronics.jsp?msg=invalid");
	else
		response.sendRedirect("home.jsp?msg=invalid");
	}
%>