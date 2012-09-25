---
layout: post
title: "MySQL DB Design"
date: 2012-09-05 11:51
comments: true
categories: SQL
---

[MySQL Google](http://code.google.com/edu/tools101/mysql.html)

*Data normalization*
:  This is the process we go through to develop a design that is free of redundant data and that can be consistently and correctly modified


*primary keys* uniquely identify a record in a table, and *foreign keys* are used to relate tables
- Every record must have a unique primary key which should not be reused once deleted


*Referential integrity*
:  The data in a foreign key needs to match the primary key in some record of the original table. Referential integrity assures there are no broken links between tables. Note that if you delete a record in the original table, for example, you delete one of the customers from the customer table, referential integrity requires that you delete all references to that customer in the order table.

###MySQL Exercises###
1. Start up MySQL with
```
mysql -uroot -ppassword
```
Creating a table...
```
create table customer (cust_no int not null auto_increment, name varchar(40),
address varchar(40), phone varchar(12), primary key(cust_no));
```
"varchar" which means variable-length strings. The numbers following "varchar" in the command above indicate maximum length for the data stored in the field. We also set up cust_no to be the primary key.

The orders table...
```
create table orders (order_no int not null auto_increment, FK_cust_no int not null, 
foreign key(FK_cust_no) references customer(cust_no), primary key(order_no));
```
There are only two fields in this table. The order_no field is a primary key, and is an integer, not null and it will auto increment. The cust_no field is a foreign key. We have named it FK_cust_no in the orders table to distinguish it from the cust_no field in the customer table.

*A foreign key is a field that references a primary key in another table.* In the command, we indicate that the FK_cust_no field is a foreign key referencing the cust_no field in customer, indicated by the "foreign key(FK_cust_no) references customer(cust_no)" part of the command. By setting the table up this way, MySQL will enforce constraints-- any order that we enter into the orders table must reference a valid customer in the customer table. If we enter a cust_no in orders that does not exist in customers, an error will result.

A *transaction* is a sequence of individual database operations that are grouped together. A transaction will never be complete unless each individual operation within the group is successful. If any operation within the transaction fails, the entire transaction will fail. Transactions are a relatively new addition to MySQL but not to relational database systems in general.