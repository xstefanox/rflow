#!/bin/bash

basedir=`dirname $0`
repo1=${basedir}/repo1
repo_bare=${basedir}/repo-bare
repo_bare_absolute=`readlink -f ${repo_bare}`

# CREATE THE REPOSITORY

rm -rf ${repo1} ${repo_bare}
mkdir ${repo1} ${repo_bare}
cd ${repo_bare}
git init --bare
cd -
cd ${repo1}
git init
git remote add origin file://${repo_bare_absolute}

# INITIALIZE THE REPOSITORY

git commit -m 'repository created' --allow-empty && sleep 1
git commit -m 'commit #1' --allow-empty && sleep 1
git commit -m 'commit #2' --allow-empty && sleep 1
git commit -m 'commit #3' --allow-empty && sleep 1
git push --set-upstream origin master
git checkout -b develop
git commit -m 'commit #4' --allow-empty && sleep 1
git commit -m 'commit #5' --allow-empty && sleep 1
git commit -m 'commit #6' --allow-empty && sleep 1
git push --set-upstream origin develop

# DROP THE PRODUCTION BRANCH

git branch -d master

# VERIFY THAT THE ERROR MESSAGE IS NOT DISPLAYED

cmd_output=`../../bin/git-rflow hotfix start test-hotfix-1 2>&1`
echo $cmd_output | grep -iq "not a valid object name"

if [[ $? -eq 0 ]]
then
  echo '!!! ASSERTION FAILED: production branch not found'
fi

# VERIFY THAT THE BRANCH HAS BEEN CREATED

git for-each-ref --format='%(refname)' refs/heads | grep -q ^refs/heads/hotfix/test-hotfix-1$

if [[ $? -ne 0 ]]
then
  echo '!!! ASSERTION FAILED: hotfix branch has not been created'
fi
