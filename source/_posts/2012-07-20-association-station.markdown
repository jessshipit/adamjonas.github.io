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
