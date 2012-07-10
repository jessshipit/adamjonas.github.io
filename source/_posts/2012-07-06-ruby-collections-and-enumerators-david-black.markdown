---
layout: post
title: "Ruby Collections and Enumerators – David Black"
date: 2012-06-26 10:49
comments: true
categories: ruby lecture
---

Ruby Collections and Enumerators
David Black
June 26, 2012

Enumerators
- what is an enum?
- an instance of class Enum
-external iterator
-iterates via a specific method on an underlying object

??next method- walk through the iteration and give you the next value

the default bound is the each method
%w --> converst to enum

loop resuces the stop Iteration error
??each_cons method
if you run each on enum = array.map # => it behaves like map
same with array.select and array.each_cons

Can also chain enumerators:

array.each.with_index #=> will yield the index
array.map.with_index

String Enumerables
-bytes (aka each_byte)
-chars (aka each_char)
-lines (aka each_line)

count takes a block (how many is this true for...)

?? diff between take and select
``` ruby Some Enum methods
.extend(Enumerable) #=> extends the Enum functionality if operating on a single object

each_slice # doesn't overlap like each_cons

require 'prime' #there is a Prime class 

array.any? # --> is there anything True in this array?
array.none?
array.one? # (just one-- will exit after it's first hit)
array.all?

array = [a,3,2,4,5,6,7]
array.partition {block that calls the even method} #=> wtih divide the result into two arrays a true an other
array.slice_before #=> [[1,3], [2], [4,5,7], [6]]
chunk discards results for which the block evaluates to nil #=> not useful- obscure method
array.take
array.drop

take_while #=> e.g. while true execute below
drop_while

array = [1,2,3]
array.permutation.to_a # => yields all the permuatations of the array [[1,2,3], [1,3,2], [2,1,3]]
array.combination(2).to_a #=> yields the combinations (in this case 2 at a time [1,2], [1,3], [2,3])

array.sample #=> pulls a random sample from the array
array.shuffle # => will randomize the sample
```