---
layout: post
title: "code smells and refactoring"
date: 2012-11-05 15:05
comments: true
categories: refactoring
---

- [Code smells](http://www.codinghorror.com/blog/2006/05/code-smells.html) Jeff Atwood.
- [Summary](http://www.cs.usfca.edu/~parrt/course/601/lectures/refactoring/refactoring.html)
- http://c2.com/cgi/wiki?RefactoringImprovingTheDesignOfExistingCode

- http://en.wikipedia.org/wiki/Code_refactoring
- [etymology of refactoring](http://martinfowler.com/bliki/EtymologyOfRefactoring.html)
  - The obvious answer comes from the notion of factoring in mathematics. You can take an expressions such as x^2 + 5x + 6 and factor it into (x+2)(x+3). By factoring it you can make a number of mathematical operations much easier. Obviously this is much the same as representing 18 as 2*3^2. 

improve internal structure, but don't change the external behavior

- list of refactors - slide 7 in <http://www.slideshare.net/MarcusDenker/refactoring-1921411>

- code is written once, but read many times.


[refactoring list from fowler](http://www.refactoring.com/catalog/index.html)


  - [Spaghetti Code](http://en.wikipedia.org/wiki/Spaghetti_code)
    - Spaghetti code is a pejorative term for source code that has a complex and tangled control structure. It is named such because program flow tends to look like a bowl of spaghetti, i.e. twisted and tangled.

  - Duplicated Code
  - long method
  - large class
  - long parameter list
  - temporary variable assigned more than once, but not a loop or collection

  - [extract method](http://www.refactoring.com/catalog/extractMethod.html)
    - push logic to the model -> conditional logic belongs in the model
    - we're going to push the nastiness down into the model. That way it can be tested and, so we can more easily change it in the future. 

  - when you refactor, the first test is always create tests

  - good quotes <http://www.slideshare.net/hominhchuc/refactoring-your-code-key-step-to-agility-presentation>

  Martin Fowler : "a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior“.

  William C. Wake : "Refactoring is the art of safely improving the design of existing code“.

  RefactoringThe goal of refactoring is NOT to add new functionalityThe goal is refactoring is to make code easier to maintain in the futureThe process of refactoring involves the removal of duplication, the simplification of complex logic, and the clarification of unclear code.

  refactoring versus rewriting

  lego versus playdoh slide 9 <http://www.slideshare.net/NeilGreen1/the-roi-of-refactoring-lego-vs-playdoh>

  Everything I need to know about refactoring I learned in kindergarden