---
layout: post
title: "pow config"
date: 2014-02-19 16:01
comments: true
categories: pow ngrok
---

I had a bunch of issues getting pow up and running after I upgraded to Mavricks. I ended up not installing via the `curl` method that the [37signals suggests](http://pow.cx/) as it wasn't recognizing my rbenv and was running on my system ruby. So I uninstalled and tried it with `homebrew`, which required a different path in my `.powconfig` file. Just like the [troubleshooter](https://github.com/basecamp/pow/wiki/Troubleshooting#rbenv) said it would via the [github issue](https://github.com/basecamp/pow/issues/202#issuecomment-2640707), this worked.

Final code: `export PATH="/usr/local/opt/rbenv/shims:/usr/local/opt/rbenv/bin:$PATH"`

Boom! Smack! Pow!

## UPDATE (Summer '14):
The new hotness is [ngrok](https://ngrok.com/). An easier way to expose a local web server to the internet. It's the jam.

  - Works with `ngrok localhost:3000` for a rails app for example.
  - Then open it up on the provided url and you've got yourself a stew.
