---
layout: post
title: "SQL DB talk from CTO of Behance"
date: 2012-10-10 17:52
comments: true
categories: SQL
---

lock_time the time the server will wait 

rows examined

tmp_tables - creating these temp tables are bad

[cartisan product](http://en.wikipedia.org/wiki/Cartesian_product)

indexes- once you created them run completed under the hood
can only use one index per table


[Query execution plan](http://www.simple-talk.com/sql/performance/execution-plan-basics/)
[more reading](http://www.codeproject.com/Articles/9990/SQL-Tuning-Tutorial-Understanding-a-Database-Execu)

- only way to get around this is to change the structre-- i.e. denormalization

###Indexes###

- cost per write -> re-indexing
- Can use indexes to set constraints on your data

Cardinality
: how chunky your data is


```
SELECT COUNT(*) title FROM tags t INNER JOIN tags_entity_links tel ON t.id = tel.tag_id WHERE category = 1 AND title
```

The tags are polymorphic:
tag table
id | tag_id | id_for_table | type

performance to denormalization
??performance or aggregate data

composite index

LEFT JOIN or RIGHT JOIN will show the nulls that wouldn't be included in INNER JOIN


The NoSQL camp is a return to hierarchical data stores - a 40 year old 

count or cache

three seperate databases = 3 apps

Testing:
	
	apache bench
	watch the slow logs
	cacti tool
	load on the server


###Questions###
?? why mysql over postgres?
	
	right place right time

MySQL:
-percona port makes the most sense for mysql-

?? many proj has many tags - many to many - goes through what join table?

Look up:
-jumping words in the terminal