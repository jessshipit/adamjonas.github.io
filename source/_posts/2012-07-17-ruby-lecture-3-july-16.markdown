---
layout: post
title: "ruby lecture 3"
date: 2012-07-17 22:50
comments: true
categories: ruby lecture
---

Programmer of the day:
Kent Beck

FizzBuzz
solutions on ?ruberque?

TDD: able to write the code that you wish you had

###Array Review:###
``` ruby
empty[0] = "filled" #=> can assign slots one at a time
easy_as[1, 5] #=> can slice elements off, have elastic arrays --> can add elements to an array without doing anything else
```

###Lecture:###

Object orientation- we send object methods
important to identify who the receiver is and what the method is
part of dot notation: every method returns an object, so you can chain another method on it
it's the return of the previous method that is the receiver for the following method

the strip method is part of the family of normalization

gsub = global substitution
sub will only replace the first occurrence it encounters

== is the same as eql method

methods that end with question marks --> the ? is part of the method name that indicates it returns a boolean value

strings like arrays can be sliced

match accepts a pattern of REGEX 
  -the string literal for patterns are /a/e/i/o/u
  -check <http://rubluar.com>

**Iteration** is a fancy word for looping

anything that can iterated upon is described as an *enumerable*
strings and arrays are enumerables

**Scope**

scope gates -- every time you see a 'do', 'end', 'def' keyword your scope changed. 

blocks have an exclusive scope. If it is defined in that block and only in that block it is accessible for the outside. 
method scopes are even stricter. cannot access method outside of that particular method.
parameters are how you pass in values into a method.

2nd program- (8:25- 8:35)
artist, album, song sorting

*first step in a program is usually to set up state*

**More Data Types**
*Hashes* a lot like an array in that it is a collection object. An array is only indexed, so you can only refer to the objects within the array by its position

*Literal Constructors:*

"" - strings

/ - REGEX

[] - array

{} - hashes

: - symbols


Hashes are valuable when you care about the meta data

every time you create a new string, it creates a new object in memory
a symbol is an immutable object
``` ruby
vending machine {
	a: => ["snickers", "twix", "kit kat"]
}
puts vending_machine[:a][0] #=> this accesses the :a key and the 0th position of the array which is the value
```