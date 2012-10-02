---
layout: post
title: "learn sql the hard way"
date: 2012-09-26 12:53
comments: true
categories: SQL
---

Schema:


```
♕ sqlite3 ex3.db .schema
/* OR */
♕ sqlite3 ex3.db
SQLite version 3.7.7 2011-06-25 16:35:1
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> .schema
CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	first_name TEXT,
	last_name TEXT,
```

In the first line I just make ex3.db from the ex2.sql file. Then I add the -echo argument to sqlite3 so that it prints out what it is doing. After that the data is in the database and ready to query.

```
$ sqlite3 ex3.db < ex2.sql
$ sqlite3 -echo ex3.db < ex3.sql 
INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, "Zed", "Shaw", 37);
INSERT INTO pet (id, name, breed, age, dead) 
    VALUES (0, "Fluffy", "Unicorn", 1000, 0); 
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);
```

**Important**
Always remember this: SQL ONLY KNOWS TABLES. In programming you deal in graphs and in SQL you deal in tables. They're related concepts, but the mental model is different.

```
/* I only want some columns from pet so I am explicit rather than using the '*' */
SELECT pet.id, pet.name, pet.age, pet.dead
/* To connect person and pet I use the person_pet JOIN table */
	FROM pet, person_pet, person
	WHERE
		#connect person and pet by the related id columns
		#now the DB can search for only the rows where the ID columns all match
	pet.id = person_pet.pet_id AND
		#connect person and person_pet in the same way
	person_pet.person.id = person.id AND
		#ask for only the pets that I own
	person.first_name = "Adam";
```

**Delete**
DELETE is like SELECT but it removes rows from the table.

```
DELETE FROM pet WHERE id IN (
	SELECT pet.id
	FROM pet, person_pet, person
	WHERE
	person.id = person_pet.person_id AND
	pet.id = person_pet.pet.id AND
	person.first_name = "Zed"
);

  SELECT * FROM pet; 
  SELECT * FROM person_pet;
  
  DELETE FROM person_pet
      WHERE pet_id NOT IN ( 
          SELECT id FROM pet
      );
  
  SELECT * FROM person_pet;
```
The WHERE clause uses an IN to match the id columns in pet to the table that's returned in the subquery. The subquery (also called a subselect) is then a normal SELECT.

How SQL does this is with the following process:
1. Runs the subquery in the parenthesis at the end and build a table with all the columns just like a normal SELECT.
2. Treats this table as a kind of temporary table to match pet.id columns against.
3. Goes through the pet table and deletes any row that has an id IN this temporary table.

*REPLACE*
```
/* We can force it by doing an INSERT OR REPLACE. */ 
INSERT OR REPLACE INTO person (id, first_name, last_name, age) 
    VALUES (0, 'Frank', 'Smith', 100);

SELECT * FROM person; 

/* And shorthand for that is just REPLACE. */ 
REPLACE INTO person (id, first_name, last_name, age) 
    VALUES (0, 'Zed', 'Shaw', 37);
```

*DROP TABLE*
```
  /* Only drop table if it exists. Use the IF EXISTS modifier and the table will be dropped only if it's already there. This suppresses the error you get when running you .sql script on a fresh database that has no tables. */
 DROP TABLE IF EXISTS person;
   
  /* Create again to work with it. */
  CREATE TABLE person ( 
      id INTEGER PRIMARY KEY,
      first_name TEXT,
      last_name TEXT, 
      age INTEGER
  );
	 
	/* Rename the table to peoples. */ 
	ALTER TABLE person RENAME TO peoples;
	 
	/* Add a hatred column to peoples. */ 
	ALTER TABLE peoples ADD COLUMN hatred INTEGER;
	   
	/* Rename peoples back to person. */
	ALTER TABLE peoples RENAME TO person; 
  
  .schema person
 
  /* We don't need that. */
  DROP TABLE person;
```
