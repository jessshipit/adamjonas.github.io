---
layout: post
title: "Anatomy of Web Requests"
date: 2012-11-05 12:58
comments: true
categories: FIS
---

###[John Britton](http://johndbritton.com/)

###Requests are like
  - driving a car
  - shipping containers

  - [OSI model](http://en.wikipedia.org/wiki/OSI_model)

  sounds a lot like mvc- in terms of abstraction

  HTTP: the language that your browser speaks
  - The webpage is a document

###URI:
  - Rendering
    - HTML structure
    - CSS style
    - JS behavior

    - ports are a concept
    - ftp 21 
    - ssl 53
    -  0-1024 -> are assigned
    - 1024-49151 -> are available
    - 49152+ 

    - if listening on 80- that means that route every request on port 80 to this program

  - [JS Fiddle](http://jsfiddle.net/)

  - HTTP: methods/verbs
    - GET - grab some stuff and bring it down
    - POST - anything you are altering the state of the app with is probably a post request
    - PUT
    - DELETE
    - others: HEAD, PATCH, TRACE, OPTIONS, CONNECT

  - curl- works just like a browser on the command line.

###Where do those requests go?
  - what is the ip address of the resource I am looking for
  - if nothing is cached anywhere
    - 13 root nameservers
    - TLD nameserver- authoritative for .coms for example
    - A record - I found the place to go for github, but I need the actual IP address
    - IP address

    - [BIND](http://en.wikipedia.org/wiki/BIND) is the most widely used DNS software on the Internet.
    - TTL- [time to live](http://en.wikipedia.org/wiki/Time_to_live)

    - Networks: nodes that can talk to each other directly
    - Interface
    - Network addresses:
      - defines all the address that can talk to each other
      - a.b.c.d/n (n= network mask /subnet)
      - Private (non routable) network
        - 10.0.0.0/8
        - 172.16.0.0/12 -> identifies which part is 
        - 192.168.0.0/16 -> private networks namespaced for private networks

        255.255.255.0 -> subnet mask -> 24 bits -> 
        192.168.1.N and n can't exceed 255 people.

        10101100.0001 -> this is the network address -> the first 16 bits, the rest would be the node of the network
        - you can have a lot more machines on an 8 bit network identifier, than a 16 bit. But you wouldn't want to waste a bunch of nodes that aren't going to be used.

    - Maximum number of address minus two
      - 192.168.1.255 -> broadcast address

    - Network Hardware
      - Hub - dumb -> connects everyone's ports to each other -> every machine's send is connected to everyone's receive -> lowest level
      - Switch - smarter -> knows what addresses are connected to what ports - lowers network traffic, sending something once and remembering who responds
      - Router - smartest -> connects [disparate](http://www.merriam-webster.com/dictionary/disparate) networks. Hub and switch talk to each other, for a router, we go through another point -> knows about disparate networks and IP addresses
    
    -Network Protocols
      - Operating system knows about the **transport**.
        - Something reliable it will write in **TCP**
          - It has to all get there or the file will be corrupt
          - there is a control mechanism. If the packets I'm not sending
        - **UDP** - don't want a reliable transport. 
          - I don't care if it all gets there. Deliver it in order.
          - You don't want a second of video that was sent out of order, you don't want to patch it together out of order. Streaming would use UDP.
      - Routing - my machine doesn't know about them.
        - [RIP](http://en.wikipedia.org/wiki/Routing_Information_Protocol) - 
        - [OSPF](http://en.wikipedia.org/wiki/Open_Shortest_Path_First) - Open Shortest Path First- a concept of links and weight of links. If you have two possible routes, it will go on 
    - Network Address Translation
      - maps traffic coming from an internal network and makes sure the appropriate machine gets the info it requested.

    - traceroute
```
traceroute github.com
whois adamjonas.com
ping google.com
curl google.com
```

- nmap
  brew install nmap
  nmap #map the network
  #could run this against port 22 which is all the ssh

- [wireshark](http://whatismyipaddress.com/)

- hazel- rules based apps
- cueing in rails
- [local tunnel](http://progrium.com/localtunnel/)

- blobs, tags, branches, commits
  - blob is just a file -> any data
  - git hash-object README

- tree
  - brew install tree

- Divy or breeze: window arranging