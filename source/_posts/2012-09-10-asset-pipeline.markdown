---
layout: post
title: "Asset Pipeline"
date: 2012-09-10 14:31
comments: true
categories: Rails
---

Manifest - tells the app what to include

in an app, it tells the app what .js and .css files to include

The slowest thing about any connection is the opening
The browser limits a domain to 4 paralell connections at a time.

flash of unstyled content (fouc)
Asset hosting. distribute your assets to multiple

CDN- 
we don't connect directly to a server. We make hops.

DHCP- distribute IDs to all the computers on the local network

everything is a proc and lambda in js. they are all anonymous functions.

Speed:
perceived speed.

The bulk is what is slow is in the front end.

In production we will have just one file of assets.

sprockets-- opens the assets in the application.js file. 
<https://github.com/sstephenson/sprockets/blob/master/lib/sprockets/directive_processor.rb>
require_tree- 

once somethign is required once, spockets will recognize it and not require it again. The order implicitly is in alphabetical order. If this is done *explicitly* then you are in control.

your app takes precedence over the vendor path


One style sheet and one js and you let rails handle the rest


Gemify a js file
takes the current assets file 
go into the manifest file and add the jquery token or add it itself.

Gem
has it's own asset pipeline and add it's own asset pipeline
