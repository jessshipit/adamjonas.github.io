---
layout: post
title: "Octopress"
date: 2012-07-05 10:54
comments: true
categories: octopress ruby setup
---

Follow directions here...

Setting Up Octopress

<http://octopress.org/docs/setup/>

Had one hiccup in my system didn't have Ruby 1.9.2 which .rvmrc file requires (https://rvm.io//workflow/rvmrc/). I had to go ahead and install it.

Deploying on Heroku:

To see on localhost:4000
rake preview 

**To push:**
```
rake generate
git add .
git commit -m 'site updated'
git push heroku master
```

[Octopress delpoy instructons](http://octopress.org/docs/deploying/heroku/)

That all went fairly well... though I didn't understand all the intermediate steps. I'll have to take closer look.

[Markdown language cheat sheet](http://support.mashery.com/docs/customizing_your_portal/Markdown_Cheat_Sheet/)


