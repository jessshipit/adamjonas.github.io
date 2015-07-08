---
layout: post
title: "how the web works"
date: 2015-07-08 12:20
comments: true
categories: web nfs apache ssl
---

##learn co
  -> get IP address for server
  -> assemble http request, sends an ack
  -> open a tcp connection on 80 (or 443 for SSL)
  -> tcp port established between user and host (over 1024)
  -> ssl negotiation, user provides public key and the host provides its public key we validate based on a cert provider and then we are provided a symetric key that we use with that site going forward
  -> nat - network address translation
  -> GET HTTP request

##On the server -> 
  - HA proxy (ssl negotiation, load balancing) (we could replace this with nginx)
  - apache (speaks http, this is the web server)
  - phusion passenger (the workers that enable concurrancy)
  - hit the routes file

##LB01
  - ubuntu 14.04 (LTS)
  - HA proxyd (port 443 -d SSL only)
  - sshd (port 22) -> run commands remotely (ssl encrypted)

##IB03
  - apache, spawns passenger pushion
  - passenger spawns 5 wokers
    - takes the request and turns it into a rack ruby object

##NFS - Network file system
