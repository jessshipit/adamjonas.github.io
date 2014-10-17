---
layout: post
title: "Git advanced discussion"
date: 2012-10-08 17:19
comments: true
categories: git
---

###Remotes###
```
git remote -v, which shows you the URL that Git has stored for the shortname to be expanded to:

$ git remote -v
origin  git://github.com/schacon/ticgit.git

$ git remote add [shortname] [url]
$ git remote rm [shortname]
$ git remote rename [oldname] [new name]
```

###Fetch###
```
$ git fetch [remote-name]
```

- It’s important to note that the **fetch** command pulls the data to your local repository — it doesn’t automatically merge it with any of your work or modify what you’re currently working on. You have to merge it manually into your work when you’re ready.
- The *git pull* command to automatically fetch and then merge a remote branch into your current branch.

###Pushes###
```
git push [remote-name] [branch-name]
```

###Branches###
You can delete a remote branch using the rather obtuse syntax '$ git push [remotename] :[branch]'. If you want to delete your serverfix branch from the server, you run the following:
```
$ git push origin <:branch name>
```


```
$ git branch -d <branch name>
```

###Rebasing###
In Git, there are two main ways to integrate changes from one branch into another: the *merge* and the *rebase.*

```
$ git rebase master
```
It works by going to the common ancestor of the two branches (the one you’re on and the one you’re rebasing onto), getting the diff introduced by each commit of the branch you’re on, saving those diffs to temporary files, resetting the current branch to the same commit as the branch you are rebasing onto, and finally applying each change in turn.

**Important:**
Do not rebase commits that you have pushed to a public repository.


###Git real review###
```
$ git commi­t --ame­nd -m 'addi­ng new' #ammend to last commit
$ git reset­ --sof­t HEAD^­ #erase last commit and rewind to HEAD
$ git reset­ --sof­t HEAD^­^ #erase the last TWO commits
$ git push -u origi­n maste­r #-u to indicate this is the default push for the future
$ git branc­h -r #show all the branches on the remote
$ git push origi­n :weas­el #deletes the weasel branch on the remote

$ git remot­e show origi­n #Specify a ­remote to ­see specif­ic informa­tion about­ that remo­te. The gi­t remote c­ommand wil­l show you­ available­ remotes.
$ git remot­e prune­ origi­n #clean up local repo 	

$ git tag #list all tags
$ git tag -a v1.3.2 -m 'new versi­on' #create new tag
$ git push --tags
$ git check­out v1.3.1

$ git rebas­e maste­r 

$ git add -u #stages all new files AS WELL AS deletions

$ git diff maste­r eleph­ant 

$ git log -p #diff and log

$ git confi­g user.email "admi­n@example.­com"

$ git confi­g --glo­bal user.­name "blah­ blah"

$ git confi­g --glo­bal alias­.commit pushi­t 
```

### Amend fanciness
  - Checkout [Los
  Techie's](http://lostechies.com/derickbailey/2010/06/09/git-oops-i-forgot-to-add-those-new-files-before-committing/) suggestion on amending something without writing a message. I aliased this in my dotfiles which makes it extra fancy.

###Removing a file

    git rm file1.txt
    git commit -m "remove file1.txt"

To remove it from the repo AND keep in the local file system:

    git rm --cached file.txt

  - [stackoverflow](http://stackoverflow.com/questions/2047465/how-can-i-delete-a-file-from-git-repo)

###Branching
This will create a new branch based on an revision: `♕ git co -b new-branch-name old-branch-name`

###Questions###
What is a reasonable number of commits per branch?
How often do you commit?
Working on the same file... strategies?
fast forward vs no fast forward
