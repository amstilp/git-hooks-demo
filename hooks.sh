## This script is intended to be run interactively.

# Create a new git repo
mkdir my_repo
cd my_repo
git init

# This creates a .git directory.
ls -a

# Make a test file to edit in this demo.
touch file.txt
git add file.txt
git commit -m "initial commit"

# Scripts are stored in the .git/hooks directory
ls .git
ls .git/hooks
# Note the sample scripts. These are not run because the filename ends with .sample

#######################################
## Example 1
## Print a congratulatory message after you make a commit.
## This uses the post-commit hook, which runs after a commit has succeeded.

# Install the hook:
cp ../git-hooks-demo/hook_scripts/post-commit.py .git/hooks/post-commit

# Make sure it is executable.
chmod u+x .git/hooks/post-commit

# Make a small change to the test file so we can commit it.
echo "add a line" >> file.txt
git add file.txt
git commit

# Note the congratulatory message!


# The post-commit script won't run if the commit fails for some reason.
echo "add another line" >> file.txt
git add file.txt
git commit -m ""

# The commit fialed, so the post-commit script didn't run.
git status

# Let's get rid of that change for now.
git reset HEAD .
git checkout -- file.txt

# Uninstall the hook:
rm .git/hooks/post-commit


#######################################
## Example 2
## Suggest including some ascii art in your commit messages by adding it to the commit message template.

# Install the hook:
cp ../git-hooks-demo/hook_scripts/prepare-commit-msg.py .git/hooks/prepare-commit-msg

# Make sure it is executable.
chmod u+x .git/hooks/prepare-commit-msg

# Make a change to the test file so we can commit it.
echo "add another line" >> file.txt
git add file.txt
git commit

# Inspect the log.
git log

# Note that you can remove the art this way, and it will not be included in the commit message.
echo "add another line" >> file.txt
git add file.txt
git commit

git log

# Uninstall the hook.
rm .git/hooks/prepare-commit-msg


#######################################
## Example 3
## Add some ascii art to your commit messages in a way that can't be removed.

# Install the hook:
cp ../git-hooks-demo/hook_scripts/commit-msg-add-cat.py .git/hooks/commit-msg

# Make sure it is executable.
chmod u+x .git/hooks/commit-msg

# Make a change to the test file so we can commit it.
echo "add another line" >> file.txt
git add file.txt
git commit

# Inspect the log.
git log

# Uninstall the hook.
rm .git/hooks/commit-msg


#######################################
## Example 4
## Reject short commit messages.

# Install the hook:
cp ../git-hooks-demo/hook_scripts/commit-msg-reject-short.py .git/hooks/commit-msg

# Make sure it is executable.
chmod u+x .git/hooks/commit-msg

# Make a change to the test file so we can commit it.
echo "add another line" >> file.txt
git add file.txt
git commit -m "adding another line to the file"

# The commit is not there.
git log

# Try again with a vowel-free commit message.
git commit -m "ddng nthr ln t th fl"

# The commit was made.
git log

# Uninstall the hook.
rm .git/hooks/commit-msg
