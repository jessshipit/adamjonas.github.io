---
layout: post
title: "tcp, udp, http"
date: 2015-12-29 17:00
comments: true
categories: protocols
---

I really had no idea between TCP and UDP.

[This did a nice comparsion](http://www.diffen.com/difference/TCP_vs_UDP):
Transmission Control Protocol ensures a reliable and ordered delivery of a stream of bytes from user to server or vice versa. User Datagram Protocol is not dedicated to end to end connections and communication does not check readiness of receiver.

- HTTP uses TCP connection. But HTTP uses only one TCP connection.
- Use persistent plain TCP sockets if both client and server independently send packets but an occasional delay is OK (e.g. Online Poker, many MMOs).
- Use UDP if both client and server may independently send packets and occasional lag is not OK (e.g. Most multiplayer action games, some MMOs).

And [there is always this](https://www.reddit.com/r/ProgrammerHumor/comments/14wv9p/i_was_gonna_tell_you_guys_a_joke_about_udp/)
