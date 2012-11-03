---
layout: post
title: "Ternary Operator"
date: 2012-10-29 14:21
comments: true
categories: ruby
---

Ternary operators are simply a short form of an if-else statement in one line.

The following sample will print “The variable is 10″ if var is equal to 10. Otherwise it will print “The variable is Not 10″.
```ruby An example
print “The variable is ” + (var == 10 ? “10″ : “Not 10″)
```
Ruby evaluates the expression to the left of the question mark. If that expression is true then it returns the expression between the question mark and the colon, if the expression is false, it returns what comes after the colon. 
```ruby Ternary Operator
age = 15
# will output teenager  
puts (13...19).include?(age) ? "teenager" : "not a teenager"

#can also do assignment
age = 23
person = (13...19).include?(age) ? "teenager" : "not a teenager"
puts person # => "not a teenager" 
```

The part before the question mark is the "if condition". the part behind it is the code to be run if the condition matches. the ":" respresents "else", and the code behind it the code to be run if the condition does not maztch.

```ruby Ternary Operator in the view
<h3>Name:</h3>
<% if @user.name %>
<%= @user.name %>
<% else %>
<em>[no name set]</em>
<% end %>

#can be refactored as

<h3>Name:</h3>
<%= @user.name ? @user.name : "<em>[no name set]</em>" %>
```
