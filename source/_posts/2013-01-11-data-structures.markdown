---
layout: post
title: "Data Structures"
date: 2013-01-11 17:55
comments: true
categories: algorithms
---

###MIT lecture on Intro to Algorithms
*Analysis of algorithms:*
>the theoretical study of computer program performance and resource usage

- What is more important than performance?
  - correctness
  - simplicity
  - maintainability
  - stability / robustness
  - features / functionality
  - modularity
  - security
  - user friendliness

- Why study this then?
  - real time constraints
  - sometime user friendliness is a function of performance
  - performance measures the line between feasible and infeasible -> algorithms are on the edge of entrepreneurship
  - algorithms provides a common language to talk about programming behavior
  
- Permutation (an arrangement of numbers)

>Take a bunch of numbers and arrangement them in order

- Insertion sort: 
  - depends on the input order. If sorted, there is little work to do. Worst case is if it is reverse sorted.
  - depends also on the input size.
  - *expected time* is the time of every input multiplied by the probability of every input AKA a weighted average.
    - the assumption is based on the statistical distribution of the inputs
      - all inputs are equally likely -> uniform distribution
    - a best case analysis is bogus...

Relative speed:
>speed that depends on the speed of the 

Absolute speed:
>speed that depends on the speed of the 

Asymptotic Analysis:
>Considers the performance of algorithms when applied to very large input datasets. It ignores machine dependent constants and focuses on the growth of the running time.

- Asymptotic notation:
  - Theta notation -> drop low order terms and ignore leading constants
  - e.g. -> `3n^3 + 90n^2 - 5n + 6046 = θ(n^3)` in asymptotic notation
    - As n approaches infinity, `θ(n^2)` **always beats** `θ(n^3)` alogrithm.

Sometimes choosing a slower algorithm allows you to attack a problem that a faster algorithm would not allow you to. (56 min)

- can 

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
  - Only makes one pass through the list. This doesn't mean it is an efficient algorithm.
  - Start at the second element 
  - with each new item, you are sorting the item in its correct position it will be sorted in its relative position. 
    - Every arrow to the left are sorted properly.
  - As it is inserting itself back through the list, but this is still n comparisons or n items meaning it is a O(n^2) time complexity.
  - The best case scenario is like bubble sort of n comparisons. An inversely sorted list will require O(n^2).
  -> moderately fast for small n, but not at all for large n

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

###Merge Sort
- MIT-> 1:03
- A[1..n]

1. If n=1, done
2. Recursively sort A[1..(n/2)] && A[n/2+1..n] (we are sorting two halves of the input)
3. Take the two lists and merge them 
  a. say you have two lists [2, 7, 13, 20], [1, 9, 11, 12]
  b. check the head of the two arrays, then ouput the smallest.
- The time to do this is θ(n) or linear time which is proportional to the size of n.

- Worst case this is a O(nlogn). Anything more than 30 this would be more performant than insert sort (1:20 MIT)

###Example
Given  a  sorted  array  of  integers,  how  can  you  find  the  location  of  a  particular  integer  x?

*Good  answer:*  Use  binary  search.   Compare  the  number  in  the  middle  of  the  array  with  x.   If  it  is  equal,  we  are  done.   If  the  number  is  greater,  we  know  to  look  in  the  second  half  of  the  array.   If  it  is  smaller,  we  know  to  look  in  the  first  half.   We  can  repeat  the  search  on  the  appropriate  half  of  the  array  by  comparing  the  middle element  of  that  array  with  x,  once  again  narrowing  our  search  by  a  factor  of  2.   We  repeat  this  process  until  we  find  x.  This  algorithm  takes  *O(log n)*  time.

*Not‐so‐good  answer*:  Go  through  each  number  in  order  and  compare  it  to  x.  This 
algorithm  takes  *O(n)*  time.

- ([from](http://courses.csail.mit.edu/iap/interview/Hacking_a_Google_Interview_Handout_1.pdf))