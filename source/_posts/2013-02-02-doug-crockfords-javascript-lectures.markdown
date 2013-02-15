---
layout: post
title: "Doug Crockfords Javascript Lectures"
date: 2013-02-02 19:38
comments: true
categories: javascript
---

Thomas Edison was the first person to reference a bug. Grace Hopper actually found a moth in her machine.

The prototype model is poorly named but you can build enormously complext object-oriented systems. You don't need classes.

Javascript inherited aspects of java, scheme, and self. The bad parts of js were mostly a function of being built in haste-- it was created by netscape in 10 days.

  - Object have prototype properties:
    - `Object.getPrototype(object)` copies the object, something they did have befor
    - `Object.create(object, properties)` -> creates a new object

    - Crockford doesn't use Object.new rather he thinks prototypally, so he uses `Object.create`
    - `Object.create(null)` can take null as a parameter so you get a pristine object
    - the enumerator is exposed so you can set it as true or false.
    - keys must be strings
    - can find if an object is extensible and you can set it to not extensible with `Object.preventExtensible`, `Object.seal` and `Object.freeze` -> immuatble objects


    - There is only one number type in JS. Memory is no longer a problem. So why create smaller types of numbers? In JS they didn't. Prevents a whole class of errors.
    - Associateive law does not hold. (41 min)
      - decimal fractions are approximate ->  So if A, B, and C are 0.1 + 0.2. + 0.3, they do not associate. This is a real problem because the world works on the decimal system. Especially money.
        - to solve, turn them into integers. e.g. with money, work in cents.
    - All numbers inherit from the `number.prototype`.
    - numbers are first class objects-> a number can be stored as a var, can be passed in a param, can be returned as a function, can be stored as an object (java cannot do this)
    - Math function should be part of number, but they aren't
    - Nan, not a number, but it is a number. You don't get back an exception with bad math, you get a bad value.
      - NaN is not equal to NaN, but NaN === NaN is true. This is appaling.

    - Boolean

    - **Strings** -> no one knows why they are called strings.
      - JavaScript tolerates the surrogate characters but has no knowledge of them, so if you have a string containing one surrogate character, JavaScript thinks it is a string with two characters in it. The counts will be wrong and you've got to be really careful when you do your substring operations because you donít want to split those things.
      - strings are frozen.
      - similar strings are equal (===)
      - no type char, an individual character is just a short string
      - string literals can use single or double quotes with \ escapements
      - can convert a number to string with `str = num.toString();` or `str = String(num);` except the first will throw an exception for null or undefined
      - convert a string to num with `num = Number(str)` or `num = +str`
      - parseInt(str, 10), converts the value into a number. It stops at the first non-digit character.
        - `parseInt("12em") === 12`
        - The radix(10) should always be used
          - `parseInt("08") === 0`
          - `parseInt("08", 10) === 8`
        - (56 min) string
