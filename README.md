Hey there! This is a once-garbage repo turned gold with major tweaks. I don't know exactly what the whole process did exactly, but someday will know for sure.

This repo has endured several blows. Just as a record:

1. First, I learnt deleting the code files. Actually deleting is just as easy as

- To remove file from local filesystem for subsequent commit to remote repo:

    git rm file1.txt
    git commit -m "remove file1.txt" # give a message

- To only to remove the file from the git repo and not from the local filesystem:

    git rm --cached "file1.txt"

- Finally, to push changes to remote repo:

    git push origin branch_name # branch_name is usually "master"

_Inspired from_: http://stackoverflow.com/questions/2047465/how-can-i-delete-a-file-from-git-repo

2. Second, We can make the current commit the only initial commit; Removing all the past commit history, or starting fresh in a way.

- Note that this being also called a brute-force approach also removes the configuration of the repository. Additionally, It does not work if the repo has submodules! If using submodules, one should use feature like "interactive rebase".

- Step 1: remove all history

    rm -rf .git

- Step 2: reconstruct the git repo with only the current content

    git init
    git add .
    git commit -m "Fresh initial commit"

- Step 3: push to github

    git remote add origin <github-url>
    git push -u --force origin master

- Alternative 1: The proposed solution when one has submodules and requires them to work fully is (This solution makes use of branching):

    git checkout --orphan new_branch_name 
    git add -A  # Add all files and commit them
    git commit
    git branch -D master  # Deletes the master branch
    git branch -m master  # Rename the current branch to master
    git push -f origin master  # Force push master branch to github
    git gc --aggressive --prune=all     # remove the old files

- Alternative 2: This will create a new branch with one commit that adds everything in HEAD. It doesn't alter anything else, so it's completely safe.
 
    git branch new_branch_name $(echo "commit message" | git commit-tree HEAD^{tree})

_Inspired from_: http://stackoverflow.com/questions/9683279/make-the-current-commit-the-only-initial-commit-in-a-git-repository


