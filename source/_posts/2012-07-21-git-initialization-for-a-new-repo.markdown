---
layout: post
title: "Git initialization for a new repo"
date: 2012-07-21 18:17
comments: true
categories: git
---

I know this is basic. I keep getting the steps wrong though. So I'm putting it here...

```
  git init
  touch README
  git add README
  git commit -m 'first commit'
  git remote add origin https://github.com/ajonas04/REPO_NAME.git
  git push -u origin master
```

I also ran into this during the process today:
```
♕ git remote add origin https://github.com/ajonas04/REPO_NAME.git
fatal: remote origin already exists.
♕ git remote rm origin
♕ git remote add origin https://github.com/ajonas04/REPO_NAME.git
```

```
# git remote add <remote name> <link>
♕ git remote add group git@github.com:ajonas04/fis.com.git
```
I guess I needed to remove the remote origin. I can safely say, I don't understand what's going on here.

