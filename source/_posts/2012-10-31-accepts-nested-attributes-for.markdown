---
layout: post
title: "Accepts Nested Attributes For"
date: 2012-10-31 16:14
comments: true
categories: rails
---

So accepts nested attributes is really about writing to an attribute of a class. 

In my case a location belongs_to a user. I was then trying to set the location.street1 through the user, but it wouldn't write. This is because it needs the accepts_nested_attributes method in the model.

```ruby If I want to manage questions through my surveys forms...
class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
end
```
[Railscast](http://railscasts.com/episodes/196-nested-model-form-revised)
  - min 6 javascript

destroy -> allow_destroy: true
