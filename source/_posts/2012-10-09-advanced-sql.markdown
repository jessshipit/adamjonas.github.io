---
layout: post
title: "Advanced SQL"
date: 2012-10-09 20:58
comments: true
categories: SQL
---

INNER JOIN is the same as JOIN.

```
SELECT title, artist
  FROM album JOIN track
         ON (album.asin=track.album)
 WHERE song = 'Alison'
```

Index structures: if you create an index on the primary key and then search for a row of data based on one of the primary key values, SQL Server first finds that value in the index, and then uses the index to quickly locate the entire row of data. Without the index, a table scan would have to be performed in order to locate the row, which can have a significant effect on performance. [source](http://www.simple-talk.com/sql/learn-sql-server/sql-server-index-basics/)

Many databases have one special index per table where all of the data from a row exists in the index. SQL Server calls this index a *clustered index*. Instead of an index at the back of a book, a clustered index is closer in similarity to a phone book because each index entry contains all the information you need, there are no references to follow to pick up additional data values.[Source](http://odetocode.com/code/237.aspx)

The *EXPLAIN* statement can be used either as a way to obtain information about how MySQL executes a statement, or as a synonym for DESCRIBE. [source](http://dev.mysql.com/doc/refman/5.0/en/explain.html) In other words, a SQL statement can be preceded by the keyword "EXPLAIN" or by the phrase "EXPLAIN QUERY PLAN". Either modification causes the SQL statement to behave as a query and to return information about how the SQL statement would have operated if the EXPLAIN keyword or phrase had been omitted. [source](http://www.sqlite.org/lang_explain.html)

###Normalized DB###
 - A normalized database is one where you minimize duplication of data by keeping groups of data in separate tables and linking (using indexes) between the tables. 
 - Another def: Database normalization is the process of organizing the fields and tables of a relational database to minimize redundancy and dependency. Normalization usually involves dividing large tables into smaller (and less redundant) tables and defining relationships between them. The objective is to isolate data so that additions, deletions, and modifications of a field can be made in just one table and then propagated through the rest of the database via the defined relationships.


###Optimization###

- Write operations are always more expensive than reads.
- Use memCache
- use background tasks to do your database activity offline
- Denormalize: database normalization is a fatal mistake. 
	- A de-noramlized database is one where you keeps redundant frequently-accessed data, duplicated across several tables, making it possible to fulfill a user request without having to look at more than a single table.
	- The key to high performance database access is sticking to single-table SELECT queries with short indexes.
- MySQL Triggers (starting from MySQL 5.0) allow us to define a rule to perform whenever a certain table is updated.
[source](http://www.softwareprojects.com/resources/programming/t-database-performance-optimization-denormalization-1410.html)

The SQL HAVING clause is "like a WHERE clause for aggregated data." It's used with conditional statements, just like WHERE, to filter results. One thing to note is that any column name appearing in the HAVING clause must also appear in the GROUP BY clause.

```
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (game.team1='GER' OR game.team2='GER') AND goal.teamid <> 'GER'

SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON eteam.id = goal.teamid 
GROUP BY teamname

SELECT stadium, count(teamid)
FROM game join goal on matchid=id
group by stadium

SELECT matchid,mdate, count(teamid)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid

SELECT day_of_order,
  product,
  SUM(quantity) as "Total"
FROM orders
GROUP BY day_of_order,product,quantity
HAVING quantity > 7
ORDER BY day_of_order;
```

Other functions min, max, sum, count, cast

[IN operator](http://www.w3schools.com/sql/sql_in.asp): The IN operator allows you to specify multiple values in a WHERE clause.

IN Clause:
```
SELECT * FROM Persons
WHERE LastName IN ('Hansen','Pettersen')
```

casting in ruby (.to_i)