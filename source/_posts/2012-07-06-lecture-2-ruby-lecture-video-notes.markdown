---
layout: post
title: "Lecture 2 Ruby Lecture Video Notes"
date: 2012-06-10 10:37
comments: true
categories: ruby, notes, lecture
---

Programmer _Why
-We don't speak machine. Coders are not translators. We need to teach the machine to speak like us.

There shouldn't be anything in code that you don't understand.
-Code is composed of the language, the name that you give things
-The language is just a bunch of keywords that have reserved meaning (10 min)- you can't use them for anything else

Names
-Varaiables- store references to things. (they are lowercase and are previously undefined)- they are pointers/make references to data
"The beginning of wisdom is calling things by its right name"
Data- literals
strings- indicate that the following characters should not be interpretted as code, but are rather just pieces of data (13min)

=> comment followed by hash rocket means 'should return'
(TIP- control L clears your terminal window)

Going over the quiz (14 min)

ruby -c --> ruby c flag, checks to the see if the program even works

When I debug code, it is a forensic process

Read code outloud

def is a keyword
ArgumentError is raised the wrong number of parameters are passed to a method
NameError occurs when Ruby encounters a word that was previously undefined- like an english word
Synatax error occurs when something you submitted breaks the compiler- like a floating plus sign

mate cmd r runs the code
subl cmd b runs the code
Comparisons (28 min):

true and false are the atoms of programs, they are the protons and electrons of the universe

(33 min) the single equal are reserved for assignment and the double equals are for comparison
"test" == "TEST" is false
!= is the not equal operator
--> these allow us to evaluate whether something is true or false

(36min) escape character \ e.g.
"
\"In the beginning.."
"

***Branching*** (38 min)
if, else, end branch (39 min)
- the moment it encounters a truth, it is going to stop running the branches
every if statement does not require an else clause

in ruby everything is an expression, which means that everything must evaluate into a return value so you can even use if statements as an expression in itself (42 min)
if statement assignment- we are using an if statement to control the value of a variable

elsif (45 min)
every branch of an if statement operates independently of the other branches. therefore you can evaluate if x... elsif y... it doesn't matter

it's always going to boil down to one value-- even if it is 6 or 7 lines of code in the end it can only equal one thing -- expressions however are composed of subexpressions-- that the basis of compositon (49 min)

-also have the unless keyword -- which is the converse of the if keyword-- this isn't preferred-- prefer the negation usually

***Logic*** (50 min)
- once we have true and false, and we have expressions (like 1 < 2), and we have if statments then we have all the ingredients for logical equations

***the OR operator ||***
``` ruby
x = 2
if (x/2 == 1) || (x == 1) # as long as one of the expressions evaluates to true, it passes
```

The only thing that evaluates to false is nil (absence of expression) and false

0 is true, 4 is true, "string" is true
x = false || 4 --> this will return 4 -->> this will assign x to 4

x = 1 || 2 #--> x will equal one because the moment it encounters a true statement it stops executing the rest of the code

***the AND operator &&***
for an AND operator to be true, both sides of the equation must be true
so y = false && puts 'hello' --> it will not even get to the puts statement because once it encounters the false it stops evaluating the expressions

negation operator !
***SWITCHING***
(1 hr 4min)- switching between conditions
if statement can get verbose and confusing and sometimes they aren't good for checking multiple related conditions

case x
when, else, end
unlike an if statement, a case statement is locked to the object you send it
e.g. case x
x == 1
y == 4 #this will be compared to x

you can combine && and || operators.
``` ruby
x = 1 if 1 < 2 #=> x = 1
x = 1 if 2 < 1 #=> nil (1 hr 16 min)
```
PART 2 Video
Running through the exercises

(10 min)
``` ruby
q = "a"
when q.downcase == "a" #=> this is eval as false.
puts "its a vowel"

q = "a"
when "a"
puts "it's a vowel" #=> this is the way to do it
```

***LOOPING*** (12min 30 sec)
if statements and case statements area how we control flow so that the program is not just stupidly linear - we can have conditions and ambiguity
another way to do this with loops
-the simpliest loop is with the while keyword
- it is check a condition or expression and until that expression evaluates to true it will run that code

``` ruby
x = 1

while x < 10
  puts x
  x += 1 #=> will increment x by 1. just like x = x + 1
end
```

the break keyword will exit the current loop --> 23 min

if I have an unexpected end -- you have a dangling end, but you often don't know where... this is why indentation is so important

tabs are meaningful characters and spaces aren't -- use spaces for indentation NOT tabs

until -- is the converse of the while loop-- we don't like until loops as much as while

-also have the until keyword -- until x == 1 is the same as while x != 1 #=> this isn't preferred, usually like the negation of while-- in some situations it is appropriate. unless and until are the safron of keywords. Use them sparingly!!

->encountered 5 types thus far--> strings, intergers, floats, nil and false

***ARRAYS***- (26min)-- an indexed collection of objects-- a type to hold other values
the literal for an array is []
- if you miss a comma [1, 2 3]--> you will get a syntax error
- for array [1, 2, 3][0]--> this indexes the first slot. Remember that it states counting at the zero element
-accessing a position in an array (33 min)

puts days_of_the_week[(days_of_the_week.size-1)] #=> will return the 6th element
weekdays = days_of_the_week[1, 5] --> this is a range of position one to five

arrays in Ruby are elastic (52 min)
``` ruby
a = [[1, 2], "a"]
a[0] # => [1,2]
a[0][1] => 2
```
***RECEIVERS*** (55 min)
-Ruby is an object oriented language so that means that everything is an object. We interact with objects by sending them methods using methods

slice(0,2) # => this slices out the first 3 elements
concat("uth") # => this appends "uth" to the end

chomp and slice are out periodic elements (1hr 8 min)

***STRING METHODS:***
strip gets rid of both leading and trailing spaces
lstrip - rid of leading spaces
tstrip - trailing spaces

puts "of Least Surprise".insert[0, "Principle"] => inserts Principle at position 0

gsub (1hr 16min)- global substitution - takes two arguments (the pattern, the replacement value)

***Booleans-***
puts"".empty? #=> true
put " ".empty? #=> false

eql?, starts_with?, include?

***Return Methods*** (1hr 18min)-
to_i
size
next --> next thing in a sequence. puts "a".next # => "b"

puts "one, two".slice(0,3) #=> one --> start at position one and give me 3 characters

match --> the first occurance of the match
scan --> scan will return all occurances --> returns an array of objects