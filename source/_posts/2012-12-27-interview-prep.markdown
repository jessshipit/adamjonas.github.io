---
layout: post
title: "Interview Prep"
date: 2012-12-27 21:05
comments: true
categories: TODO
---

from <https://github.com/afeld/rails_interview_questions>

###Q: What is the difference between a lambda, a block and a proc?
A:  In Ruby we create an anonymous chunk of code called a proc with the code `Proc.new`. We call this using the `.call` method. 

Lambdas appear to be the same as procs, but lambdas are pickier about arguments. You can't pass an extra arg to a lambda (it will blow up), while the proc will just throw away the extras.

Lambda return statement just exit execution of the statement itself while the proc ended execution of containing method.

As a rule, stick with lambdas until you find a specific reason not to.

It is often convenient to write methods that accepts a single proc as arguments. Callers can pass in whatever code they want to be executed once for each name for example. It is so common to write a method that has a single argument that is expected to be a proc that it got it's own name -- a block. Every ruby method can implicitly receive a proc arg with the yield keyword.

###Q: How do you sort an Array of objects by a particular attribute? What is a better way to do sorting with ActiveRecord?
A: Let SQL do its job. It will be more efficient than writing it in Ruby.

```ruby For example...
User.all.sort_by{|u| u.first_name} #=> O(log n)
#versus
User.order(“first_name DESC”) #=> O(1)
```

###Q: What are some of your favorite gems? What are their alternatives?
  - Dalli over the standard Memcached library- Higher performance memcached client
  - paperclip and carrierwave.

###Q: In Ruby, which is generally the better option: a recursive function or an iterative one?
A: Loops may achieve a performance gain for your computer. Recursion may achieve a performance gain for your programmer. Choose which is more important in your situation!

