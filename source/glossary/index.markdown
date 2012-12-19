---
layout: page
title: "glossary"
date: 2012-10-16 10:51
comments: false
sharing: true
footer: true
---

Black-box testing
>is a method of software testing that tests the functionality of an application as opposed to its internal structures or workings (see white-box testing).

Business Rule
>A business rule defines or constrains one aspect of your business that is intended to assert business structure or influence the behavior of your business.  Business rules often focus on access control issues, for example, professors are allowed to input and modify the marks of the students taking the seminars they instruct, but not the marks of students in other seminars.[Reading](http://www.agilemodeling.com/artifacts/businessRule.htm)
[Also](http://www.businessrulesgroup.org/first_paper/br01c1.htm) 

Cardinality
>The cardinality of a set is a measure of the "number of elements of the set". For example, the set A = {2, 4, 6} contains 3 elements, and therefore A has a cardinality of 3.

Casting
>Treating one data type as another. Example in ruby (.to_i) and the cast() function in SQL

Canonical
>Simplest or standard form. e.g. A canonical page is the preferred version of a set of pages with highly similar content.

Connascence
>two components are connascent if a change in one would require the other to be modified in order to maintain the overall correctness of the system. [wikipedia](http://en.wikipedia.org/wiki/Connascence_(computer_programming))

Daemons
>are special system applications which typically execute continuously in the background and await requests for the functions they provide from other applications. 

Defensive Programming
>a form of defensive design intended to ensure the continuing function of a piece of software in spite of unforeseeable usage of said software. The idea can be viewed as reducing or eliminating the prospect of Murphy's Law having effect. Defensive programming techniques are used especially when a piece of software could be misused mischievously or inadvertently to catastrophic effect.

Duck Typing
>an object's type is determined by what it can do, not by its class.

Fixtures
>refers to the fixed state used as a baseline for running tests in software testing. The purpose of a test fixture is to ensure that there is a well known and fixed environment in which tests are run so that results are repeatable.

Idempotent
>is the property of certain operations in mathematics and computer science, that they can be applied multiple times without changing the result beyond the initial application.

Indirection
>the ability to reference something using a name, reference, or container instead of the value itself. For example, accessing a variable through the use of a pointer.
  - Object-oriented programming makes use of indirection extensively, a simple example being dynamic dispatch.
  - Delegation is another classic example of an indirection pattern.

Kata
>is a Japanese word describing detailed choreographed patterns of movements practiced either solo or in pairs. The term form is used for the corresponding concept in non-Japanese martial arts in general.

Lazy Evaluation
>it will stop as soon as it finds a true expression.
```ruby Lazy Evaluation
def lazy
	if true
		"this is outputted"
	elsif this
		"it never gets here"
end
```

Levels of Abstraction
>Going up levels of abstraction means removing the details.

Marshalling
>The transformation of components stored in the memory of the device into usable data that may be utilized by one or more of the programs residing on the hard drive. The action of gathering data into storage areas for easy retrieval is greatly enhanced by the process of marshalling, as it allows programs to recover the data for use without the need to translate the components each time the action is called for. From this perspective, marshalling aids in the speedy function of many of the software programs used in homes and businesses every day.

Mock
>also called double, a mock is “an object that stands in for another object in an example”. This means that if we want to test the interaction between an object and another, we can mock the second one.

Polyglot
>a computer program that is valid in more than one programming language... in the context of a hash it could mean it is able to include a float, a string, an integer.

Primitive Type
>a basic type is a data type provided by a programming language as a basic building block. e.g. a hash, an array, etc.

Protocol
>describes the syntax, semantics, and synchronization of communication between two objects. It may be a technical standard like HTTP. Protocols are to communications what programming languages are to computations. [wiki](http://en.wikipedia.org/wiki/Communications_protocol)

Recursion
>the process of repeating items in a self-similar way. For instance, when the surfaces of two mirrors are exactly parallel with each other the nested images that occur are a form of infinite recursion.

Referential integrity
>The data in a foreign key needs to match the primary key in some record of the original table. Referential integrity assures there are no broken links between tables. Note that if you delete a record in the original table, for example, you delete one of the customers from the customer table, referential integrity requires that you delete all references to that customer in the order table. (see [:dependent => :destroy](http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html) for rails)

Serialization
>the context of data storage and transmission, serialization, is the process of converting a data structure or object state into a format that can be stored (for example, in a file or memory buffer, or transmitted across a network connection link) and "resurrected" later in the same or another computer environment. Also referred to as deflating or marshalling an object.

SDK
>software development kit

Stub
>A stub is a small program routine that substitutes for a longer program, possibly to be loaded later or that is located remotely. 

Tautology
>true by virtue of its logical form alone.

TMTOWTDI
>A.K.A. "Tim Toady". There's More Than One Way To Do It.

SDK
>software development kit

Unified Modeling Language (UML)
>a standardized general-purpose modeling language in the field of object-oriented software engineering. 

Use Case 
> a list of steps, typically defining interactions between a role (known in "Unified Modeling Language" as an "actor") and a system, to achieve a goal. The actor can be a human or an external system.

White box testing
>(a.k.a. glass box testing) is a method of testing software that tests internal structures or workings of an application, as opposed to its functionality (i.e. black-box testing).

WIP
>work in progress