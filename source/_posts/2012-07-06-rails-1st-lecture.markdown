---
layout: post
title: "Rails 1st Lecture"
date: 2012-07-02 10:53
comments: true
categories: rails lecture notes
---

Rails Lecture I - July 2

***How the web works:***
-the requests we send to other servers have headers with info about the request
-you get the response with a header and the body
-the body is just text and data with HTML
-the communication happens over TCP/IP, namely HTTP
- the browser renders the HTML by making it pretty
-we use GET, POST, PUT, and DELETE -

4 imporotant HTTP Verbs-->
GET- retrieve representation of content
POST- Submits data
PUT- Update
Delete- Deletes a specific resource

Convention over configuration
-we wants defaults

There are naming schemes such as:
all tables pl
all models are sigular
controller songs_controller.rb
views songs/

***Gems:***
pre-packaged piece of software that ruby uses

Config Folder--> where the configuration of our app lives
-Database.yaml- this is how we communicate the database

App Folder: spend most of our time in the app directory

***MVC:*** (7:42 pm)
Models: define how data is created, retrieved, updated and deleted--> the only code that defined these 4 actions are in the model

Controllers: where to send the data to
business logic

Views: display logic

Helpers: helper functions for your views
db: stores your database and all the instructions for your database

lib: code that you app needs but isn't part of the request cycle
-tasks- background tasks

public dir:
any code that doesn't require the rails stack to run

vendor: any 3rd party library that you didn't write
-- similar to the lib directory that you didn't write

***REST:***
-Representational State Transfer
-URL: unifeied resources locators
- there should be a unified way to expose resources to the world
-1st concept: the things we get online are resources-- what the server is going to respond with is a representation of the real thing (since it can't deliver the real thing)
-there should be consistency and predictability-

rails generate resource song title:string duration:integer #always singular
rails generate scaffold song title:string #in the beginning the first few resources are created by scaffolds

***MIGRATIONS:*** defines a db strcuture
every resource has it's own table

***SQL:*** server query language or standard query language

***SCHEMA-*** describes the structure of the DB

***RAKE:*** a ruby library to run background tasks
```
rake stats-- gives me stats on the app
rake about--> outputs info about the environment, etc
rake -T --> outputs provides commands
```

VIDEO 2...

migrations are iterative by nature
every migration should one and only one thing

rake db:migrae runs the migration
rake db:rollback rolls back the migration

***OBJECT ORIENTATION***
-what to create metaphors in our code to representations of the real world
``` ruby
Song.find(2) #=> finds the object of id 2
Song.all #=> returns all the instances of the class
```
***ORM: object relational mappers***
- a class is to a table : an instance of a class is to a row of a table
-every instance is going to wrap a row of a table
-one to one relationship between an instance and a row
-the library, the ORM, allows you to relate to the objects with knowing how the objects are related

Programming is just codifying procedural knowledge

***DOCUMENTATION:***
Rails Guides: more like how-tos
Rails API: the more technical version