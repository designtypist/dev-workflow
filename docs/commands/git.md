# Git commands

**Most used:**
```
git add
git branch
git checkout [./-- (file name)]
git diff [--staged]
git status [-s/-sb]
git stash
git commit -a -m "[commit message]"
git pull origin [remote branch]
git push
git log
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
git reset --hard
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

Rename remote branch
```
git branch -m [old branch name] [new branch name]
git push origin :[old branch name] [new branch name]
git push origin -u [new branch name]
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
