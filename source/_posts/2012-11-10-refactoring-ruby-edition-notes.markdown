---
layout: post
title: "Refactoring Ruby Edition Notes"
date: 2012-11-10 11:22
comments: true
categories: refactoring book_notes
---

###Replacing the Conditional Logic on Price Code with Polymorphism [p.32]
>Replacing the Conditional Logic on Price Code with Polymorphism
The first part of this problem is that case statement. It is a bad idea to do a case based on an attribute of another object. If you must use a case statement, it should be on your own data, not on someone else’s.
  - [Thoughtbot Reading](http://robots.thoughtbot.com/post/31728620503/refactoring-replace-conditional-with-polymorphism)

??Receiver on page 35?

###Refactoring is... [p.53]
>(noun) A change made to the internal structure of software to make it easier to understand and cheaper to modify with- out changing its observable behavior.

  - Programming in about saying exactly what you want. But there is another user of your source code. Someone will try to read your code in a few months’ time to make some changes. We easily forget that extra user of the code, yet that user is actually the most important.
    - Who cares if the computer takes a few more cycles to execute something? It does matter if it takes a programmer a week to make a change that would have taken only an hour if she had understood your code.
    - when you are trying to get the program to work, you are not thinking about that future developer.
      - Often this future developer is me. [p. 55]

  - Kent Beck often makes about himself, “I’m not a great programmer; I’m just a good programmer with great habits.” [p. 56]
  - Don Roberts: The first time you do something, you just do it. The second time you do something similar, you wince at the duplica- tion, but you do the duplicate thing anyway. The third time you do something similar, you refactor. [p. 57]

###Problems with refactoring [p. 63]
  - takes a while to create nothing
  - performance deoptimization
  - changing behavior

###Code Smells
  - Duplicated Code [p. 74]
  - Long Method [p. 74-75]
    - A heuristic we follow is that whenever we feel the need to com- ment something, we write a method instead. 
    - Conditionals and loops also give signs for extractions.
  - Large Class [p. 76]
    - When a class is trying to do too much, it often shows up as too many instance variables. When a class has too many instance variables, duplicated code cannot be far behind.
  - Long Parameter List [p. 76]
  - Divergent Change [p. 77]
    - When we make a change we want to be able to jump to a single clear point in the system and make the change. When you can’t do this you are smell- ing one of two closely related pungencies.
  - Shotgun Surgery
    - Every time you make a kind of change, you have to make a lot of little changes to a lot of different classes.
    - opposite of divergent change
  - **Feature Envy [p. 78]**
    - a method that seems more interested in a class other than the one it actually is in.
  - 

###Extract Method [p. 102]
  - You have a code fragment that can be grouped together.
    - Turn the fragment into a method whose name explains the purpose of the method.

###Inline Temp [p. 110]
  - You have a temp that is assigned to once with a simple expression, and the temp is getting in the way of other refactorings.
    - Replace all references to that temp with the expression.

###Replace With Query [p. 111]
  - You are using a temporary variable to hold the result of an expression.
    - Extract the expression into a method. Replace all references to the temp with the expression. The new method can then be used in other methods.


####Ternary
```ruby Ternary p. 114
#from
def price
a_base_price = base_price if base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.98
  end
  a_base_price * discount_factor
end

#to (not an exact refactor, but good use of ternary)
def discount_factor
  base_price > 1000 ? 0.95 : 0.98
end
```

###Extraction Method [p. 120]

###Remove assignment parameters
```ruby
def a_method(foo)
  foo.modify_in_some_way # that's OK
  foo = another_object # trouble and despair will follow you
end
```

###Replace Loop with Conditional
```ruby
managers = []
employees.each do |e|
  managers << e if e.manager?
end
```

###Lazy Initialized Attribute
  - Initialize an attribute on access instead of at construction time.

```ruby Lazy Initialized Attribute
class Employee
  def initialize
    @emails = []
  end
end
#becomes
class Employee
  def emails
    @emails ||= []
  end
end
```
###Replace Methods with Method Objects
>Turn the method into its own object so that all the local variables become instance variables on that object. You can then decompose the method into other methods on the same object.[p. 129]

###Subsitute Algorithm
```ruby
Replace the body of the method with the new algorithm.
def found_friends(people)
  friends = []
  people.each do |person|
    if(person == "Don")
      friends << "Don"
    end
    if(person == "John")
      friends << "John"
    end
    if(person == "Kent")
      friends << "Kent"
end end
  return friends
end

#To
def found_friends(people)
  people.select do |person|
    %w(Don John Kent).include? person
  end
end
```

###Replace Loop with collection p.134
```ruby
managers = []
employees.each do |e|
  managers << e if e.manager?
end
#to
managers = employees.select {|e| e.manager?}

offices = []
employees.each {|e| offices << e.office}
#to
offices = employees.collect {|e| e.office}

managerOffices = []
employees.each do |e|
  managerOffices << e.office if e.manager?
end
#to
managerOffices = employees.select {|e| e.manager?}.
                           collect {|e| e.office}

total = 0
employees.each {|e| total += e.salary}
#to
total = employees.inject(0) {|sum, e| sum + e.salary}
```

###Extract Surround Method p.135
>You have two methods that contain nearly identical code. The variance is in the middle of the method.
*Extract the duplication into a method that accepts a block and yields back to the caller to execute the unique code.*

- This exists in Gitbo

###Class Annotation p.139
>Declare the behavior by calling a class method from the class definition.

`hash_initializer :author_id, :publisher_id, :isbn` like `attr_accessor` or `repo_params`

###Introduce Named Parameters p.142
>Convert the parameter list into a Hash, and use the keys of the Hash as names for the parameters.

**This is what rails does with params!**

```ruby 
SearchCriteria.new(5, 8, "0201485672")
#TO
SearchCriteria.new(:author_id => 5, :publisher_id => 8, :isbn =>"0201485672")
#like an options path
```

###Dynamic Method Definition p.152
[see](/blog/dynamic-method-definition/)


###Moving methods p.168
>The bread and butter of refactoring 

###Move Field p.173
>I consider moving a field if I see more methods on another class using the information in the field than the class itself. I may choose to move the methods; this decision is based on interface. But if the methods seem sensible where they are, I move the field.

###Extract Class p.175
>You have one class doing work that should be done by two.

###Inline Class p. 179
>A class isn’t doing very much. *Move all its features into another class and delete it.*

###Self Encapsulate Field p. 188
>You are accessing a field directly, but the coupling to the field is becoming awkward. *Create getting and setting methods for the field and use only those to access the field.*

```ruby
def total
  @base_price * (1 + @tax_rate)
end
#TO
attr_reader :base_price, :tax_rate
def total
  base_price * (1 + tax_rate)
end
```

###Replace array with object p.201
```ruby
row = []
row[0] = "Liverpool"
row[1] = "15"
#TO
row = Performance.new
row.name = "Liverpool"
row.wins = "15"
```

###Replace hash with object p.206

###Encapsulate Collections p.219
>A method returns a collection. *Make it return a copy of the collection and provide add/remove methods.*

```ruby
def add_course(course)
  @courses << course
end

def remove_course(course)
  @courses.delete(course)
end
```

###Lazily Initialized Attributes p.255
```ruby
class Employee
  def initialize
    @emails = []
  end
end
class Employee
  def emails
    @emails ||= []
  end
end
```
##Chapter 9: Simplifying Conditional Expressions

###Replace Conditional with Polymorphism p. 279

###Introduce Null Object p. 284
>You have repeated checks for a nil value. *Replace the nil value with a null object.*


###Replace the conditional code with the more idiomatic Ruby construct.
  - Encapsulate if/else, and/or logic in their own methods

```ruby
parameters = params ? params : []
#becomes
parameters = params || []
```
  - Use && instead of multiple ifs
```ruby
if on_vacation?
  if length_of_service > 10
    return 1
  end
end 
0.5
#This would be changed to
if on_vacation? && length_of_service > 10
  return 1
end
0.5
```

###Quote
>One of the most fundamental, if not the fundamental, decision in object design is deciding where to put responsibilities. I’ve been working with objects for more than a decade, but I still never get it right the first time. That used to bother me, but now I realize that I can use refactoring to change my mind in these cases. p.167

##Questions:
- what is the receiver on page 35?
- weird symbols on p127. T?L?1
- don't understand what is happening on p. 184

  - Stopped at p. 287