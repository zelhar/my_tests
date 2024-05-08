# Git tips and workflow

## Quick reference and Tips

### Refs
Good sources for reference:
https://git-scm.com/book/de/v2/
https://www.toptal.com/developers/gitignore


### Tips
To remove file `file.txt` from tracking but not delete it from local folder:
```
git rm --cached file.txt
```

## Workflow
### Branching changing merging locally
Start a new branch
```
git branch -c new_branch
git switch new_branch
```

make some changes, add and commit them to the new brnach
```
nvim some_file.txt
git add some_file.txt
git commit -m "added some_file.txt"
```

switch to main branch and merge new branch into it, then push into the remote.
```
git switch main
git merge new_branch -m meged fix into main"
git push -u origin main
```
