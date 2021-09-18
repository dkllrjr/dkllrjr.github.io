---
layout: default
title: Gitting Started
---

# Git

[Git](https://git-scm.com/) is a command line version control program that can be used for just about everything stored in files. Git is a very useful tool for any digital project and is especially relevant in software development. Having knowledge of how to use git is extremely beneficial for any centralized code base, as it allows for multiple people to work on the same project, make edits, and save them, all at the same time.

# Gitting Started

## Installation

First, install git onto your system. For Linux, that will be through your distro's package manager. Git should be an available package by default (git was made by same person who made the Linux kernel, Linus Torvalds, anyway!). For Windows, use [Git for Windows](https://git-scm.com/download/win). For MacOS, if you have Maverick or newer, you can run `git` in the terminal and it should install. For more detailed instructions, check the [official documentation.](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

## Local and Remote Repository

Git works by tracking changes in special directories called _repositories_. _Repositories_, or repos for short, contain the code that you are working on and want to track. Fundamentally, there are always at least two repos, the local repo and the remote repo. You make changes in the local repo and then push it to the remote repo. The remote repo is typically stored on a remote server, hence remote, but it doesn't have to be. To quickly demonstrate a "local" remote repo, make a directory called `foo.git`:

```bash
~$ mkdir foo.git
```

Change into it:

```bash
~$ cd foo.git
```

again create a bare git repo (the `--bare` flag is important here, as it creates a repo that isn't connected to another repo yet):

```bash
~/foo.git$ git init --bare
```

Here, `foo.git` is your "local" remote repo and is where you will push the changes you make in a local repo. Let's make the local one now. Move out of the `foo.git` directory, make a directory called `foo` and move into it:

```bash
~/foo.git$ cd ..
~$ mkdir foo
~$ cd foo
```

Now, initialize this directory as a git repo (not a bare one this time!):

```bash
~/foo$ git init
```

Add an empty README file (the `.md` extension means a markdown file, but in the past this was just a simple text file):

```bash
~/foo$ touch README.md
```

Add the file and it's contents (we didn't add anything in the file here but we would and will do the same thing when we do add things) to the tracked files index:

```bash
~/foo$ git add .
```

_Commit_ the changes (the creation of our new file):

```bash
~/foo$ git commit -m "initial commit"
```

__Note:__ every _commit_ must have a comment. Here, it's `"initial commit"`. This is important for yourself and others, so that you can easily determine the changes that were committed by the summary comment. Don't be lazy with this; the comments will save you when you need them. 

_Commits_ are, more or less, the "save file" feature of git. They save all the changes done to the files added to the repo index (remember the `git add` command?). They are also how you track changes in a repo. Every _commit_ is tracked by the repo. 

Now add our "local" remote repo as the remote:

```bash
~/foo$ git remote add origin ~/foo.git
```

And then push your commit to it:

```bash
~/foo$ git push --set-upstream origin master
```

This last command pushes your commit to the `origin`, or remote repo, and makes the _branch_ `master`. The `--set-upstream` option sets `origin master` as the default location to push to. For now, don't worry about sudden appearance of this _branch_ idea, we will address it later.

All these commands together look like this:

<script id="asciicast-407246" src="https://asciinema.org/a/407246.js" async></script>

## Cloning Repositories

For fun, let's _clone_ our new "local" remote into a new local repo called `bar`:

```bash
~/foo$ cd ..
~$ git clone ~/foo.git bar/
```

_Cloning_ a repo is exactly as it sounds, you clone the remote repo into a local directory (`bar` for us here), making a local repo. If you check the contents, they will be the same as `foo`:

<script id="asciicast-407510" src="https://asciinema.org/a/407510.js" async></script>

## Making Changes

Let's make some changes in `foo`, commit and push them and then pull them into `bar`. Add a line in the `README.md`:

```bash
~$ echo "Here's a line to add to my file." >> ~/foo/README.md
```

Since `README.md` has already been added to the index, you don't need to run the `git add` command. Instead, you can just use the `-a` option with the `git commit` command. Then push the changes:


```bash
~/foo$ git commit -am "added a line to README"
~/foo$ git push
```

__As a side note:__ you need to be somewhere, not necessarily anywhere in particular, within the git repo directory to run the git commands (notice the `~/foo$` prompt, meaning we're in the `~/foo` directory, just use `cd` to move in and out of directories if it's not specified in the code blocks).

Move over to the `bar` directory and run the `git pull` command to grab the changes you just pushed to the "local" remote repo:

```bash
~/bar$ git pull
```

Now if you print the output of the file, you should see the line you added:

```bash
~/bar$ cat README.md
```

Here's the whole thing together:

<script id="asciicast-407534" src="https://asciinema.org/a/407534.js" async></script>

There! Now you can see how changes made in one repo get pushed to the remote repo and can be pulled to a different repo.

## Merging

Now lets make some changes in both `foo` and `bar` simultaneously, as if we were two people making different edits. Let's add a line to our `README.md` in `foo`, and push the change:

```bash
~$ echo "Here's another line to add to my file." >> ~/foo/README.md
~/foo$ git commit -am "added another line to README"
~/foo$ git push
```

But instead add a different line to the `README.md` in `bar` and commit it:

```bash
~$ echo "Here's a DIFFERENT line to add to my file." >> ~/bar/README.md
~/bar$ git commit -am "added a DIFFERENT line to README"
```

However, if we try to push it, we will get a message saying there are remote changes that you need locally to continue. So, to get the changes we need to make a pull. When you have changes in the remote repo and you pull it to your local repo, git will auto-merge the remote changes if it can. It will try to do the same for us, but it will fail. This is because in both local repos, we made different changes to the same line of the `README.md` file and committed those changes. Therefore, we will have to manually fix the conflict in order to move forward with our local repo (in this case `bar`). You can do this by opening the file in the text editor. You will notice it has added a few lines:

```
Here's a line to add to my file.
<<<<<<< HEAD
Here's a DIFFERENT line to add to my file.
=======
Here's another line to add to my file.
>>>>>>> 715848b869a680c8f19dee61c2b0610ff1215af0
```

One line has the changes we made locally (for `bar`; the first line followed by the `=======`) and the changes that were already in the remote repo (the second line; don't worry if the long string of letters and numbers on the last line looks different, that's the checksum for your commit and is unique for each commit). Let's say we want to keep our local edits, because we think they are better. Edit to file to look like the following, and push it:

```
Here's a line to add to my file.
Here's a DIFFERENT line to add to my file.
```

and push it:

```bash
~/bar$ git commit -am "merged the conflicts from the last pull"
~/bar$ git push
```

You have completed a merge! Again altogether:

<script id="asciicast-407545" src="https://asciinema.org/a/407545.js" async></script>

As you can see though, merging all the time can get quite cumbersome, especially if you have a lot of people working on the same code base at the same time.

## Branching

Git has a better way to handle multiple people working on the same project: _branching_. When we specified `master` earlier when setting up where the remote repo our local repo pushes to, that means we're pushing to the _branch_ called `master`. Typically, the main _branch_ in a repo is called `master` or `main`, the name doesn't really matter, so long as it's understood that's the backbone _branch_.

Now if we want to make some changes to the code but not affect everyone else on the main branch as we commit changes, we can make a new branch called `testing` in the `bar` repo (again pay attention to `~/bar$` prompt):

```bash
~/bar$ git branch testing
```

This command creates a new branch, but we haven't moved to it yet (running `git status` will tell us we're still on the `master` branch). Any changes you make still affect the `master` branch, so move to the new branch with `git checkout`:

