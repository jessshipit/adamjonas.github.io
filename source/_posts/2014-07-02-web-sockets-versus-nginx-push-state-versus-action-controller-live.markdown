---
layout: post
title: "web sockets versus nginx push state versus action_controller::live"
date: 2014-07-02 17:52
comments: true
categories: sockets
---

## The Decision


## Nginx Push State
https://gist.github.com/loganhasson/c8bfff2767ea74187cf0

## Enter Heroku
Clearly keeping a threaded server open with the warning below is not ideal:

>Long-polling and streaming responses

Cedar supports HTTP 1.1 features such as long-polling and streaming responses. An application has an initial 30 second window to respond with a single byte back to the client. However, each byte transmitted thereafter (either received from the client or sent by your application) resets a rolling 55 second window. If no data is sent during the 55 second window, the connection will be terminated.

If you’re sending a streaming response, such as with server-sent events, you’ll need to detect when the client has hung up, and make sure your app server closes the connection promptly. If the server keeps the connection open for 55 seconds without sending any data, you’ll see a request timeout.

- There are some solutions out there:
  1. [Like](http://stackoverflow.com/questions/17285961/http-streaming-connection-sse-client-disconnect-not-detected-with-sinatra-thin)
  2. [Or](https://gist.github.com/Funfun/6867167)
