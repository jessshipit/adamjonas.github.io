---
layout: post
title: "calendar app 1"
date: 2013-03-26 10:17
comments: true
categories: 
---

###Setup
  - added a EventTimeValidator to lib. this needed to be updated in the app config file as well so that the autoload path would pick up the changes in the lib dir.

```ruby rspec tests on valdidations
expect(event).to_not be_valid
expect(event.errors[:end_date]).to eq ["must be after start date"]
```

###Git global config github
  - needed to link email from my new macbook
    - [used this as a guide](https://help.github.com/articles/setting-your-email-in-git)

###Uploads
  - we used carrierwave
    - remember to set multipart to true

###Extend self
  - from [stackoverflow](http://stackoverflow.com/a/11607912/1496757)

```ruby
module A
  class << self
    include A

    def x
      puts 'x'
    end
  end

  def y
    puts 'y'
  end
end

A.x #=> 'x'
A.y #=> 'y'
```
  - [classic post](http://ozmm.org/posts/singin_singletons.html)

###Method Stubs
  - A method stub is an implementation that returns a pre-determined value. Method stubs can be declared on test doubles or real objects using the same syntax.

```ruby E.G.
book.stub(:title) { "The RSpec Book" }
book.stub(:title => "The RSpec Book")
book.stub(:title).and_return("The RSpec Book")
```

###any_instance
  - stub on any instance of a class
    - Use `any_instance.stub` on a class to tell any instance of that class to return a value (or values) in response to a given message. If no instance receives the message, nothing happens.
   
```ruby
describe "any_instance.stub" do
  it "returns the specified value on any instance of the class" do
    Object.any_instance.stub(:foo).and_return(:return_value)

    o = Object.new
    o.foo.should eq(:return_value)
  end
end
```

  - [from](https://www.relishapp.com/rspec/rspec-mocks/v/2-6/docs/method-stubs/stub-on-any-instance-of-a-)

###Alias Attribute
  - `alias_attribute :value, :url`

###Chop v. Chomp
  - subtle difference between `chop` and `chomp`

```ruby
#chop
"string\r\n".chop   #=> "string"
"string\n\r".chop   #=> "string\n"
"string\n".chop     #=> "string"
"string".chop       #=> "strin"
"x".chop.chop       #=> ""

#chomp
"hello".chomp            #=> "hello"
"hello\n".chomp          #=> "hello"
"hello\r".chomp          #=> "hello"
"hello \n there".chomp   #=> "hello \n there"
"hello".chomp("llo")     #=> "he"
```
  - [see](http://ruby-doc.org/core-2.0/String.html#method-i-chop)


###Setting develop as the default
  - `git branch --track develop origin/develop`

###Formtastic
  - collection groups together elements for a select box
    - include blank false

###Deploying
  - need to add new deploy instructions to .git/config file

###Nano
  - basic text editor that appears to be pre-loaded...

###Offsetting an image and a link
  - use padding to offset an image from its link
    - I use this a lot when putting an icon in front of a link
    - see [here](http://shapeshed.com/using_background_images_with_links/) for more

###Deploying to heroku
  - `git push staging develop:master`

###Each with index
```ruby E.G.
@something.each_with_index do |thing,index|
  puts index
end
```

###S3
  - used [fog](https://github.com/fog/fog) to store the carrierwave uploaded images on AWS
  - needed to config heroku with the `heroku config:add ENV_VARIABLE=bucket-name -r staging` to make it work
  - in carrierwave.rb need to specify the `config.fog_host`, but this is NOT the right method. It is supposed to be `config.asset_host`
    - implemented via [this commit](https://github.com/carrot/rolex-world-of-rolex/commit/b58dbf36c38a3932c51eeab1700ac09171cae338)
    - and [corrected by](http://stackoverflow.com/questions/13041498/undefined-method-fog-host)
      - also push the config variable via `heroku config:add CLOUDFRONT='<cloudfront URL>' -r staging`
    - [this post was helpful](http://stackoverflow.com/questions/10777712/carrierwave-s3-how-to-specify)

###xip.io
  - Construct your xip.io domain by appending your application's name to your LAN IP address followed by .xip.io. For example, if your development computer's LAN IP address is 10.0.1.43, you can visit myapp.dev from another computer on your local network using the URL http://myapp.10.0.1.43.xip.io/. [via](http://pow.cx/manual.html#section_2.1.5)

###Sweepers and caching actions
  - `caches_action :index` is all that is needed to cache an action [via](http://api.rubyonrails.org/classes/ActionController/Caching/Actions.html)
  - `cache_sweeper :event_sweeper` is added to the Events controller to trigger the sweeper...
  - Cache sweeping is a mechanism which allows you to get around having a ton of expire_{page,action,fragment} calls in your code. It does this by moving all the work required to expire cached content into an ActionController::Caching::Sweeper subclass. This class is an observer and looks for changes to an object via callbacks, and when a change occurs it expires the caches associated with that object in an around or after filter.
  - [Rails Guide](http://guides.rubyonrails.org/caching_with_rails.html#sweepers)
  - also need to turn on `config.cache_store = :dalli_store, ENV['MEMCACHE_SERVERS']`

  - In the context of ActiveAdmin
    - We weren't expiring the events index page, but were rather expiring the ActiveAdmin page instead. [This solved the problem](http://stackoverflow.com/questions/11600087/how-do-i-expire-home-page-cache-when-an-article-is-updated), but more specifically specifying the controller.
      - see [here](https://github.com/carrot/rolex-world-of-rolex/commit/1a217f8b2f8e1ba49a79c2b07dab4347c30604b0)