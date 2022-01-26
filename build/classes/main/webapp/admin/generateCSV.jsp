<%@ page import="java.io.*,java.util.*,java.sql.*" %> 
<%@ page import="finalFile.ConnectionProvider"%>
<%
String csvpage=request.getParameter("csvpage");
String email=session.getAttribute("email").toString();
int sno=0;

if(csvpage.equals("1"))
{
try
{

String filename="My_Orders "+email+".csv";
Connection con=ConnectionProvider.getCon();
Statement stmt=con.createStatement();
 String qry = "select *from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.orderDate is not NULL";
 ResultSet rs= stmt.executeQuery(qry);
	response.reset();
	response.setContentType("application/text");
	response.setHeader("Content-disposition","attachment; filename=" +filename);
	  ArrayList<String> rows = new ArrayList<String>();
	  rows.add(",,,,,,My Orders");
	  rows.add("\n");
	  rows.add("\n");
       rows.add("S.No,PRODUCT_NAME,CATEGORY,PRICE,QUANTITY,SUB_TOTAL,ORDER_DATE,EXPECTED_DELIVERY_DATE,PAYMENT_METHOD,STATUS");       
       rows.add("\n");
		while(rs.next())
		{
			sno=sno+1;
			  rows.add(" "+sno+" ,"+rs.getString(18)+","+rs.getString(3)+","+rs.getString(5)+","+rs.getString(4)+","+rs.getString(6)+","+rs.getString(12)+","+rs.getString(13)+","+rs.getString(14)+","+rs.getString(16)+" ");
	            rows.add("\n");
		}
       Iterator<String> iter = rows.iterator();
       while (iter.hasNext()){
           String outputString = (String) iter.next();
           response.getOutputStream().print(outputString);
       }
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 response.sendRedirect("myOrders.jsp");
}

catch(Exception e){
	System.out.println(e);
}
}



if(csvpage.equals("2") && email.equals("admin@gmail.com"))
{
try
{

String filename="Orders_Received.csv";
Connection con=ConnectionProvider.getCon();
Statement stmt=con.createStatement();
 String qry = "select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing' ";
 ResultSet rs= stmt.executeQuery(qry);
	response.reset();
	response.setContentType("application/text");
	response.setHeader("Content-disposition","attachment; filename=" +filename);
	  ArrayList<String> rows = new ArrayList<String>();
	  rows.add(",,,,,,Orders Received");
	  rows.add("\n");
	  rows.add("\n");
       rows.add("S.No,MOBILE_NUMBER,PRODUCT_NAME,QUANTITY,SUB_TOTAL,ADDRESS,CITY,STATE,COUNTRY,ORDER_DATE,EXPECTED_DELIVERY_DATE,PAYMENT_METHOD,T-ID,STATUS");       
       rows.add("\n");
		while(rs.next())
		{
			sno=sno+1;
			  rows.add(" "+sno+" ,"+rs.getString(11)+","+rs.getString(18)+","+rs.getString(4)+","+rs.getString(6)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10)+","+rs.getString(12)+","+rs.getString(13)+","+rs.getString(14)+","+rs.getString(15)+","+rs.getString(16)+" ");
	            rows.add("\n");
		}
       Iterator<String> iter = rows.iterator();
       while (iter.hasNext()){
           String outputString = (String) iter.next();
           response.getOutputStream().print(outputString);
       }
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 response.sendRedirect("ordersReceived.jsp");
}

catch(Exception e){
	System.out.println(e);
}
}