```bash
~/bar$ git checkout testing
```

Now make some edits:

```bash
~/bar$ echo "This is on the testing branch" >> README.md
~/bar$ echo "This is still on the testing branch" >> README.md
```

Commit and push the edits (you may have to run `git push --set-upstream origin testing` to set the remote branch you want to push to). If we move back over to the `foo` local repo and run the `git pull` command, we will find the `README.md` file still looks like this:

```
Here's a line to add to my file.
Here's a DIFFERENT line to add to my file.
```

This is because these were the last changes pushed to the `master` branch; our changes in the `bar` repo were made before making the `testing` branch. If we run the command `git checkout testing` in the `foo` repo, we will find the two new lines:

<script id="asciicast-407555" src="https://asciinema.org/a/407555.js" async></script>

Finally, let's say we've made some great improvements in our `testing` branch (those two lines meant a lot apparently!) and we want to merge it back into the `master` branch for everyone to benefit. Switch to the `master` branch in the `bar` repo and run `git merge testing`, like so:

```bash
~/bar$ git checkout master
~/bar$ git merge testing
```

Since we didn't commit any changes to the `master` branch, our `README.md` will have the two new lines from the `testing` branch and we won't have to handle conflicts like we did earlier (otherwise handling conflicts is the same):

<script id="asciicast-407560" src="https://asciinema.org/a/407560.js" async></script>

With our `testing` branch merged into the `master` branch, we can push the merge and see the changes in the `foo` repo:

<script id="asciicast-407562" src="https://asciinema.org/a/407562.js" data-rows=80 async></script>

And there you have it! Creating and merging branches is pretty easy and extremely useful in projects with a large amount of people, so use branching liberally. In fact, in most production code, you will often see a `stable` and `latest` branch, denoting the code that is battle-tested (`stable`) and the updates that still may present some problems (`latest`), which just shows others find the feature useful too!

# GitHub and GitLab

Everything we've done so far has been done totally locally. `foo` and `bar` are our local repos and `foo.git` is our "local" remote repo. Nothing changes if the "local" remote repo is no longer local. Normally, the remote repo is on a different server, potentially kilometers away, such as on a virtual private server. When we cloned `foo.git` into `bar`, if `foo.git` was actually on a remote server, the command `git clone ~/foo.git bar/` would look like this:

```bash
~$ git clone remoteserveruser@remoteserver:/path/to/foo.git bar/
```

This command tells git to use `ssh` to connect to the `remoteserver` with the user, `remoteserveruser` (actual remote server names and user names will be different), and clone the `foo.git` repo into the local directory, `bar`. The only change was `~/foo.git` was changed to `remoteserveruser@remoteserver:/path/to/foo.git`. __It's important to note__ that since we're using `ssh` now, you have to have `ssh` keys properly setup to communicate to the remote server beforehand, other wise your clone request will fail.

There are two very well known platforms that provide a remote "server" especially for git repos, [GitHub](https://github.com/) and [GitLab](https://about.gitlab.com/). They also provide features atop the standard git features and sell a lot of these features to make their revenue. However, to have them just host a git repo is free on either platform. To use them you will have to make an account on the respective platform and properly set up ssh on their platform (follow their documentation for this). Otherwise, they are no different than privately hosting your remote repo on a virtual private server.


