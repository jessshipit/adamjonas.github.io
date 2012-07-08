---
layout: post
title: "=== case equality operator"
date: 2012-07-03 10:53
comments: true
categories: notes
---

###In a case statement...
``` ruby

case number
  when 5
    #some code
  when 3
    #more code
  else
    #something else
end
```

Behind the scenes 5 is being compared to number with the === operator, so 5 === number, 3 === number, etc
``` ruby
several = Proc.new { |number| number > 3 && number < 8 }
none = Proc.new { |number| number == 0 }

case number
  when several
    puts "several"
  when none
    puts "none"
end
```
In this case the several proc is being run and if it returns true it runs the puts --> this abstracts everything away