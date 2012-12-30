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

  - *O(log n)* -> logarithmic time -> Any algorithm which cuts the problem in half each time is O(log n). The operation will take longer as the input size increases, but once the input gets fairly large it won't change enough to worry about. If you double n, you have to spend an extra amount of time t to complete the task. If n doubles again, the time it takes to complete the task won’t double, but will increase by a constant amount. (e.g. [binary search tree](http://styliii.com/blog/2012/12/26/what-is-a-binary-search-tree/))
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


###Selection Sort
  - [Vid](http://www.youtube.com/watch?v=MZ-ZeQnUL1Q)
  - Time complexity is O(n^2). It makes n comparisons, n times. It needs to make a pass through the list for every element it sorts.
  - For whatever data you give it, it will make the exact same amount of comparisons. Even if you give selection sort a sorted list, it still will have to make the same amount of passes. Thus, the best case, worst case and average case are all O(n^2).

###Bubble Sort
  - [Vid](http://www.youtube.com/watch?v=jAoBsroEow4)
  - Compare items with the item to its right (or left).
  - Large numbers are pushed to the right side of an unsorted list.
  - Called a bubble sort since the large numbers rise up to the right.
  - A O(n^2), same time complexity as selection sort. 
    - while selection sort will always be a O(n^2), bubble sort may be more efficient if the list is fully sorted. 
    - the best case is a O(n), while the average and worst case are both O(n^2)

###Cocktail Sort
  - [Vid](http://www.youtube.com/watch?v=Xmx_6YRBaq8)
  - Saw in bubble sort, that larger numbers rise to the right.
    - The larger numbers are sorted to the right and on the pass back, the smaller numbers are bubbled to the left. 
    - The time complexity is still O(n^2) and is pretty similar to bubble sort.

###Insertion Sort
  - Only makes one pass through the list. This doesn't mean it is an efficient alorithm.
  - Start at the second element 
  - with each new item, you are sorting the item in its correct position it will be sorted in its relative position. 
    - Every arrow to the left are sorted properly.
  - As it is inserting itself back through the list, but this is still n comparisons or n items meaning it is a O(n^2) time complexity.
  - The best case scenario is like bubble sort of n comparisons. An inversely sorted list will require O(n^2).

###Bucket Sort
  - [Vid](http://www.youtube.com/watch?NR=1&feature=endscreen&v=ovAfqUafjAA)
  - Not a sorting algorithm. It breaks down a list into sub-lists. The purpose is to break it down into smaller chunks so that each list takes less time to sort than the larger list.
    - Instead of sorting one list of 8 items, I could sort two lists of 4 items.
      - need to know the upper and lower items of each list.
  - Why do this? Because if you use bubble sort you reduce the overall time complexity of N^2 if the list 8^2 items by making it 2 x 4^2.
  - Average case is O(n+k), k represents the number of buckets created. Worst case scenario is still O(n^2).

###Recursion
  - similar to recurrence relations in math
  - any form of recursion must have a base case for the recursion to stop as well as a recursive case which makes recursive calls to itself.

###Quick Sort
  - sorting algorithm that relies on recursion.
  - where you put the pivot doesn't matter, pointers go to the extreme left or right of the list
  - the items at the pointers are compared
  - when both pointers and pivot are at the same value, it is in the right position
  - recursively done on the left sublist and then the right sublist.
  - Time complexity -> O(nlogn) for best and average. An inversely sorted list will still require O(n^2).


##Further reading:
  - [stackoverflow](http://stackoverflow.com/questions/107165/big-o-for-eight-year-olds/107189#107189)
  - [Rob Bell's Beginner's Guide](http://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation/)
  - [This nails asymptotic notation](http://eternallyconfuzzled.com/arts/jsw_art_bigo.aspx)
  - [Pulled a lot from here](http://recursive-design.com/blog/2010/12/07/comp-sci-101-big-o-notation/)