if(csvpage.equals("3") && email.equals("admin@gmail.com"))
{
try
{

String filename="Cancel_Orders.csv";
Connection con=ConnectionProvider.getCon();
Statement stmt=con.createStatement();
 String qry = "select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Cancel'  order by cart.orderDate desc";
 ResultSet rs= stmt.executeQuery(qry);
	response.reset();
	response.setContentType("application/text");
	response.setHeader("Content-disposition","attachment; filename=" +filename);
	  ArrayList<String> rows = new ArrayList<String>();
	  rows.add(",,,,,,Cancel Orders");
	  rows.add("\n");
	  rows.add("\n");
       rows.add("S.No,MOBILE_NUMBER,PRODUCT_NAME,QUANTITY,SUB_TOTAL,ADDRESS,CITY,STATE,COUNTRY,ORDER_DATE,EXPECTED_DELIVERY_DATE,PAYMENT_METHOD,T-ID,STATUS");       
       rows.add("\n");
		while(rs.next())
		{
			sno=sno+1;
			  rows.add(" "+sno+" ,"+rs.getString(11)+","+rs.getString(18)+","+rs.getString(4)+","+rs.getString(6)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10)+","+rs.getString(12)+","+rs.getString(13)+","+rs.getString(14)+","+rs.getString(15)+","+rs.getString(16)+" ");
	            rows.add("\n");
		}
       Iterator<String> iter = rows.iterator();
       while (iter.hasNext()){
           String outputString = (String) iter.next();
           response.getOutputStream().print(outputString);
       }
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 response.sendRedirect("cancelOrders.jsp");
}

catch(Exception e){
	System.out.println(e);
}
}
if(csvpage.equals("4") && email.equals("admin@gmail.com"))
{
try
{

String filename="Delivered_Orders.csv";
Connection con=ConnectionProvider.getCon();
Statement stmt=con.createStatement();
 String qry = "select *from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='Delivered'  order by cart.orderDate desc";
 ResultSet rs= stmt.executeQuery(qry);
	response.reset();
	response.setContentType("application/text");
	response.setHeader("Content-disposition","attachment; filename=" +filename);
	  ArrayList<String> rows = new ArrayList<String>();
	  rows.add(",,,,,,Delivered Orders");
	  rows.add("\n");
	  rows.add("\n");
       rows.add("S.No,MOBILE_NUMBER,PRODUCT_NAME,QUANTITY,SUB_TOTAL,ADDRESS,CITY,STATE,COUNTRY,ORDER_DATE,EXPECTED_DELIVERY_DATE,PAYMENT_METHOD,T-ID,STATUS");       
       rows.add("\n");
		while(rs.next())
		{
			sno=sno+1;
			  rows.add(" "+sno+" ,"+rs.getString(11)+","+rs.getString(18)+","+rs.getString(4)+","+rs.getString(6)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10)+","+rs.getString(12)+","+rs.getString(13)+","+rs.getString(14)+","+rs.getString(15)+","+rs.getString(16)+" ");
	            rows.add("\n");
		}
       Iterator<String> iter = rows.iterator();
       while (iter.hasNext()){
           String outputString = (String) iter.next();
           response.getOutputStream().print(outputString);
       }
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 response.sendRedirect("deliveredOrders.jsp");
}

catch(Exception e){
	System.out.println(e);
}
}

if(csvpage.equals("5") && email.equals("admin@gmail.com"))
{
try
{

String filename="All_Users.csv";
Connection con=ConnectionProvider.getCon();
Statement stmt=con.createStatement();
 String qry = "select *from users";
 ResultSet rs= stmt.executeQuery(qry);
	response.reset();
	response.setContentType("application/text");
	response.setHeader("Content-disposition","attachment; filename=" +filename);
	  ArrayList<String> rows = new ArrayList<String>();
	  rows.add(",,,,All Users");
	  rows.add("\n");
	  rows.add("\n");
       rows.add("S.No,NAME,EMAIL,MOBILE_NUMBER,ADDRESS,CITY,STATE,COUNTRY");       
       rows.add("\n");
		while(rs.next())
		{
			sno=sno+1;
			  rows.add(" "+sno+" ,"+rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10)+" ");
	            rows.add("\n");
		}
       Iterator<String> iter = rows.iterator();
       while (iter.hasNext()){
           String outputString = (String) iter.next();
           response.getOutputStream().print(outputString);
       }
	 response.getOutputStream().flush();
	 response.getOutputStream().close();
	 response.sendRedirect("allUsers.jsp");
}

catch(Exception e){
	System.out.println(e);
}
}
%>