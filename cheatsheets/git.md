## Commit

    git init          # Initialize an empty file
    git status        # Show the changed and unstaged files
    git add <file>    # Add(Stage) <file>
    git reset <file>  # Remove <file> from the stage
    git reset --hard  # Remove all uncommitted changes
    git rm <file>     # Removes <file> from both git and system
    git rm --cached   # Removes <file> from git
    git commit        # Commit staged file, it opens an editor
    git commit -m "<msg>"   # Commit with message <msg>

    git log           # Show the comment log
    git log --oneline # Show the commit log in one line
    git diff HEAD     # Differences between now and HEAD

    git tag           # List all tags
    git tag -a v1.0 -m "msg"    # Create an annotated tag
    git show <tag>              # Show the description of <tag>
    git tag --delete <tag>      # Delete the tag

    git rebase -i <commit_id>         # Rebase commits from <commit_id> 

## Branch

    git branch                  # List branches 
    git branch -a               # List local and remote branches
    git branch <branch>         # Create branch
    git branch -d <branch>      # Delete <branch>
    git branch -m <new-name>    # Rename the branch
    git checkout <branch>       # Checkout(Change HEAD) to <branch>
    git merge <branch>          # Merge <branch> to the current branch

## Remote

    git remote add <remote> <link>      # Add a remote reposiory named as <remote> 
    git remote                          # Show remote
    git remote -v                       # Show more details about the remote 
    git remote rm <remote>              # Remove a remote repository

    git clone <link> <path>             # Clone a remote repo to local <Path>

The following commands require git-remote-add

    git push                            # Push this branch to the remote origin repo
    git push <remote> <remotebranch>:<localbranch>
                                        # Push <localbranch> to the <remotebranch> from the <remote> repo
    git fetch                           # Fetch remote to the branch
    git pull                            # Fetch and merge
    git pull <remote> <remotebranch:<localbranch>
                                        # Pull <remotebranch> from <remote> to <localbranch>

