---
layout: post
title: "Context and functions in Javascript"
date: 2013-11-19 17:55
comments: true
categories: javascript OOP context
---


Bind and fat arrow result in something similar but with different implementations.

    fn = -> console.log @
    ctx = {foo: 'bar', fn: -> console.log(@)}
    pusher.execute('event_name', ctx.fn.bind(ctx))

In most cases, the context of the function (also known as `@`) is based on the receiver. In this contrived example, to execute the function on the pusher object, we might pass in the function name and then the callback function. When we call a function to an outside source, we have no idea in what context it might be executed. In our case, `ctx.fn` and `@fn` might be the exact same -- these are just references to how to call the function, but an important takeaway is that these do not pass determine the context. To ensure the context, one must specify it with the bind function. `pusher.execute('event_name', ctx.fn.bind(ctx))` is essentially equal to `pusher.execute('event_name', @fn.bind(ctx))`. The receiver in this case doesn't matter.

JS OOP isn't a joy ride. Oh well.

