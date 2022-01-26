<%@page import="finalFile.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<html>
<body>
<% 
try
{
Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
String q1="create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(500),city varchar(100),state varchar(100),country varchar(100))";
String q2="create table product(id int,name varchar(500),category varchar(200),feature1 varchar(200),feature2 varchar(200),price int,active varchar(10))";
String q3="create table cart(email varchar(100),product_id int,category varchar(200),quantity int,price int,total int,address varchar(500),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
String q4="create table message(id int AUTO_INCREMENT,email varchar(100),subject varchar(200),body varchar(1000),status varchar(200), PRIMARY KEY (id))";
String q5="create table transactionIndex(transactionIndex int)";
String q6="insert into product (id, name,category,feature1,feature2,price,active) VALUES (1, 'one plus 6', 'Electronics','mobile','5-star',38500, 'yes'),(2, 'Iphone X','Electronics','mobile','5-star',120000, 'yes'),(3, 'Pocophone F1','Electronics','mobile','4-star',26000, 'yes'),(4, 'Samsung S9', 'Electronics','mobile','4-star',52000, 'yes'),(5, 'Macbook Air','Electronics','laptop','5-star', 124000, 'yes'),(6, 'Asus Rog','Electronics','laptop','4-star',92000, 'yes'),(7, 'HP Pavilion','Electronics','laptop','5-star', 62000,'no'),(8, 'Good Day Butter cookies 80g','Grocery Items','2020-01-01','2020-09-30', 25, 'yes'),(9, 'Good Day Cashew Cookies 80g','Grocery Items','2020-01-01','2020-09-30', 25, 'yes'),(10, 'Oreo Biscuits Vanilla Cream 50g','Grocery Items','2020-01-01','2020-09-30', 10, 'yes'),(11, 'Oreo Biscuits Strawberry Flavour 50g','Grocery Items','2020-02-01','2020-10-30', 10, 'yes'),(12, 'Cashew 100g - Dryfruits ','Grocery Items','2020-02-01','2020-10-30', 150, 'yes'),(13, 'Badam 100g - DryFruits','Grocery Items','2020-02-01','2020-10-30', 200, 'yes'),(14, 'Walnuts 200g - DryFruits','Grocery Items','2020-02-01','2020-10-30', 560, 'yes'),(15, 'Choclate Waffey','Grocery Items','2020-02-01','2020-10-30', 70, 'yes'),(16, 'The Hobbit','Books','J.R.R. Tolkien','mistery', 550, 'yes'),(17, 'The Book Thief','Books','Markus Zusak','fiction', 250, 'yes'),(18, 'The Diary Of A Young Girl','Books','Anne Frank','drama', 410, 'yes'),(19, 'Pride and Prejudice','Books','Jane Austen','novel', 190, 'yes'),(20, 'The Great Gatsby','Books','F. Scott Fitzgerald','novel', 450, 'yes')";

System.out.println(q1);
System.out.println(q2);
System.out.println(q3);
System.out.println(q4);
System.out.println(q5);
System.out.println(q6);

st.execute(q1);
st.execute(q2);
st.execute(q3);
st.execute(q4);
st.execute(q5);
st.execute(q6);

System.out.println("Table created");
con.close();
}catch(Exception e)
{
System.out.println(e);	
}
%>
</body>
</html>