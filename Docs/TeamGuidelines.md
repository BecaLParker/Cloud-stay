# Team Guidelines

## Making changes using branches

#### Initial Setup
* Initially clone the repo
* cd into the new directory

#### Pulling and Pushing
1. Create a branch (git checkout -b < branch name >)
2. Check that you are in the correct branch, not the main branch (git branch)
3. Write your tests and then your code
4. Stage your changes (git add)
5. Commit your changes with a descriptive message (git commit -m "message")
6. Push your changes into the repo (git push --set-upstream origin < branch name >)

#### GitHub Pull Request

* Go to the Github repo (Repo address)
* Click on the "Pull requests" tab
* Click on "New pull request"
* Select your branch in the "compare" select block
* Click on "Create pull request"
* The differences will be displayed below.
* Create a pull request
* Add a comment (optional)
* Click "Create pull request"
* A review will be required.

***NOTE: Another collaborator must review and merge your code. This is to prevent anyone accidentally pushing onto main.***

#### Local Branch

* It is recommended that you delete your local branch (git branch -d < branch name >)
