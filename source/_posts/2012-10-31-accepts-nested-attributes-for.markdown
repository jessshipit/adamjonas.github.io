---
layout: post
title: "Accepts Nested Attributes For"
date: 2012-10-31 16:14
comments: true
categories: rails
---

So accepts nested attributes is really about writing to an attribute of a class. 

In my case a location belongs_to a user. I was then trying to set the location.street1 through the user, but it wouldn't write. This is because it needs the accepts_nested_attributes method in the model.