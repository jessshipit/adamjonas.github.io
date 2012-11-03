---
layout: post
title: "FIS Day17andahalf"
date: 2012-10-31 18:40
comments: true
categories: FIS
---

###[Geocoder](http://www.rubygeocoder.com/)###
This gem is amazing. I can calucalate the latitude and longitude of anywhere by an address and so much more. Not surprisingly there is a great [railscast](http://railscasts.com/episodes/273-geocoder) on the subject.

- Ryan Bates also suggested that I look at [Google-Maps-for-Rails](https://github.com/apneadiving/Google-Maps-for-Rails)

###Authentication###
I had broken the authentication system in my [gearshare app](http://gearshare.herokuapp.com/). [Ryan Bates](http://railscasts.com/episodes/241-simple-omniauth) to the rescue once again.

###Sessions Issues###
I was having some trouble killing the session. Avi added this code in the sessions_controller.

```ruby In the sessions controller
def destroy
  session[:user_id] = nil
  reset_session #this was the key....
  redirect_to root_url, :notice => "Signed out!"
end
```

###Git Rebase###
I also rebased a branch using the following command...
```
$ git rebase master
```
This rebased the up-to-date master underneath my branch that was ahead by a few commits, but had a broken authentication system. There is a complete explanation of this and more in the [git book](http://git-scm.com/book/en/Git-Branching-Rebasing).

###Stripe###
Met Richard who walked me through the [stripe](https://stripe.com/) that makes payments silly easy. Very exciting to integrate this into the bounty open-source idea...

###Podcast###
I should start listening to this... Peter Cooper and Jason Seifer-- it's got to be pretty solid.