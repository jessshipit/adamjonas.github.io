---
layout: post
title: "Ruby Lecture 4"
date: 2012-07-18 19:08
comments: true
categories: ruby lecture
---

Programmer of the day:
Alan Kay

###Object Orientation###
once you have a user class, you can send it a message
once you have a class you can teach the class how to do things like authenticate a user

###Review###
iteration: going through many things one at a time
we refer to that character one at a time, as the iterator or yield

.inspect allows you to look at an object that 

common to have nested iteration-- iterate through them, by looping through enumerables within a loop

Iterating a hash you get yielded two variables at once, the key first and the value second

```ruby
alphabet = {:a => 1, :b => 2}

alphabet.each do |key, value|
  puts "#{key} is the #{value} letter"
end
```

.compact will get rid of any nil values
.uniq will get rid of duplicates

! methods will change the data set forever...

.flatten will remove nesting from an array-- will flatten all elements in array
.reverse elements in the array

side note: python believes there is one way to do something. Ruby believes there should be many ways to do it so that you can be more expressive.

```ruby ordinalize is a integer method
1.ordinalize     # => "1st"
2.ordinalize     # => "2nd"
1002.ordinalize  # => "1002nd"
```

```ruby multiple_of?(number)
#Check whether the integer is evenly divisible by the argument.
0.multiple_of?(0)  #=> true
6.multiple_of?(5)  #=> false
10.multiple_of?(2) #=> true
```

Lab solution (8PM)

hash structure with root or without root TODO

.detect, .select and .reject methods are all useful array elements


class CONSTANTS are really good for storing data about the class