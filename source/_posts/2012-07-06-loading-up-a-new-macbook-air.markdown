---
layout: post
title: "Loading up a new Macbook Air"
date: 2012-06-19 10:45
comments: true
categories: mac, notes
---

Avi helped me get my new Macbook Air rolling this afternoon...

Ruby 1.8.7 is the standard version that's loaded on the OS X Lion

Some lessons-- Xcode did not come loaded with the GNU Compiler Collection out of the box (AKA out of app store). (-bash: gcc: command not found) See: https://github.com/kennethreitz/osx-gcc-installer/

Anyways this had to be loaded to run anything like Homebrew.

- All OSs except for window are a NIX: A Unix-like (sometimes referred to as UN*X or *nix) operating system is one that behaves in a manner similar to a Unix system, while not necessarily conforming to or being certified to any version of the Single UNIX Specification. (http://en.wikipedia.org/wiki/Unix-like)

Once it was installed we got the result: i686-apple-darwin11-llvm-gcc-4.2: no input files from the gcc command. (read more about gcc here: http://gcc.gnu.org/)

Homebrew was installed from: https://github.com/mxcl/homebrew/wiki/installation

-Homebrew replaced the old style of loading software which required configuring the config file since all OSs are customized with different versions. This is frustrating as hell. Jewelry box, RVM, and homebrew are powerful enough to take the grunt work out of the environment set-up, but can't the community find a way to wrap this in an app in the app store? Is this feasible?

Jewelry Box was installed from http://jewelrybox.unfiniti.com/

wget was installed from: http://ftp.gnu.org/gnu/wget/

Alfred was installed from: http://www.alfredapp.com/

We also modfiied the bash profile or dot files from Avi's github repository.

- He mentioned that in the future I should choose a user name with all lower case letters rather than the capitalized name that I chose.

- I also needed to create a symbolic link for my sublime text editor so that I can call it from the command line (this is something I never figured out on my Fedora 15 system)

So for those keeping track at home:

    GCC
    Homebrew
    Jewelry box
    RVM
    Ruby Update
    Rails

No MySQL or anything like that... until I need it.

This is a good post on what to load up:

http://tech.xtremelabs.com/how-to-setup-your-mac-for-rails-development/