# Git commands

**Commonly used:**
```
git add
git add -A
git branch
git checkout [./-- (file name)]
git diff [--staged]
git status [-s/-sb]
git stash
git commit -a -m "[commit message]"
git pull origin [remote branch]
git push
git log
git clone [OPTIONS --recursive] [git repo]
```

### Git Local

Create local branch
```
git checkout -b [branch name]
```

Rename local branch <br />
If you are on a different branch:
```
git branch -m [old branch name] [new branch name]
```

Git Revert Changes
```
git reset --hard  //all files
git checkout HEAD -- my-file.txt //single file
```

Removes all the files and directories that are not yet tracked by git
```
git clean -fd
```

### Git Remote

Show remote branches
```
git remote -v
```

Replace Remote GIT Repo
```
git remote remove origin
git remote add origin [git repo]
```

Create remote branch
```
git checkout -b [branch name]
```

Edit remote commit
```
git commit --amend
git push -f
```

Edit, add and commit your files.
```
git add -A
git commit -m "message"
git push -u origin [branch name]
```

Delete local/remote branch
```
git branch -D [branch name]
--- or ---
git push --delete origin new-feature
```

Rebase remote branch
```
git rebase -i origin/[branch name]~4 [branch name]
git push origin +[branch name]
```

Local rebase then push changes to remote branch
```
git log --graph --branches --oneline
git rebase --interactive HEAD~5
git push origin +[branch name]
git rebase --abort
```

Rename remote branch
```
git branch -m [old branch name] [new branch name]
git push origin :[old branch name] [new branch name]
git push origin -u [new branch name]
```

### Setting up repositories for use

Initialize new repository
```
echo "# example README.md" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin git@github.com:designtypist/example.git
git push -u origin master
```

Push an existing repository
```
git remote add origin git@github.com:designtypist/example.git
git branch -M master
git push -u origin master
```

### Git Submodules
**[Git Submodules](https://www.vogella.com/tutorials/GitSubmodules/article.html)**
Initialize Git submodules by cloning the submodule repo
```
git submodule update --init
git submodule update --init --recursive //nested submodules
```

Adding Git submodules and tracking commits
```
git submodule add -b master [git repo]
git submodule init
```

Pulling with submodules
```
git pull --recursive-submodules //pull all changes including submodules
git submodule update --remote //pull all changes for submodules
```

Delete a submodule from a repo
```
git submodule deinit -f — mymodule
rm -rf .git/modules/mymodule
git rm -f mymodule
```

### Other Git Commands
**[Git Duplication of a Repository](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)**
```
git clone --bare https://github.com/exampleuser/old-repository.git
cd old-repository.git
git push --mirror https://github.com/exampleuser/new-repository.git
cd ..
rm -rf old-repository.git
```
**[Git Cherry-Pick](https://git-scm.com/docs/git-cherry-pick)**

**Git Ignore**
```
touch ~/.gitignore
git config --global core.excludesFile ~/.gitignore
```

**Git Configs**
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

**[Git LFS](https://git-lfs.github.com/)**
```
git lfs track "*.psd"
git add .gitattributes
```

**GIT RESET EVERYTHING**
> ⚠️ BE CAREFUL WHEN USING THIS COMMAND YOU HAVE BEEN WARNED!!!
```
git reset $(git commit-tree HEAD^{tree} -m "A new start")
```
