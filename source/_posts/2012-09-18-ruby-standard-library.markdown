---
layout: post
title: "Ruby Standard Library"
date: 2012-09-18 13:59
comments: true
categories: ruby
---

###[FileUtils](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/fileutils/rdoc/FileUtils.html)###

The functions mostly involved changing dir, moving, removing, and copying files.

Going to give us different options for working with dir entries and files in the file system.

easy to work with in IRB

###Methods###
.cmp will tell you if two files have the same content
.touch creates a file if it doesn't exist
.cp copy contents to another file


###[Logger:](http://www.ruby-doc.org/stdlib-1.9.3/libdoc/logger/rdoc/Logger.html)###

###URIs###
URI stands for "Uniform Resource Identifier." The URI module can be used to parse and manipulate URIs in your Ruby programs.

```
> require 'uri'
 => true 
> require 'open-uri'
 => true 
> url = URI.parse('http://teamtreehouse.com/')
 => #<URI::HTTP:0x007f9b728dfda0 URL:http://teamtreehouse.com/> 
> puts url.inspect
#<URI::HTTP:0x007f9b728dfda0 URL:http://teamtreehouse.com/>
 => nil 
> puts url.hostanme
NoMethodError: undefined method `hostanme' for #<URI::HTTP:0x007f9b728dfda0 URL:http://teamtreehouse.com/>
	from (irb):10
	from /Users/Ajonas/.rvm/rubies/ruby-1.9.3-p194/bin/irb:16:in `<main>'
> puts url.hostname
teamtreehouse.com
 => nil 
> puts url.path
/
 => nil
> puts URI.split('http://teamtreehouse.com').inspect
["http", nil, "teamtreehouse.com", nil, nil, "", nil, nil, nil]
 => nil 
> google = open('http://google.com').read
=> this outputs the html of the google homepage...
```

###Benchmark Module###
Provides methods to report the time used that the program takes to execute...

```ruby Benchmarking symbols vs strings
require 'benchmark'

repetitions = 1000000

Benchmark.bm(7) do |x|
	x.report "String" do
		repetitions.times do
			options = { 'hello' => 'world' }
		end
	end

	x.report 'Symbol' do
		repetitions.times do
			options = { hello: :world }
		end
	end
end
```

###OptParse Library###
```ruby
require 'ostruct'
require 'optparse'
require 'open-uri'

class MyParser	

	def self.parse(args)
		options = OpenStruct.new
		opts = OptionParser.new do |opts|
			opts.banner = "Usage: url"

			opts.on('-u', '--url URL', 'Fetches the given url') do |url|
				options.url = url
			end
		end

		begin
			opts.parse!(args)
		rescue Exception => e
			puts "Exceptions encountered: #{e}"
			puts opts
			exit 1
		end

		options
	end
end

options = MyParser.parse(ARGV)

if options.url
	puts open(options.url).read
end
```

###Observable Library###
The Observable module allows you to easily implement the observer pattern in your classes. The observer pattern specifies that an object maintains a list of its dependents, called observers, and notifies them automatically of any state changes.

You could put this behavior in the classes themselves, but by putting them in an observer class it keeps the classes clean.