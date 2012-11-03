---
layout: post
title: "Foolin with the Facebook API"
date: 2012-10-30 17:08
comments: true
categories: 
---

Most of what I needed was [here](https://github.com/arsduo/koala/wiki/Graph-API). Facebook does a good job with the documentation overall. The missing piece of the puzzle is how to execute the FQL...

```
@graph = Koala::Facebook::API.new

@graph.get_connections("me", "mutualfriends/#{friendsuid}")
#=> yields all our mutual friends

#can also retrieve many objects at one time...
@graph.get_objects([1007413,929972])
```

I'm not quite sure how to best run the facebook query language(FQL)
```
SELECT name,description,geometry,latitude,longitude,checkin_count,display_subtext FROM place WHERE page_id=110506962309835
```
Above would give me a hash of all the attributes of Palo Alto, CA. Getting [place info via FQL](http://developers.facebook.com/docs/reference/fql/place/) seems rather straight forward. Again, it's the integration that I am struggling with.

Gathering a hash of friends' location wasn't a killer, though it did take some trial and error...
```
friends_location = get_connections("me", "friends", :fields => "name, id, location")
```


So I can do much of this using a query string, but I'm not sure how that is quite done with an app. I need some help with this... 