---
layout: post
title: "Procs and lambdas"
date: 2012-07-03 10:53
comments: true
categories: ruby notes TODO
---

You know how everything in Ruby is an object, well, as it turns out that's not quite true. Ruby blocks are not objects! So, blocks are not objects, but you can turn them into objects without too much trouble. We do this by wrapping our block in an instance of the Proc class...

Procs and lambdas are basically blocks that have been assigned to variables.


PROCS:

Treehouse notes:
- Need to pass a block in as a parameter when creating a block. (even if it is an empty block)
```ruby
my_proc = Proc.new {}
#OR
my_proc = proc {}
#call with 
my_proc.call
```
- you call a proc with the method .call -> my_proc.call

```ruby passing in parameters
my_proc = proc { |name| puts "Hello, #{name}" }
#call with no parameters
my_proc.call #=> "Hello, "
my_proc.call("Adam") #=> "Hello, Adam"
```


Very standard to pass along a code block to the each method

block_given? --> method to check whether a block was given to a method or not

A proc --> a nameless or anonymous block of code that can be represented as an object, can be passed around and called at will

``` ruby E.G.
class Array
def random_each(&b)  # => with the ampersand, b essentially becomes a reference to the code block below.
  shuffle.each do |el|
    b.call el  #=> b is a proc
    end
  end
end

[1,2,3,4,5].random_each do |el|
puts |el|

end
```
You can only pass a single block to a method at one time, but you can pass multiple procs around because they are regular object like arrays or strings.

``` ruby E.G.
Def run_two_procs (a, b)
  a.call
  b.call
end

proc1 = Proc.new do
puts "This is proc1"
end

proc2 = Proc.new do
puts "This is proc2"
end

run_two_procs proc1, proc2
```
If you have a code block, you can call it with yield, you can use the ampersand argument to convert it into a proc,

**if you use Proc.new without giving it a code block to assign to that Proc, Proc.new will look to see if the current scope has been passed a code block and then it will use that --> it will do it all implicitly, you don't need to specify anything here. If it can't find a block (e..g if you commented the block below) it raises an error. Proc.new wants a block passed directly or it implicitly picks it up from the current scope/environment.

``` ruby
Def run_block
  p = Proc.new # **see above
  p.call
end

run_block do
puts "Hello World'

end
```

In Ruby 1.9 there are 4 main ways to run or call a block:
``` ruby Proc e.g.
my_proc = Proc.new do |a|
  puts "This is a proc and #{a} was passed along to me"
my_proc.call(10) #call method that passes in 10
my_proc.(20) #this isn't a typo, gets converted to a call
my_proc[30] #
my_proc === 40 # triple equal is called the case equality operator, it's primary function is used in case statements

several = Proc.new { |number| number > 3 && number < 8 }
none = Proc.new { |number| number == 0 }

case number
when several
  puts "several"
when none
  puts "none"
end
```
-->In this case the several proc is being run and if it returns true it runs the puts --> this abstracts everything away


***Lambdas***

Treehouse notes:
```ruby
my_lambda = lambda {}
#OR
my_lambda = -> {}
```
Can't assign variables to keywords

Lambdas are much more sensitive than Procs to parameters. Much like methods, they need to receive the exact number of arguments as defined. Procs will just grab nil if nothing has been passed in.

```ruby passing in parameters
my_lambda = lambda { |name| puts "Hello, #{name}" }
#call with no parameters
my_lambda.call #=> breaks!- wrong number of arguments
#when you create a lambda the arguments are required....
my_lambda.call("Adam") #=> "Hello, Adam"
```


Closures

In ruby a closure is like an anonymous code block, but that maintains references to local variables and were being used at the time of the definition of that code.
``` ruby
def run_proc(p)
  p.call
end

name = "Fred"

print_a_name = proc { puts name } # this name doesn't exist in the definition above. This magic is called a closure. (23 Min)

run_proc print_a_name
```

ALSO:
``` ruby
def run_proc(p)
  p.call
end

name = "Fred"
print_a_name = proc { puts name }
name = "John"

run_proc print_a_name # => now this will output John because it kept a reference to the local variable.
```

Returns:
- The lambda returns the last line of the method just like a regular method
- A proc returns only what is executed INSIDE the proc.


[Video](http://www.youtube.com/watch?v=VBC-G6hahWA)

[DOCUMENTATION](http://www.ruby-doc.org/core-1.9.3/Proc.html)

SOME MORE READING:

<http://www.skorks.com/2010/05/ruby-procs-and-lambdas-and-the-difference-between-them/>

<http://pine.fm/LearnToProgram/?Chapter=10>

<http://strugglingwithruby.blogspot.com/2009/02/ruby-proc.html>

<http://pragdave.blogs.pragprog.com/pragdave/2008/09/fun-with-procs.html>