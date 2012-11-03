---
layout: post
title: "Storm Weekend"
date: 2012-10-29 09:25
comments: true
categories: 
---

change the hotkeys in terminal to switch through the windows like sublime.

How the web works: HTTP and CGI explained
- cgi vs. api?

- Learn to Program 3
  - Required * in the builder label in the f.label and then use validation or create a new tag?
  - :builder argument in form_form
  - <% for award in student award %>
  - @student.awards.build(params[:id]), diff pattern of new?
  - unprocessessbile_entity
  - options_from_collection_for_select helper method
  - how do migrations work with a shared repo... lots of people pushing up. If you run rake db:migrate it can't run other's unapplied migrations. How is this handled?
  - in migrations, need to specify different types (like decimal) according to the DB- postgres vs. mysql. Or b/c it is database agnostic, the migration takes care of it?
  - unique at the model level or the migration level?
  - rails console --sandbox? exist? ever use this or just irb?
  - testing nested resources? using functional tests (for controllers)?
  - use of cookies not having to do with session?
    - javascript can reach directly into a cookie?
    - standard lifetime to set for a cookie? privacy vs. functionality?
  - <%=h  %> what tag is that with the h in it?
  - CookieStore (rails default -- all the info goes in the session object) vs ActiveRecord SessionStore (just the identifier and the rest in the DB) 
  - when would you use url_for?
   
  - SQL injection
  - HTML safe is needed in what context? related to cross-site scripting. Why not use in every tag? rails 3 does this automatically?
  - cross-site forgery- if a user remains logged in, CSRF allows someone from another site to use a POST request to gain access? How? authenticity token is the solution to authenticate that the request actually came from the proper client.[see](http://guides.rubyonrails.org/action_controller_overview.html#request-forgery-protection)
  - mongrel?
  - *=require_tree -> what is this? when to remove it like for SASS? 
  - whiny_nils
  - rails enterprise, ruby enterprise
  - is sanitize necessary any longer? examples?
  

- Notes:
  - belongs_to and has_many are method names that take parameters
  :dependent => :destroy prevents orphaned data and reinforces referential integrity
  - nesting a resouce is akin to making it subordinate
  - @course.students could return all the student objects enrolled in that course. With a many to many relationship attributes like @student.name and @student.gpa would also be accessible.
  - rake db:reset -> just resets to the last structure applied. Won't drop it like db:drop
  - add :index vs. t.reference?
  - rake test -> for running fixtures
  - unit testing is really model testing
  - rake test:units -> runs just the unit tests
  - flash notices are stored in a session object and only survive one redirect (or reloads) since they are stateless
  - dom_id helper lets you put identifiers into HTML documents.
  - before_filter :check_login -> creating a check_login method is the standard way to work on authorization after you have created authentication
  - rake routes | grep root is an easy way to get the route you are looking for.
  - [globbing](http://guides.rubyonrails.org/routing.html#route-globbing) route extensions using an asterisk. 
  - Sprockets started shipping with Rails 3.1 for compiling and serving web assets like javascript and css files.
  - gem 'gemname', '~> 2.11.12' --> only update the last number in the version number
  - gem 'gemname', '>= 2.11.12' --> only load 2.11.12 or higher

```ruby Gem File for dev vs. production
group :development do
  gem 'nifty-generators' '~> 0.4.6'
end

group :development do
  gem 'somethingineedforproduction'
end
```
```ruby Nested Routes
resources :students do
  resources :awards
end
#7 RESTful routes, but now they shift to student_award and new_student_award
#could create other nested routes like
resources :students do
  resources :awards
  resources :pets
end
```
*Resources should never be nested more than 1 level deep.* [see the guides for more on nested routes](http://guides.rubyonrails.org/routing.html#nested-resources)

```ruby HTTP Verb Constraints
match 'photos/show' => 'photos#show', :via => :get
```
[see](http://guides.rubyonrails.org/routing.html#http-verb-constraints)
Sassy CSS
$ is for variable names
& is for nesting

```
a {
color: #0b90834
#other stuff
} 

&.show {
color : #DB4327
#the ampersand means that it is nested in the above class
```


MIT Lecture:
layer the level of abstraction ~> like Ohm's Law

[How the web works](http://www.garshol.priv.no/download/text/http-tut.html)- reading:

>Uniform Resource Indicator (URIs) embodies both URLs and URNs
  >Uniform Resource Locator (URLs)- is what you think it is.
  >Uniform Resource Names (URNs)- similar in concept but don't have to occur over a network. (e.g. ISBN numbers are URNs)

- A web server is a just a computer program that listens for requests from browsers and then execute them.
- HTTP only defines what the browser and web server say to each other, not how they communicate. The actual work of moving bits and bytes back and forth across the network is done by TCP and IP, 
- Most URLs have this basic form: "protocol://server/request-URI"
- This request string is all the server ever sees. So the server doesn't care if the request came from a browser, a link checker, a validator, a search engine robot or if you typed it in manually. It just performs the request and returns the result.
-  to the browser, the server works as a black box. Ie: the browser requests a specific document and the document is either returned or an error message is returned.
  - This means that the server can read it from a file, run a program that generates it, compile it by parsing some kind of command file or (very unlikely, but in principle possible) have it dictated by the server administrator via speech recognition software. This gives the server administrator great freedom to experiment with different kinds of services as the users don't care (or even know) how pages are produced.
- can use [telnet](http://en.wikipedia.org/wiki/Telnet) to write HTTP requests directly to web servers.
- Status Codes
  - 1xx: Informational
  - 2xx: Successful
  - 3xx: Redirection
  - 4xx: Client Error
  - 5xx: Server Error
- Proxy cache
  - Browsers still have their local caches, but HTTP requests for documents not in the browser cache rather than being sent to the server are to the proxy cache. If the proxy has the document in its cache it will just return the document (like the browser cache would), and if it doesn't it will submit the request on behalf of the browser, store the result and relay it to the browser.
- CGI (Common Gateway Interface) is a way for web servers and server-side programs to interact.
  - CGI is completely independent of programming language, operating system and web server. Currently it is the most common server-side programming technique and it's also supported by almost every web server in existence. Moreover, all servers implement it in (nearly) the same way, so that you can make a CGI script for one server and then distribute it to be run on any web server.
  - A web server that supports CGI can be configured to interpret a URL that it serves as a reference to a CGI script. A common convention is to have a cgi-bin/ directory at the base of the directory tree and treat all executable files within it as CGI scripts.
- can submit a form with a GET request and a query string rather than just POST request
  - If the data can be long (more than 256 characters) it is a bit risky to use GET as the URL can end up being snipped in transit. 


- [Symbol video](http://www.youtube.com/watch?v=mBXGBbEbXZY) with Peter Cooper
  - "If the textual context is important, use a string."
  - "If the identity of the object is important use a symbol." - Jim Weirich
```ruby
"gender".intern #=> :gender
%s{gender} #=> :gender

words.map(&:upcase) #=> symbol to proc
```

- way to [call a gem in your gemfile](http://gembundler.com/gemfile.html)

###Guides Reading:###
- [Basic HTTP authenticationn](http://guides.rubyonrails.org/action_controller_overview.html#http-authentications)
- [testing routes](http://guides.rubyonrails.org/routing.html#inspecting-and-testing-routes)
