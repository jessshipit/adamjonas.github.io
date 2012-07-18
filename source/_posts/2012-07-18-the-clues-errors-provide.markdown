---
layout: post
title: "the clues errors provide"
date: 2012-07-18 16:35
comments: true
categories: errors rails
---

``` ruby Here's the code in the sessions controller
def create
  	user = User.find_by_email_address(params[:email_address])
  	if user && user.authenticate(params[:password])
     #blah blah blah
  end
```
``` ruby The Error
undefined method `authenticate' for nil:NilClass
```
This means that the method was called on a receiver that is nil. Meaning that it's not the right object...


``` ruby Here's the code in the sessions controller
def create
  	user = User.find_by_email_address(params[:email_address])
  	if user && user.magic(params[:password])
    #blah blah blah
end
```

``` ruby The Error
undefined method `magic' for #<User:0x007fa35e3e2fe8>
```
This means that the method magic doesn't exist for that object.