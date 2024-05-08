# Git tips and workflow

## Quick reference and Tips

### Refs
Good sources for reference:
* https://git-scm.com/book/de/v2/
* https://www.toptal.com/developers/gitignore


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
git merge new_branch -m "merged fix into main."
git push -u origin main
```

delete the local branc, it only existed locally so now its completely gone:
```
git branch -d new_branch
```


### Renaming and deleting remote branches
To rename a remote branch locally, then push it to remote:
```
git branch --move old_branch_name new_branch_name
git switch new_branch_name
git push -u origin new_branch_name

```

Now remotely bothe old and new branches still exist. 
To remove the old one:
```
git push origin --delete old_branch_name
```

To delete branch locally and then remotely is the same procedure:
```
git branch -d branch_nane
git push origin --delete branch_name
```

### Merge conflict
Tried to merge`master` into `other` but suppose that
`file_with_conflict.txt` has conflicting changes between `master` and `other`.
Edit the conflict file and replace marked conflicts with desired input:
```
<<<<<<< HEAD
this file is
=======
this file was
>>>>>>> master
(edited this line from master)
is
(edited this line from conflict_branch)
going to
(and this line)
have 
a merge conflit (and this)
```
replace the `<<<<HEAD >>>>` block which shows the conflicting version with the desired text and make other
changes possibly.
Then add, commit, push the fixed file.
```
git add file_with_conflict.txt
git commit -m "fixed conflict, merge completed."
git push -u origin other
```
