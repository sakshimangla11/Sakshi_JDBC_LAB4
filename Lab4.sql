create Database if not exists `order-directory`;
use `order-directory`;

create table if not exists category
(cat_id int not null, cat_name varchar(20) not null, primary key(cat_id));

create table if not exists supplier(
  supp_id int primary key,
  supp_name varchar(50) not null,
  supp_city varchar(50) ,
  supp_phone varchar(10) not null
);

create table if not exists customer(
 cus_id int not null,
 cus_name varchar(20) not null,
 cus_phone varchar(10) not null,
 cus_city varchar(30) not null,
 cus_gender char,
 primary key(cus_id));

create table if not exists product(
prod_id int not null,
pro_name varchar(20) not null default "Dummy", pro_desc varchar(60),
cat_id int not null, primary key (prod_id), foreign key(cat_id) references category (cat_id)); 

create table supplier_pricing(
pricing_id int not null,
prod_id int not null,
supp_id int not null,
foreign key(prod_id) references product(prod_id),
foreign key(supp_id) references supplier(supp_id),
supp_price int default 0,
primary key(pricing_id)
);

create table if not exists `order`(
ord_id int not null,
ord_amount int not null,
ord_date Date,
cus_id int not null,
pricing_id int not null,
primary key(ord_id),
foreign key(cus_id) references 
customer(cus_id),
foreign key(pricing_id) references
supplier_pricing(pricing_id)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

insert into supplier values(1,"Rajesh Retails","Delhi",'1234567890');
insert into supplier values(2,"Appario Limited Ltd","Mumbai","2589631470");
insert into supplier values(3,"Knome Products","Bangalore","9785462315");
insert into supplier values(4,"Bansal Retails","Kochi","8975463285");
insert into supplier values(5,"Mittal Limited", "Lucknow", "7898456532");

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

insert into category values (1,"Books");
insert into category values (2,"Games");
insert into category values (3,"Groceries");
insert into category values (4,"Electronics");
insert into category values (5,"clothes");

select * from category

insert into product values(1,"GTA V", "Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
supplier_pricing
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

use `order-directory`;
select * from supplier_pricing
select * from customer
select * from `order`
select * from product

Q3) Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.
select count(t2.cus_gender) as noOfCustomers,t2.cus_gender from
(select t1.cus_id,t1.cus_gender,t1.cus_name from
(select `order`.*,customer.cus_gender,customer.cus_name from `order` inner join customer
where `order`.cus_id = customer.cus_id having `order`.ord_amount>=3000) as t1 group by t1.cus_id) as 
t2 group by t2.cus_gender;

Q4) Display all the orders along with product name ordered by a customer having Customer_Id=2
select `order`.* , product.pro_name from `order`, `product`,`supplier_pricing` where `order`.cus_id=2
and `order`.pricing_id = supplier_pricing.pricing_id and supplier_pricing.prod_id=product.prod_id

Q5) Display the Supplier details of who is supplying more than one product.

select supplier.* from supplier where supplier.supp_id in 
	(select supp_id from supplier_pricing group by supp_id having 
	count(supp_id)>1) 
group by supplier.supp_id;


Q.6Find the least expensive product from each category and print the table with category id, name, and price of the product


select category.cat_id, category.cat_name, min(t3.min_price) as Min_Price from category inner join (select product.cat_id,product.pro_name, t2.* from product inner join (select prod_id, min(supp_price) as Min_Price from supplier_pricing group by prod_id) as t2 where t2.prod_id = product.prod_id) as t3 
where t3.cat_id = category.cat_id group by t3.cat_id

Q7) Display the Id and Name of the Product ordered after “2021-10-05”. 

select product.pro_id,product.pro_name from `order` inner join supplier_pricing on supplier_pricing.pricing_id=`order`.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where `order`.ord_date>"2021-10-05";

Q.8) Display customer name and gender whose names start or end with character 'A'.
     select cus_name, cus_gender from customer where cus_name like 'A%' or cus_name like '%A'

Q9) Create a stored procedure to display supplier id, name, rating and Type_of_supplier. 

DELIMITER &&  
CREATE PROCEDURE proc()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
  when report.Average = 5 THEN 'EXCELLENT SERVICE'
  when report.Average > 4 THEN 'GOOD SERVICE'
  when report.Average > 2 THEN 'AVERAGE SERVICE'
  ELSE 'POOR SERVICE'
 END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from (select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by supplier_pricing.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END &&  
DELIMITER ;  

call proc();






