---
layout: post
title: "MongoDB &amp; Mongoid"
date: 2012-07-28 12:17
comments: true
categories: mongoDB
---

[Mongo Cheat Sheet](http://blog.wiemann.name/mongoid-cheat-sheet)

#NoSQL#
Non-relational, next-generation operational datastores and databases
-databases designed for the web and attacking the traditional problems that traditional DBs have such as scaling out.

-Horizontally scalable architectures => no joins + no complex transactions

Datamodels:

1. Key / Value Stores - (memcached, Dynamo)
2. Tabular (BigTable) - a hybrid
3. Document Oriented (MongoDB, CouchDB)

Memcached and key/value are high on the scalability and performance side, but low on depth of functionality

RDBMS (relational database management systems) - strong depth of functionality with join models etc., low on the scalability and performance scale.

MongoDB- try to get the scalability and performance of a key/value store and try to make as functional as possible

What's Missing?
- Joins
- Complex multi-row transactions
- SQL

Terminology:
In RDBMS // MongoDB
 - database => database like in MySQL
 - table => collection
 - row => document

 MongoDB uses JSON style documents called BSON (binary JSON)
-There are not predefined schemas, can use nested structures to embed complex values based on the keys
-

```
post = {author: "mike",
date: new Date (),
text: "my blog post",
tags: ["mongodb", "intro"]} 

db.posts.save(post)
```

MongoDB expects to have every document to have a '_id' key-- it's a ***unique primary key****

###Dynamic Queries###
```
db.posts.find({author: "mike"})

#more advanced
db.posts.find()
        .sort({date: -1})
        .limit(10)
```

MongoDB has its own document based query language.

###Indexing###
B-Tree indexes
```
db.posts.ensureIndex({tags: 1})

#Indexing / Querying on Embedded Docs (dot notation)
db.posts.find({"comments.author": "eliot"})

```

***Focus on Performance***: 
Don't use REST to talk to the database. Use a binary TCP wire protocol because it is faster.

###Replica Sets###
similar to master-slave replication, but there is a primary and secondary node

###Auto-sharding###
- split up the data so certain shards (which are groups of nodes- replica set or master //slave) are responsible for some subset of the data

[Intro video](http://www.youtube.com/watch?v=bwAqN9l14kI)

[###Types###](http://www.mongodb.org/display/DOCS/MongoDB+Data+Modeling+and+Rails)


##Mongoid##
[Cheatsheet](http://blog.wiemann.name/mongoid-cheat-sheet)
[Intro by the creator](http://vimeo.com/9864311)
[RailsCast](http://railscasts.com/episodes/238-mongoid)
[Docs](http://mongoid.org/en/mongoid/)

-Mongoid by default stores documents in a collection that is the pluralized form of the class name. For the following Person class, the collection the document would get stored in would be named people.

When a document is stored in the database the ruby object will get serialized into BSON and have a structure like so:
```
{
  "_id" : ObjectId("4d3ed089fb60ab534684b7e9"),
  "title" : "Sir",
  "name" : {
    "_id" : ObjectId("4d3ed089fb60ab534684b7ff"),
    "first_name" : "Durran"
  },
  "addresses" : [
    {
      "_id" : ObjectId("4d3ed089fb60ab534684b7e0"),
      "city" : "Berlin",
      "country" : "Deutschland"
    }
  ]
}
```
###Querying###
```ruby Mongoid Querying
Band.where(name: "Depeche Mode")
Band.
  where(:founded.gte => "1980-1-1").
  in(name: [ "Tool", "Deftones" ]).
  union.
  in(name: [ "Melvins" ])
```

###Attributes###
All relations contain a target, which is the proxied document or documents, a base which is the document the relation hangs off, and metadata which provides information about the relation.

attr_accessible and validation are the same in Mongo as in ActiveRecord

embeds_many similar to has_many => but the information is embedded in the document rather than in a separate record like in ActiveRecord. Will I need to fetch this record outside of the parent? If so, I need than has_many makes more sense. The advantage of course is that the information is right inside that record.

***Embedded 1-1 relationships***
:    The parent document of the relation should use the embeds_one macro to indicate is has 1 embedded child, where the document that is embedded uses embedded_in.

***Embedded 1-Many****
:   The parent document of the relation should use the embeds_many macro to indicate it has n number of embedded children, where the document that is embedded uses embedded_in.

***Referenced 1-1***
:    The parent document of the relation should use the has_one macro to indicate is has 1 referenced child, where the document that is referenced in it uses belongs_to.

***Referenced Many-to-Many***
:    Many to many relationships where the inverse documents are stored in a separate collection from the base document are defined using Mongoid's has_and_belongs_to_many macro. This exhibits similar behavior to Active Record with the exception that no join collection is needed, the foreign key ids are stored as arrays on either side of the relation.


