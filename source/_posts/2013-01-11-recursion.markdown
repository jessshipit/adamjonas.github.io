---
layout: post
title: "Recursion"
date: 2013-01-11 22:04
comments: true
categories: recursion
---

- [How to write a recursive method](http://www.youtube.com/watch?v=MyzFdthuUcA)

1. Step one- write 'if'
  a. There must be two cases: a recursive case (where the method calls itself) 
  b. and a base case (where the method does not)
2. Handle the simplest case(s).
  a. Simplest = no recursive call needed (no looping)
3. Write the recurisve call(s)
  a. On the next simplest input/state
4. Assume the recursive call works (maybe store the result in a variable)
  a. Ask yourself, what does it do?
  b. How does it help?

9! = `9*8*7*6..`
10! = `10*9!`
n! = n * (n - 1)! -> a recursive definition of factorial


```ruby
def factorial(n)
  if n == 0
    return 1
  else
    result = factorial(n - 1) #computes n-1 factorial
    result * n
  end
end

- [How recursion works](http://www.youtube.com/watch?v=ozmE8G6YKww)