Comparing recursion to iteration is like comparing a phillips head screwdriver to a flat head screwdriver. For the most part you could remove any phillips head screw with a flat head, but it would just be easier if you used the screwdriver designed for that screw right?
Some algorithms just lend themselves to recursion because of the way they are designed (Fibonacci sequences, traversing a tree like structure, etc.). Recursion makes the algorithm more succinct and easier to understand (therefore shareable and reusable).[Pulled from](http://stackoverflow.com/questions/72209/recursion-or-iteration)

Recursion is, in general, the more natural approach in functional languages, and iteration is normally more intuitive in imperative languages.

###Q: What are #method_missing and #send? Why are they useful?
- [Method Missing](http://rubylearning.com/satishtalim/ruby_method_missing.html)

###Q: What is the general history of Rails? 
  - Rails open sourced in 2004
  -  2006 macs were shipped with rails
  - Dec 2008 merb was merged with rails 3.0
  - ‘11-> rails 3.1 had reversible db migrations, jquery, asset pipeline

###Q: Explain the different pieces of Rails.
  - ActiveRecord -> ORM
  - ActiveResource -> the main class for mapping RESTful resources as models in a Rails application.
  - ActionPack ->  the Controller and View layers are handled together by Action Pack.
  - ActiveSupport-> Active Support is a grab bag of utility methods and extensions to the Ruby standard library that accelerate development by providing syntactic sugar and easy ways to write expressive and DRY code
  - ActionMailer -> mailer

###Q: Walk through the flow of a request through Rails.
A: The primary components of a Rails app relating to general request cycle are ActionPack (ActionController, ActionDispatch, ActionView), ActiveModel and ActiveRecord. Let’s take the example of a contact management app where each instance of a contact has many addresses, phone number and emails, and we click on a link to a specific contact and are expecting to see a “show” view of some sort.

###Q: What are the different server options for running a Rails/Rack app?
- Apache vs. Nginx (webservers)
  - Apache is more popular, nginx is smaller and faster

**Mongrel vs Webrick**
mongrel is a ruby application server. Which means it:

1. Loads your rails app inside its own process space.
2. sets up a TCP socket, allowing it to communicate with the outside world.

**WEBrick does the same thing but:**

1. it’s written entirely in C
2. slower and less robust
3. installed in rails by default

**Phusion Passenger**

- Ruby app server, but works differently than mongrel
- integrates directly into apache or nginx.

- loads the ruby code and sends a request to my application

**Capistrano**

  - Allows you to upload the rails app’s code and files to the server machine
  - set up/ migrate DB
  - install libs that your app depends on
  - Capistrano is not the application server-- it is a tool for automating all the preparation work. Technically you could upload with FTP.

<http://stackoverflow.com/questions/4113299/ruby-on-rails-server-options>

###Q: Explain CSRF and how Rails combats it.
A: <http://www.adamjonas.com/blog/cross-site-request-forgery/>
<http://stackoverflow.com/questions/941594/understand-rails-authenticity-token>

protect from forgery in the application_controller to add authenticity token that is unique for each user session -> checked for all post/put/delete request.
This token is not checked for GET requests, so make sure you don’t do anything damaging with a GET request.

Rails 3 escapes all HTML content `<%=h task.name %>` to prevent cross-site scripting. Can also look into the sanitize methods.

###Q: Explain mass-assignment vulnerability.
A: <http://blog.mhartl.com/2008/09/21/mass-assignment-in-rails-applications/>
Mass assignment throws all the parameter from the form so the user can update any of the attributes or associations 


###Rails Security in general
- [Railscasts 178](http://railscasts.com/episodes/178-seven-security-tips)

SQL injection (railscasts episode 25)
```ruby Eliminating SQL injection
def index
  @projects = current_user.projects.all(:conditions => ["name like ?", "%#{params[:search]}%"])
end
``
Can just enter in `) or ('` and that will retrieve all the projects. Can just use the question mark syntax to avoid. 


###Q: Law of Demeter - 

Refers to loose coupling of objects 

Refers to sending messages, prohibits sending a message from object A to object C through object B, if object B is of a different type. 
States that objects should not reach through other objects to return information about a third object. Using dot notation examples, loosely means to reduce the number of dot methods strung together, so that you're not performing actions on some intermediary returned object or data. 

LoD violations are more tolerable if reaching through objects to return ‘attributes’, as opposed to invoking ‘behavior’ - ex. customer.bicycle.wheel.tire ← many dots, but is only returning what may be a stable attribute 

More about the ‘type’ of object returned by each expression in a method chain than by the amount of dots, don’t want to be traversing different types, as this is more tightly coupling your code

###Q: SOLID design

Coined by Michael Feathers, popularized by Uncle Bob Martin
5 of the most well known design principles 

Single Responsibility - separation of concerns, classes should have a single responsibility, methods should have a single responsibility, makes your code more modular and more adaptable

Open/Closed - Related to inheritance hierarchies. By using classical inheritance and modules, you're declaring that objects (classes) are ‘open’ for extension but ‘closed’ to modification. In this way, the developer is encouraged to ‘extend’ an objects behavior or capabilities through subclasses, and discouraged from modifying existing objects. Open for extension creates hierarchies that are well suited to change and growth in an application.

Liskov Substitution - Subclasses should be substitutable for the Superclasses. Subclasses are expected to conform to their superclasses interfaces (i.e. must respond to every message in that interface. Other objects should not have to check the type of a subclass. Subclasses need to be a ‘kind’ of their superclass.

Interface Segregation - separation between public and private interfaces. Public interfaces are for messages (methods) that will be sent to other objects. Private interfaces are for messages that will only ever be sent to self. Private interfaces are where a majority of the how, or the logic (manipulating data structures, etc.) should occur, while Public interfaces should just declare the ‘what’ (largely by calling private interface methods). This is because public interfaces are accessible by other objects, and by exposing too much of the how, you’re giving too much information to other objects, which results, or is a symptom of, tight coupling.

Dependency Inversion - Less Stable objects should depend on more stable objects, i.e. more concrete objects should depend on more abstract objects, making your code less brittle.

###Q: Ruby Closures - 

Blocks/Procs/Lambdas - essentially anonymous methods/functions. Procs and Lambdas are Blocks that can be passed around as variables. By defining the proc or lambda as such

```ruby
proc = Proc.new do |name| 
  puts “Hello #{name}”
end

can run proc.(“Matt”) -> “Hello Matt”
```

essentially acts as a method that can take parameters, but is an unnamed method that can be called by other methods as an argument

can use yield to send to the proc/block/lambda

```ruby
def named_method(&block)
  yield “Matt”
end
```

`named_method{|name| proc.(name)} -> “Hello Matt”`

procs and lambdas differ in how they deal with ‘return’ statements and arguments 

ORMs - ActiveRecord vs. DataMapper

###Pros and cons of Datamapper 
- don’t have to write migrations (this can be a pro or con)

Datamapper has ‘eager loading’ by default, while ActiveRecord, you need to stipulate using the ‘includes’ method. This basically can cut down the amount of database queries in a normalized database by an order of magnitude. Instead of first running a query on the parent table, then running the same numbers of queries on the association table to get associated data, it just collects foreign keys for all the associations and then loads all associated objects with one query. Pretty cool!

Datamapper - model driven, whereas ActiveRecord is Database driven. Meaning, once the needs of the application dictate that the database become fairly complex, it can be a pain point when using AR. 

###Recursion
  - [Bastards Book on recursion (still a draft at this time )](http://ruby.bastardsbook.com/chapters/recursion/)

  - There are two principles of recursion
    1. An end goal, or base case
    2. A process in which the task at hand is reduced towards that end goal

###Pointer-based algorithms 
 - [Pointers](http://en.wikipedia.org/wiki/Pointer_(computer_programming))

###P = NP?
  - Are there situations where brute-force search— that is, trying an exponential number of possibilities one-by-one, until we find a solution that satisfies all the stated constraints— is essentially the best algorithm possible? ([from p vs. np for dummies](http://www.scottaaronson.com/blog/?p=459))
  - [wikipedia](http://en.wikipedia.org/wiki/P_versus_NP_problem)
    - P vs NP is basically talking about problems where you can checking each possibility in a reasonable amount of time, but the number of possibility's keeps growing faster as the numbers get larger. 
    - some of these problems are such that there is no way to come up with an exact solution that is faster than being forced to do a brute force check of all or many of the possible solutions.
    - The essence of P vs. NP. P is the class of problems where the cost of computing an exact solution doesn't necessarily grow too fast relative to input sizes to be impractical with real-world computers. NP is the class of problems that are equivalent to P problems if you happen to have a magical computer which could evaluate and compare any number of possible solutions simultaneously. Naturally, NP will include all of the P problems, so NP-complete problems are taken to be the set of problem for which only the magical computer would be suitable. (from [Hacker news discussion](http://news.ycombinator.com/item?id=1605415))

###Practice
  - [Daily programmer](http://www.reddit.com/r/dailyprogrammer/)
  - [Ruby Quiz](http://rubyquiz.com/)
  - [5 essential phone screens](https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions)