---
layout: post
title: "the clues errors provide"
date: 2012-07-18 16:35
comments: true
categories: errors rails
---

When you get a stack trace and it's part of rails you can ignore it because you created the file NOT rails.

```ruby Here's the code in the sessions controller
def create
  	user = User.find_by_email_address(params[:email_address])
  	if user && user.authenticate(params[:password])
     #blah blah blah
  end

#ERROR
undefined method `authenticate' for nil:NilClass
```
This means that the method was called on a receiver that is nil. Meaning that **the receiver not the right object or it's nil**

**Undefined Method:**
```ruby Here's the code in the sessions controller
def create
  	user = User.find_by_email_address(params[:email_address])
  	if user && user.magic(params[:password])
    #blah blah blah
end

#The Error
undefined method `magic' for #<User:0x007fa35e3e2fe8>
```
**The method magic doesn't exist for that object.**


**Expected an object but got an attribute in the form of a string, array, etc.**
```ruby AssociationTypeMismatch
ActiveRecord::AssociationTypeMismatch: City(#17815740) expected, got String(#1138750)
```

**This means that you have entered an infinite loop. e.g. you have called something on itself.**
```ruby
SystemStackError: stack level too deep
```

###DB Errors###
When the browser can't locate a table that you know exists-- ***make sure you migrate the DB!!***

###Can't save something to the DB###
- Open up console. 
- When you can't save it, send it '.save!' and it will throw off the errors.