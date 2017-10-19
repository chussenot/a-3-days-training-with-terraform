git basics
==========

#### Build a good software with Version Control

---

# Summary

1. About Version Control
2. Workshop
3. Collaborate
4. Documentation
5. Sources
---

<!-- *template: gaia -->

# ==1.== About Version Control
---

###### About Version Control

First to build a good software you need to track your work... **V**ersion **c**ontrol **s**oftware allows you to have “versions” of a project, which show the changes that were made to the code over time, and allows you to backtrack if necessary and undo those changes.

The benefits of a system like this is that multiple developers can make changes, and **each change** can then be attributed to a **specific developer**.

---

###### About Version Control

<!-- *template: invert -->

That takes us on to [Git](https://git-scm.com/), and other so-called distributed version control systems. In these systems, clients don’t just check out the current version of the files and work from them they mirror the entire version history.

> *It might also interest you to learn that Git is used to manage and develop the core [linux kernel](https://github.com/torvalds/linux#readme) the base building block upon which all linux distros are built.*

---

###### About Version Control

As `git` is decentralized, everyone is its own server
So you can also pull & push to servers, also called remotes; origin is the most common remote.

You may find upstream & so on

- HTTPS will get over port 80 (most useful one)
- SSH will get over port 22, may be restricted on some networks
- Git will get over port 9418. Same as SSH, but not authentication

---

###### About Version Control

Commit is a file system snapshot + metadata (date, author, parent(s) commit(s), ...).

All metadata and object database stored in `.git` directory.

Everything in Git is check-summed and is then referred to by that checksum.

	SHA-1 hash: 24b9da6552252987aa493b52f8696cd6d3b00373

Same commits on 2 remotes repositories have same SHA-1 hash.

---

###### About Version Control

![Image](areas.png)


---

###### About Version Control

The basic Git workflow goes something like this:
 1. You modify files in your working tree.
 2. You stage the files, adding snapshots of them to your staging area.
 3. You do a commit, which takes the files as they are in the staging area and stores that snapshot permanently to your Git directory.

---

#### Workshop

Install `git` for your OS to allow code sharing in a collaborative way, simply and efficiently.

```
$ apt-get install git
```

```
$ brew install git
```

---

#### Workshop - Init

Set the name that will be attached to your commits and tags.

```
$ git config --global user.name "Your Name"
```

Set the e-mail address that will be attached to your commits and tags.
```
$ git config --global user.email "you@example.com"
```

Enable some colorization of Git output.
```
$ git config --global color.ui auto
```

---

#### Workshop - Init

Get an existing project:
```
$ git clone <user>@<server>:<repo_name>.git
```

Create a new project:

```
$ git init training-git
$ cd training-git
$ git commit --message "Init repo" --allow-empty
```

---

#### Workshop - Branches

Branches:

- Branches are used to develop features that are independent of each other.
- The `master` branch is the default branch when you create a repository.
- `origin` is the default server
- Use the other branches for development and then merge to the main branch when you have finished.

---

#### Workshop - Branches

```
# Create a new branch and checkout it
$ git checkout -b feature/mybranch

# Create new file
$ echo "content" > first_file.txt

# Track file and add it in staging
$ git add first_file.txt

# Check files ready to commit
$ git status  

# Commit
$ git commit -m "Add new first_file.txt"
```


---

#### Workshop - Branches

Moving on the `master` branch from branch `feature/mybranch`
```
$ git checkout master
```
Merge a local branch
```
$ git merge feature/mybranch
```

Show branches history
```
$ git log --graph --all --pretty=oneline --abbrev-commit
```

---

#### Workshop - Branches

Remove a local branch
```
$ git branch -d feature/mybranch
```

Remove a remote branch
```
$ git push origin --delete <remote_branch_name>
$ git push origin :<remote_branch_name>
```


---

#### Workshop - stash


- Need to switch branch but current work not finished
- Stashing takes the dirty state of your working directory and saves it on a stack of unfinished changes that you can reapply at any time.
---

#### Workshop - stash

```
# Modify file
$ echo "second line" > first_file.txt
$ git status

$ git stash
# or
$ git stash save "message"
```

List pending changes
```
$ git stash list
```

Restore last change and remove it from stack
```
$ git stash pop
```

---

#### Workshop - stash
Others:
- `git stash apply`: apply the changes recorded in the stash
- `git stash clear`: remove all the stashed states
- `git stash drop`: remove a single stashed state from the stash list
- `git stash show`: show the changes recorded in the stash as a diff

---

#### Workshop

Reset the current changes to their saved state
```
$ git checkout -- first_file.txt
# or
$ git checkout <commit_name> -- <file_name>
```
With `commit_name`:
- HEAD -> last commit on the current branch
- branch name
- commit hash
- tag name

---

#### Workshop - Resolve conflicts

Create and mofify file in new branch
```
$ git checkout -b feature/feature_2
$ echo "seconde line from feature_2" > first_file.txt
$ git commit -m "Add a line for feature 2" first_file.txt
```

Same file is modified in master
```
$ git checkout master
$ echo "seconde line from master" > first_file.txt
$ git commit -m "Add a line for master" first_file.txt
```
Display history commits
```
$ git log --graph --all --pretty=oneline --abbrev-commit
```
---


#### Workshop - Resolve conflicts

Merge feature/feature_2 to master
```
$ git checkout master
$ git merge feature/feature_2
```
Find conflicts with `git status` and open file in editor
```
<<<<<<< HEAD
seconde line from master
=======
seconde line from feature_2
>>>>>>> feature/feature_2
```
Delete *<<*, *==* and *>>>* symbols.
Keep one or both lines.

---

#### Workshop - Resolve conflicts
Mark conflict as resolved for this file:
```
$ git add first_file.txt
```

Commit changes
```
$ git commit
```
---

#### Workshop

Rename with git
```
$ git mv <src_file_name> <target_file_name>

# Ex:
$ git mv first_file.txt file1
$ git status
$ git commit -m "Rename file"
```

Add changes previous commit
```
$ echo "content" >> file1
$ git add file1
$ git commit --amend -m "Rename and add content"
```

---

#### Workshop - Revert

Remove changes made by a commit
```
$ echo "content" > file2
$ git add file2
$ git commit -m "Add file2" file2

$ git revert HEAD
```

Display history
```
git log --unified HEAD~3..HEAD
```
- `--unified`: display content change
- `HEAD~3...HEAD`: from 3 previous commits to current commit

---
#### Workshop - Cherry-pick

Report commit/fix from one branch to another.

```
$ git checkout -b fix/fix_bug HEAD~3
$ echo "modification" >> first_file.txt
$ git add first_file.txt
$ git commit -m "fix fix1"

```

Report commit to feature/feature_2 branch
```
$ git checkout feature/feature_2
# Find commit id
$ git log --graph --all --pretty=oneline --abbrev-commit
$ git cherry-pick <commit_id>
```

---
#### Workshop - Rebase

```
$ git checkout fix/fix_bug
# Create backup branch
$ git branch previous_rebase

$ git rebase master
# fix conflict with editor
$ git rebase --continue

```
Fast-forward merge : when the merge resolves as a fast-forward, only update the branch pointer, without creating a merge commit.
```
git checkout master
git merge --ff fix/fix_bug
```
---
#### Workshop - Rebase

Rewrite history - **before push**

```
$ git rebase -i HEAD~5 # Rebase lastest 4 commits
```

```
pick 9941700 Rename and add content
pick 9372242 Add file2
pick 5e9f292 Revert "Add file2"
pick 75c14ad fix fix1
```
become
```
pick 9941700 Rename and add content
drop 9372242 Add file2
drop 5e9f292 Revert "Add file2"
pick 75c14ad fix fix1
```
---
#### Workshop - Rebase

Lines can be re-ordered and they are executed from top to bottom.                               

Commands:      
```
- p, pick = use commit
- r, reword = use commit, but edit the commit message
- e, edit = use commit, but stop for amending   
- s, squash = use commit, but meld into previous commit
- f, fixup = like "squash", but discard this commit's
             log message
- x, exec = run command (the rest of the line) using shell
- d, drop = remove commit                       
```


---
#### Workshop - Reset
Reset the changes

```
$ git reset --soft # recovered changes and steps
$ git reset  --hard # no recovery of changes
$ git reset  --mixed # changes retrieved but not staged
```

---

#### Workshop - Filter

Filter the commit tree

```
$ git filter-branch --tree-filter 'my_command' HEAD
```

Remove a file
```
$ git filter-branch --tree-filter 'rm -f <file.ext>' HEAD
```

----

#### Workshop - Configuration

Files:

- Manage files to be ignored: `.gitignore`

Configuration:

- Project-level: `.git/config`
- User-level: `~/.gitconfig`
- System-level: `/etc/gitconfig`
-
---
#### Others

Graphic tools:
- git gui : to create new commit
- gitk (--all): to manage branch and display history

Install them with:
`sudo apt install git-gui`

---

Dependencies & Pre-requisites
-----------------------------

- [make](https://en.wikipedia.org/wiki/Make_(software))

Usage
-----

**Makefiles** are a simple way to organize commands, to see this project useful
system commands run `make help`

Technical notes
---------------

The following summarises some important technical considerations:

Must-Read Sources
-----------------

- Official : https://git-scm.com/
- Full documentation: https://git-scm.com/book/en/v2
- Man Pages : https://git-scm.com/docs/git

https://en.wikipedia.org/wiki/List_of_version_control_software
https://github.com/git-tips/tips
https://svnvsgit.com/
https://stackoverflow.com/questions/802573/difference-between-git-and-cvs
https://blogs.atlassian.com/2012/03/git-vs-mercurial-why-git/
http://stackoverflow.com/questions/3528245/whats-the-difference-between-git-reset-mixed-soft-and-hard#answer-3528483
http://gitready.com/intermediate/2009/02/09/reflog-your-safety-net.html
http://labs.excilys.com/2011/04/12/git-reflog-ou-comment-toujours-retomber-sur-ses-pieds/
http://stackoverflow.com/questions/31769820/differences-between-git-submodule-and-subtree
http://stackoverflow.com/questions/24709704/apply-gradle-file-from-different-repository/24709789#24709789
https://github.com/splitsh/lite

Contributing
------------

If you find bugs or want to improve the documentation, please feel free to
contribute!

Happy coding!
