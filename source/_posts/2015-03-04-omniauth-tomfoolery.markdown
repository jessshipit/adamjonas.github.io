---
layout: post
title: "omniauth tomfoolery"
date: 2015-03-04 18:01
comments: true
categories: omniauth github
---

Problem: Want to redirect a user who has yet to sign up back to our site after joining Github. Github does not support a url other than login and if you were to click on sign up from there, you would lose the query string parameters.

Resources:
[Explicitly set strategy class](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview#cannot-load-strategy-class)

[Strategy Contribution Guide](https://github.com/intridea/omniauth/wiki/Strategy-Contribution-Guide#defining-the-request-phase)

[oauth strategy](https://github.com/intridea/omniauth-oauth/blob/43008e42b257d9b7c0b98122cf03ce14b021d782/lib/omniauth/strategies/oauth.rb)


I ended up getting the param through, but github noticed and closed the loop. Sad.
