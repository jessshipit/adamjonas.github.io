---
layout: post
title: "Refactoring Ruby Edition Notes"
date: 2012-11-10 11:22
comments: true
categories: refactoring
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
  - Feature Envy [p. 78]
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

###Replace Loop with Conditional
```ruby
managers = []
employees.each do |e|
  managers << e if e.manager?
end
```

###Lazy Initialized Attribute
  - Initialize an attribute on access instead of at construction time.

```ruby
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

##Chapter 9: Simplifying Conditional Expressions

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

