---
layout: post
title: "Enumerables and OO- Class Notes for Lecture 5"
date: 2012-06-17 10:40
comments: true
categories: ruby lecture notes
---

(FROM THE VIDEO)

diff between each and map (map reduce)- 12min:30

while each will only return to you the array
map will return a modified version of the array's element based on the operation-- will save the result in a new array
each will simply execute the block

another syntax for blocks:
do / end (better for multi line) as well as curly braces {}- better for single line

how map works with a block 19min:19

Iterators (AKA finder methods) and blocks:
detect- (also works like find)
when you want to find the first of something in an enumerable
after it finds an element that makes the block true is stops iterating

select is like detect but wont stop

reject returns an array for items in self for which the block is NOT TRUE.

all will return true as long as all the element pass what's in the block

any- like all but less specific

none is the opposite of all

Sort and Sort By: (34 min)

REG EX PATTERNS- /w+/ - not space characters
(/a|e|i|o|u/) - vowels

<=> spaceship operator

(42MIN) return values-- it's the last expression evaluated
but there is an explicit return keyword
?? can the return keyword go on a diferent line rather than the last line?

46 min 30 Object Orientation

prime method 51 min
completed at 57 min
Big O notation is used to compare the efficiency of algorithms
See: http://en.wikipedia.org/wiki/Big_O_notation and
http://blogs.msdn.com/b/alfredth/archive/2006/08/24/717085.aspx

Ranges:
a..c --> a, b, c
a...c --> a, b

equal? method works by comparing object ids

an instance is an occurance, a member of the species

setter methods (1 hr 8 Min)

instance variable (1 hr 10 min)
local to the instance they are created in

initialization --> def initialize (1 hr 20min)

Constants - have a more global scope-- either one letter capital or all capitals
shouldn't reassign constants once they have been assigned
we use upper case letters for class names, because it is a constants
ALL UPPERCASE are reserved for global variables

:: Ruby syntax for name spacing

Global variables begin with $, but you should never use them... they aren't neccessary

For further reading on Variable Scope see:
http://www.techotopia.com/index.php/Ruby_Variable_Scope (1 hr 30 min)

puts- what is the receiver of puts?
- the implicit receiever of puts is self (1 hr 32 min)

accessor_writer
accessor_reader
accessor_attr (1 hr 36)

E.G. teaching dogs how to compare to other dogs (1hr 37)

E.G. can make strings case insensitve (1 hr 39)

Rebuilding the Jukebox (1 hr 40)
send method (1 hr 46)
Avi's solution (1 hr 49)