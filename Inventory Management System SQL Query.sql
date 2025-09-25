Create database InventorySystem;
show databases;
use InventorySystem;
Create table Brands
(brandid int, brandname varchar(50));
insert into Brands values(1,'Apple'),(2,'Samsung'),(3,'Nike'),(4,'Fortune');
Create table Inv_User
(userid varchar(50),name varchar(50),password varchar(50),last_login datetime,user_type varchar(50));
INSERT into inv_user VALUES('harsh@gmail.com', 'Harsh Khanelwal', '1111', '2018-10-30 10:20:00', 'Manager'),('prashant@gmail.com', 'Prashant', '0011', '2018-10-29 10:20:00', 'Accountant'),('prashant@gmail.com', 'Prashant', '0011', '2018-10-29 10:20:00', 'Accountant');
Create table categories
(categoryid int ,category_name varchar(50));
insert into categories values(1, 'Electroincs'),(2,'Clothing'),(3,'Grocey');
Create table Product
(productid int,categoryid int,brandid int ,storesid int, productname varchar(50),product_stock int ,price int,added_date date);
insert into product values(1,1,1,1,'IPHONE',4,45000,'2018-10-31'),(2,1,1,1,'Airpods',3,19000,'2018-10-27'),(3,1,1,1,'Smart Watch',3,19000,'2018-10-27'),(4,2,3,2,'Air Max',6,7000,'2018-10-27'),(5,3,4,3,'REFINED OIL',6,750,'2018-10-25'); 
Create table stores
(storesid int,storesname varchar(50),address varchar(50),mobileno varchar(15));
insert into stores values(1, 'Ram kumar', 'Katpadi vellore','9999999999'),(2,'Rakesh kumar','chennai','8888555541'),(3,'Suraj','Haryana','7777555541');
Create table Provides
(brandid int ,storesid int, discount int);
insert into provides values(1,1,12),(2,2,7),(3,3,15),(4,2,7),(5,2,19),(6,3,20); 
Create table customer_cart
(customer_id int,name varchar(50),mobileno varchar(15));
insert into customer_cart values(1,'Ram','9876543210'),(2,'Shyam','7777777777'),(3,'Mohan','7777777775');
Create table select_product
(customer_id int,productid int ,quantity int);
insert into select_product values(1,2,2),(1,3,1),(2,3,3),(3,2,1); 
Create table transaction
(transactionid int,total_amount int,paid int,due int,gst int,discount int,payment_method varchar(50),cart_id int);
insert into transaction values(1,57000,25000,20000,5000,350,'card',1),(2,57000,57000,0,570,570,'cash',2),(3,19000,17000,2000,190,190,'cash',3),(3,19000,17000,2000,190,190,'cash',3);
Create table Invoice
(item_no varchar(25),productname varchar(50),quantity int,net_price int,transactionid int);
INSERT into invoice VALUES('4235254545', 'IPHONE', 1, 45000, 1),('4235254546','Airpods',2, 19000, 2),('4235254547','Smart Watch', 3, 19000, 3),('4235254548', 'Air Max', 4, 7000, 4),('4235254549', 'REFINED OIL', 5, 750, 5);

##Questions:
##Write a query to display the brandname of the brandid is 3.
##Write a query to display the invoice of Item number,product name,quantity,cart_id,cust_id and payment_method .(joins)
##To display the product id,category id,product name and stock price whose stockprice is greater than 300000.
##To display the product name ,product id,product price whose the product name is ‘Airpods’.
##To display the brand id,brand name and discount  whose brand id 2 and 3.
Select brandname From brands
WHERE brandid = 3;
Select invoice.item_no, invoice.productname, invoice.quantity,transaction.cart_id,select_product.customer_id,transaction.payment_method
FROM invoice
Inner JOIN transaction ON invoice.transactionid = transaction.transactionid
Inner JOIN select_product ON invoice.quantity = select_product.quantity;
Select productid,categoryid,productname,product_stock * price AS stock_price From product
WHERE product_stock * price > 300000;
Select productname, productid, price From product
WHERE productname = 'Airpods';
Select brands.brandid, brands.brandname, provides.discount From brands 
Left JOIN provides ON brands.brandid = provides.brandid
WHERE brands.brandid IN (2,3);





