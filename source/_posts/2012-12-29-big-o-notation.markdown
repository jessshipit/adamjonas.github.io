---
layout: post
title: "Big O Notation"
date: 2012-12-29 22:59
comments: true
categories: algorithm bigO
---


###What is it? Let me say it a few different ways...
  - Big-O measures how well an operation will “scale” when you increase the amount of “things” it operates on.
  - Big-O can be used to describe how fast an algorithm will run, or it can describe other behavior such as how much memory an algorithm will use.

>Big O notation refers to the asymptotic upper bound (see below for fuller explanation), which means that it's a cap on how much the time complexity will grow. If we say that a function is O(1), then there's no growth and the function will always take a fixed amount of time to complete. If we say that a function is O(N) then if N doubles, the function's time complexity at most will double. It may be less, but never more. That's the upper bound of an algorithm, and it's the most common notation. [credit](http://eternallyconfuzzled.com/arts/jsw_art_bigo.aspx)

###Asymptotic Bounds
  - By removing the constants from an equation, we can focus on the part of the measure that grows and derive a simplified asymptotic bound on the algorithm.
  - **The reference to bounds is pretty much a reference to the best-case (lower bound, also known as Omega -> Ω) and worst-case (upper bound, also known as Big O) scenarios.**
    - **If these end up being the same, we can call it theta -> Θ.**
  - For more on Asymptotic Bounds, read a [good explanation](http://eternallyconfuzzled.com/arts/jsw_art_bigo.aspx).

###Time complexity
  - Time complexity is a measure of efficiency.
    - In a list of N items, how many times do I need to go through this list to get the task done?
      - e.g. which number is the smallest. Only once I pass through the entire list can I figure out which is the smallest. *It must make N comparisons.*
      - Selection sort and bubble sort are N^2 algorithms.

  - *O(1)* -> Constant Time -> describes an algorithm that will always execute in the same time regardless of the size of the input data set.
```ruby This will never change no matter the size
def checking_nil(array)
  if array[0] == nil
    return true
  else
    return false
  end
end
```
Another e.g. determining if a number is even or odd.

  - *O(log n)* -> logarithmic time -> Any algorithm which cuts the problem in half each time is O(log n). The operation will take longer as the input size increases, but once the input gets fairly large it won't change enough to worry about. If you double n, you have to spend an extra amount of time t to complete the task. If n doubles again, the time it takes to complete the task won’t double, but will increase by a constant amount. (e.g. a binary search tree
    - A *Binary Search Tree* is a tree comprised of multiple nodes with one root node to start with.  Each node has a value, left node, and a right node.  The left node value has to be less than the current node value, while the right node value is greater than the current.  The biggest concern with a binary search tree is balancing.  If the tree becomes unbalanced, the O(log(n)) benefit can become O(n) if the tree unbalanced (a tree with only a right path).
      - [further Binary Search Tree reading](http://styliii.com/blog/2012/12/26/what-is-a-binary-search-tree/))
  - *O(N)* -> Linear Time -> the larger the input, the longer it takes. AKA it will grow linearly and in direct proportion to the size of the input data set.
  - *O(n log n)* means that you’re performing an *O(log n)* operation for each item in your input. Most (efficient) sort algorithms are an example of this including quicksort (in the average and best case), heapsort and merge sort.
  - *O(N^2)* represents an algorithm whose performance is directly proportional to the square of the size of the input data set. Every time n doubles, the operation takes four times as long. (e.g.s are comparison algorithms like quicksort and bubble sort)
  - *O(2^N)* -> exponential time -> denotes an algorithm whose growth will double with each additional element in the input data set. Totally impractical for any reasonably large input size *n*.
  - *O(n!)* -> factorial time -> for all possible permutations... that's just crazy.

Constant Time -> O(1) < Linear Time -> O(n) < Linearithmic Time -> O(nlogn) < Quadratic -> O(n^2)


| Big-O | Operations for 10 “things” | Operations for 100 “things” |
| ----- | -------------------------- | ------------------ |
| O(1) | 1 | 1 
| O(log n) | 3 | 7 
| O(n) | 10 | 100 
| O(n log n) | 30 | 700 
| O(n^2) | 100 | 10000 
| O(2^n) | 1024 | 2^100 – a lot! 
| O(n!) | 3628800 | 100! – also a lot! 


[{% img left /images/time-complexity.png Time Complexity %}](http://therecyclebin.files.wordpress.com/2008/05/time-complexity.png)



##Further reading:
  - [stackoverflow](http://stackoverflow.com/questions/107165/big-o-for-eight-year-olds/107189#107189)
  - [Rob Bell's Beginner's Guide](http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/)
  - [This nails asymptotic notation](http://eternallyconfuzzled.com/arts/jsw_art_bigo.aspx)
  - [Pulled a lot from here](http://recursive-design.com/blog/2010/12/07/comp-sci-101-big-o-notation/)