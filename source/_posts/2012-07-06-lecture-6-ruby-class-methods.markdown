---
layout: post
title: "Lecture 6 Ruby- Class Methods"
date: 2012-06-25 10:48
comments: true
categories: ruby lecture notes
---

Strategy...

-->look for nouns to start
url- unified resource locator
map and collect --> returns the results of the operation--> so it uts it into a new array

select when you are trying to match something, cannot collect things conditionally
(#) => library.songs.select{|s| s.name ==song_name}

is_a? --> is this an array, this is a validator

***HOW TO BUILD CLASS METHODS***
methods that don't apply to the instance of the class but the class itself
you can tell if it's a class method if self is the receiver

``` ruby
class Artist
puts self

def self.top_5
end

end

def self.top_5
  self.all.sort_by{|a| a.rank}
end
end

#Another way...

class Artist
@@all = []
attr_accessor :name, :songs, :artists

def initialize
  @@all << self
  @songs = []
  @artists = []
end
#important pattern of observing intialization and making classes intelligent

def songs
  artists.collect{|artist| artist.song}
end

def self.all
  @@all #return all the artists ever created
end
```

3:30 PM
***MODULES*** - for creating all sort of shared behavior
- modules don't have instances--> the difference between modules and classes

two keywords to include behavior--> include and extend
diff between include and extend --> trying to describe the scope of the module behavior

extending- makes it a class methods
include --> methods in that module are instance methods
?? how does require fit into this??

3:38
?? order of attr_accessor and @@all? does it matter?

***INHERITANCE*** -- a pattern that we don't like as much as modules
we'd rather think of things in the builder pattern using include and extend

2nd HALF

***File Systems:***
Dir documentation (4:10)
foreach and Dir.entries

***ERB templates*** (4:23):
we care about the result method for templating

***PRIVATE AND PUBLIC METHODS*** (4:41)
->a private method cannot be called with an explicit receiever, only implicit receivers-- means they can only be called in the class


***GEMS:***
-a pre-built package or functionality
[See the Ruby Toolbox](http://ruby-toolbox.com)

***SINATRA*** (4:44):
-based on rack (the first )
RACK - create a class that responds to a method called 'call'
- the response must return 3 three things- a status code, the header, the body of the response
```
ruby -rubygems sinatra.rb
```
***SCRAPERS:***
nokogiri gem will
xpath-- path to an element or you can use an CSS adjustment
nokogiri comes with a method called content
rails cast on nokogiri: http://railscasts.com/episodes/190-screen-scraping-with-nokogiri/

httparty-
[some reading on httparty](http://railstips.org/blog/archives/2008/07/29/it-s-an-httparty-and-everyone-is-invited/)
[there is more reading here](http://www.ioncannon.net/programming/91/using-ruby-and-httparty-to-consume-web-services-the-easy-way/)

open data:
[freebase](freebase.com)