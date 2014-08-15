---
layout: post
title: "Stubbing Out Faraday"
date: 2014-07-15 11:49
comments: true
categories: stubs farday webmock rspec
---

### Webmock to disable net connections
  - [Just toss it in the `spec_helper`](https://github.com/bblimke/webmock#real-requests-to-network-can-be-allowed-or-disabled)
    - ***Note*** that I had to use `WebMock.disable_net_connect!(:allow_localhost => true)` in the cucumber `support/env.rb` because my local host wasn't being allowed to run on the ci. [picked this up from issue #284 on webmocks](https://github.com/bblimke/webmock/issues/284)

### Rspec Mocks
  - Can use the [new syntax](https://github.com/rspec/rspec-mocks#method-stubs) or mocha.

### To stub it out I could either

```ruby These Both Work
before do
  allow(MyService).to receive(:new) { double }
end

before do
  allow_any_instance_of(MyService).to receive(:publish)
end
```

Really cool. The `allow_any_instance_of()` is pretty sweet to reference an unnamed instance of a class. Pretty sweet.
