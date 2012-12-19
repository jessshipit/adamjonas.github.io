---
layout: post
title: "cache layer"
date: 2012-12-18 17:02
comments: true
categories: caching
---

I was asked today to diagram the cache layer in Gitbo and stammered my way through an answer that was at-best vague and at-worst inaccurate. Our cache layer lives between the Github API and our Octokit Wrapper. We pull in the data on an authenticated user from the API and serialize the data in the user model (which allows us to access the data in multiple views). In a future refactor, we should probably be doing this in the wrapper model or even a memcache manager model.

Given the fact that I didn't fully grasp the cache system that I had a heavy hand in designing, I did a little more research on the subject... The cache storage system in Rails is very modular. It uses the file system to store the cache by default, but can be customized as we did. We used [Dalli](https://github.com/mperham/dalli) instead of `mem_cache_store` because it has support for memcached's binary protocol. (I believe Dalli will be the default in Rails 4.)

###Methods
From the [documentation](http://guides.rubyonrails.org/caching_with_rails.html#activesupport-cache-store), the main methods to call are `read`, `write`, `delete`, `exist?`, and `fetch`. The `fetch` method accepts a block and will either return an existing value from the cache or write the result to the cache if none exists.

###Page Caching:
This allows the request for a page to be served by the webserver (nginx in our case), without ever having to hit the Rails stack. Obviously, this is highly performant, but cannot be used across all situations (e.g. where authentication is required or any actions that have before filters). 

###Action Caching:
This is similar to page caching except the incoming web request hits the Rails stack to allow the before-filters to run before the cache is served. This is the best option for when authentication and other restrictions need to be run while still serving the result of the output from a cached copy.

###Fragment Caching:
This allows a fragment of view logic to be wrapped in a cache block and served out of the cache store when the next request comes in. We tried running this for our indexed table views, but we need to work on bettering our server-side processing before this can be fully implemented.

###SQL Caching:
This caches the results returned by each query so that if Rails encounters the same query again for that request, it will use the cached result rather than running the query against the database again.

###Need to the look into...
In the future, I'd like to look how we might be better able to use `Rack::Cache` to better take advantage of HTTP caching regarding freshness (expires, cache-control) and/or validation (last-modified, ETags).

###Further Reading:
- [Memcache Wiki](http://code.google.com/p/memcached/wiki/TutorialCachingStory)
- [Rails Guide on Caching](http://guides.rubyonrails.org/caching_with_rails.html)
- [Rack cache](https://github.com/rtomayko/rack-cache)
- [Memcached basics for Rails](http://nubyonrails.com/articles/memcached-basics-for-rails)