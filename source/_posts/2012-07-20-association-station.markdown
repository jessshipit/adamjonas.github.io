---
layout: post
title: "association station"
date: 2012-07-20 17:30
comments: true
categories: associations
---

4.1.2.2 :class_name
>If the name of the other model cannot be derived from the association name, you can use the :class_name option to supply the model name. For example, if an order belongs to a customer, but the actual name of the model containing customers is Patron, you’d set things up this way:

[From the assoication guide](http://guides.rubyonrails.org/association_basics.html)
```ruby
class Order < ActiveRecord::Base
  belongs_to :customer, :class_name => "Patron"
end
```


###One-to-many relationships###
>The most common relationship used when creating relational databases.  A row in a table in a database can be associated with one or (likely) more rows in another table.  An example of a one-to-many relationship is a single order has many items on that order.  And since relationships work both ways it is not uncommon to hear reference to many-to-one-relationships as well.

- most common kind
[e.g.](http://www.maakal.com/maakalDB/ERD_Examples2.htm)

###One-to-one relationship###
>A row in a table is associated to one and only one row in another table.  An example of a one-to-one relationship is a person can have one social security number and a social security number can only be assigned to one person.

- In most cases there is no need for a one-to-one relationship as the contents of the two tables can be combined into one table.

[e.g.](http://www.maakal.com/maakalDB/ERD_Examples.htm)

###Many-to-many relationships###
>When one or more rows in a table are associated with one or more rows in another table.  An example of a many-to-many relationship is a table of customers can purchase many products and many customers can purchase a product.

[Source](http://help.filemaker.com/app/answers/detail/a_id/9922/~/understanding-and-creating-many-to-many-relationships-in-filemaker-pro)


###Self joins###

In designing a data model, you will sometimes find a model that should have a relation to itself. For example, you may want to store all employees in a single database model, but be able to trace relationships such as between manager and subordinates. This situation can be modeled with self-joining associations:
```ruby
class Employee < ActiveRecord::Base
  has_many :subordinates, :class_name => "Employee",
    :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "Employee"
end
```
With this setup, you can retrieve @employee.subordinates and @employee.manager

There is another rails cast on [self-referential-association](http://railscasts.com/episodes/163-self-referential-association). Ryan Bates is amazing.

- Reading:
[patterns of enterprise application architecture](http://www.amazon.com/Patterns-Enterprise-Application-Architecture-Martin/dp/0321127420)