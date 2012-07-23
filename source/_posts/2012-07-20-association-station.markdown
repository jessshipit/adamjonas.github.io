---
layout: post
title: "association station"
date: 2012-07-20 17:30
comments: true
categories: 
---

4.1.2.2 :class_name
:  If the name of the other model cannot be derived from the association name, you can use the :class_name option to supply the model name. For example, if an order belongs to a customer, but the actual name of the model containing customers is Patron, you’d set things up this way:
``` ruby [from the assoication guide](http://guides.rubyonrails.org/association_basics.html)
class Order < ActiveRecord::Base
  belongs_to :customer, :class_name => "Patron"
end
```


###One-to-many relationships###
:	The most common relationship used when creating relational databases.  A row in a table in a database can be associated with one or (likely) more rows in another table.  An example of a one-to-many relationship is a single order has many items on that order.  And since relationships work both ways it is not uncommon to hear reference to many-to-one-relationships as well.

most common kind
[e.g.](http://www.maakal.com/maakalDB/ERD_Examples2.htm)

###One-to-one relationship###	
:    A row in a table is associated to one and only one row in another table.  An example of a one-to-one relationship is a person can have one social security number and a social security number can only be assigned to one person.

In most cases there is no need for a one-to-one relationship as the contents of the two tables can be combined into one table.

[e.g.](http://www.maakal.com/maakalDB/ERD_Examples.htm)

###Many-to-many relationships###
:	When one or more rows in a table are associated with one or more rows in another table.  An example of a many-to-many relationship is a table of customers can purchase many products and many customers can purchase a product.

[From](http://help.filemaker.com/app/answers/detail/a_id/9922/~/understanding-and-creating-many-to-many-relationships-in-filemaker-pro)