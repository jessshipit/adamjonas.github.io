---
layout: post
title: "Agile Web Development with Rails"
date: 2012-10-30 10:33
comments: true
categories: 
---

- ORM libraries map database tables to classes, rows to objects, and columns to attributes of those objects.
- Class methods are used to perform table-level operations
- Instance methods are used to perform operations on individual rows.
- Modules server two purposes
  - namespace: letting you define methods whose names will not clash with those defined elsewhere
  - And they allow you to share functionality between classes
- a ||= b
```ruby a op= b is the same as a = a operation b
count += 1 
#same as
count = count + 1

price *= discount 
#same as
price = price * discount 

count ||= 0
#same as
count = count || 0
```
- lambda
- numericality
- catelog display is really just a glorified product listing.
- everytime a request comes in, we can recover the identity from the session and use it to find the cart in the database
- dependent: :destroy -> indicates that the existance of line items is dependent on the existance of the cart
- if a table has foreign keys, the corresponding model should have a belongs_to for each.
- the default HTTP method for a link is a get, the default HTTP method for a button is a post.
- @cart.line_items.build -> this casuse a new line item relationship to be built between the @cart object and the product. You can build the relationship from either end.
- Rails matches on is add_XXX_to_TABLE and remove_XXX_from_TABLE where the value XXX is ignored; what matters is the list of the column names and the types that appear after the migration name.
- link_to_unless_current
- if @person is just an empty object structure, form_form will work on the assunmption that this is to creat a new object. If @person actually contains data, however, form_for will assume that its form is editing that object and create a different looking form element, a hidden field to enable Rails' REST capabilities.
- helpers are simply modules containing methods that assist a view.
- link_to and link_to_if take a condition parameter
- a flash is a bucket (acutally closer to a hash) in which you can store stuf as you process a request.
- you can pass parameters to a partial, so that the partial can render different results.