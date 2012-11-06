---
layout: post
title: "Test Driven Development"
date: 2012-10-24 13:26
comments: true
categories: TDD rspec testing
---

??browser testing? this falls under acceptance tests?

*Difference between mock, stub, and fixture?* They are all a mechanisms to decouple data from the database. If your DB is down, you couldn't run your test suite. 

*Fixtures and factories* sort of relate to each other so that you don't have to instantiate a bunch of objects. *Fixtures-* are stable data to be used in the test environment. Fixtures are written in YAML.

*mocks and stubs*: connect to the FB api, but you don't need to, so you create something that responses with canned data like it is the facebook api.
[See mocks aren't stubs by Martin Fowler](http://martinfowler.com/articles/mocksArentStubs.html)

why does a spec folder hold the tests? This outlines the specifications? 
  - A specification is an explicit set of requirements to be satisfied by a material, product, or service.

??ping ponging - if someone writes a test and the other passes it are you switching off every 5 minutes

["How I test" with Ryan Bates](http://railscasts.com/episodes/275-how-i-test)

only open the browser when you need to focus on UI. Otherwise use tests.

- [capybara](https://github.com/jnicklas/capybara) to simulate the user
factory-girl instead of fixtures -> where you store your factories
- guard

- integeration_test

```ruby Capybara DSL Methods
visit login_path
    click_link "password"
    fill_in "Email", :with => user.email
    click_button "Reset Password"
```

[Good article on the process of testing](http://www.skorks.com/2010/01/thoughts-on-tdd-a-case-study-with-ruby-and-rspec/)


##Steven Nunez##
@_StevenNunez
conway's game of life

Testing is: the act of isolating parts of your code with a known state to ensure it works as expected

Acceptance testing, integration and tests: cucumber, capybara, webrat

unit tests - take a class, take tests and make objects

###Why test?###
- want to know when things break
- allows for courageous refactoring
- gives documentation on how your code is SUPPOSED to work. Learn to expect tests.
- It is your duty to deliver working code. Verification.

###Testing sounds like an extra step...###
- Forces you to think small
- Less thoughts to juggle
- Leads to modular code
- write less code
- increase documentation: see what the intention was
- small victories: always chasing green

###RSpec###
- RSpec provides something called subject
    - subject = Class.new

###Write the code you wish you had###
- test with none, test with 1, test with some
- can write a pending test by just writing it blocks

BDD is more route => controller => model
TDD is more model => controller => route

practical object oriented design by [sandi metz](http://www.poodr.info)