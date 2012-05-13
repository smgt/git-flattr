```
       _ _      __ _       _   _        
  __ _(_) |_   / _| | __ _| |_| |_ _ __ 
 / _` | | __| | |_| |/ _` | __| __| '__|
| (_| | | |_  |  _| | (_| | |_| |_| |   
 \__, |_|\__| |_| |_|\__,_|\__|\__|_|   
 |___/                                  
```

# What is Flattr?

Flattr is a social microdonation service that makes it a breeze to donate to open source projects, music artists, podcaster and blogger. You can read more about it on [http://flattr.com](http://flattr.com).

# But why git and Flattr?

I play around with open source a great deal and most of the projects are available on github. So I made a command line tool where you can easily flattr the currently checked out repo.


# Install

`git flattr` is distributed as a Ruby Gem.

`gem install git-flattr`

This will make the command `git flattr` available. For futher help run `git flattr help`

# Usage

You can both flattr repositories and individual commits.

## Flattr a repository

When you are in a directory with a git GitHub repository you can easily flattr the repository.

`git flattr repo`

## Flattr a commit

When you are in a directory with a git GitHub repository you can easily flattr a commit. You need the commit sha1, to view history run `git log`. Then copy the sha1 of the commit you would like to flattr and run this command.

`git flattr commit [sha1]`

## Want to know more?

If you wan't to know more about the commands check out the help.

`git flattr`

# Copyright

Copyright (c) 2012 Simon Gate. See LICENSE for details.
