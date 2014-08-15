---
layout: post
title: "Testing With Logan"
date: 2014-07-25 12:37
comments: true
categories: rspec
---

###Receive Message Chain
  - In lieu of the depreciated `stub_chain` there is now [`receive_message_chain`](https://github.com/rspec/rspec-mocks/pull/467).

```ruby receive_message_chain
allow(obj).to receive_message_chain(:foo, :bar).and_return(double)
expect(obj.foo.bar).to receive(:bazz).with(/adfads/)
```
### Yielding multiple variables
  - `allow(fake_container).to receive(:attach).and_yield("stdout", "some message\n")`

### `expect_any_instance_of`
  - expect_any_instance_of(Object).to receive(:subscribe) [isn't very well documented](http://stackoverflow.com/a/17577942/1496757), but [it's in there](http://rubydoc.info/gems/rspec-mocks/RSpec/Mocks/ExampleMethods:expect_any_instance_of).

### Testing Sidekiq
  - [Mike Perham](https://github.com/mperham) did a nice job documenting the [testing options for workers](https://github.com/mperham/sidekiq/wiki/Testing).
### Detecting pending migrations
  - A neat little trick to see if there are pending migrations `rake db:migrate:status`. This must have been built into rails because I see a message every time I haven't run a migration and I am running my test suite. It's cool nonetheless. [Source](http://stackoverflow.com/questions/1349047/show-pending-migrations-in-rails)
