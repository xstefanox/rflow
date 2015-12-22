#!/bin/bash

basedir=`dirname $0`
repo1=${basedir}/repo1
repo_bare=${basedir}/repo-bare
repo_bare_absolute=`readlink -f ${repo_bare}`

# CREATE REPOSITORIES

rm -rf ${repo1} ${repo_bare}
mkdir ${repo1} ${repo_bare}
cd ${repo_bare}
git init --bare
cd -
cd ${repo1}
git init
git remote add origin file://${repo_bare_absolute}

# CREATE hotfix BRANCHES

touch file1.txt && git add file1.txt && git commit -m 'added file1.txt' && sleep 1
touch file2.txt && git add file2.txt && git commit -m 'added file2.txt' && sleep 1
touch file3.txt && git add file3.txt && git commit -m 'added file3.txt' && sleep 1
touch file4.txt && git add file4.txt && git commit -m 'added file4.txt' && sleep 1
touch file5.txt && git add file5.txt && git commit -m 'added file5.txt' && sleep 1

git checkout master && git checkout -b hotfix/1-horrible-shai-hulud
touch file6.txt && git add file6.txt && git commit -m 'added file6.txt' && sleep 1
touch file7.txt && git add file7.txt && git commit -m 'added file7.txt' && sleep 1

git checkout master && git checkout -b hotfix/2-horrible-shai-hulud
touch file8.txt && git add file8.txt && git commit -m 'added file8.txt' && sleep 1
touch file9.txt && git add file9.txt && git commit -m 'added file9.txt' && sleep 1

git checkout master && git checkout -b hotfix/3-horrible-shai-hulud
touch file10.txt && git add file10.txt && git commit -m 'added file10.txt' && sleep 1
touch file11.txt && git add file11.txt && git commit -m 'added file11.txt' && sleep 1

git checkout hotfix/1-horrible-shai-hulud && git push --set-upstream origin hotfix/1-horrible-shai-hulud -f
git checkout hotfix/2-horrible-shai-hulud && git push --set-upstream origin hotfix/2-horrible-shai-hulud -f
git checkout hotfix/3-horrible-shai-hulud && git push --set-upstream origin hotfix/3-horrible-shai-hulud -f

git checkout master
git push --set-upstream origin master -f
git branch -D hotfix/1-horrible-shai-hulud hotfix/2-horrible-shai-hulud hotfix/3-horrible-shai-hulud

# CREATE FEATURE BRANCHES

git checkout -b develop
touch file12.txt && git add file12.txt && git commit -m 'added file12.txt' && sleep 1
touch file13.txt && git add file13.txt && git commit -m 'added file13.txt' && sleep 1
touch file14.txt && git add file14.txt && git commit -m 'added file14.txt' && sleep 1
touch file15.txt && git add file15.txt && git commit -m 'added file15.txt' && sleep 1

git checkout develop && git checkout -b feature/1-supercool-new-feature
touch file16.txt && git add file16.txt && git commit -m 'added file16.txt' && sleep 1
touch file17.txt && git add file17.txt && git commit -m 'added file17.txt' && sleep 1

git checkout develop && git checkout -b feature/2-supercool-new-feature
touch file18.txt && git add file18.txt && git commit -m 'added file18.txt' && sleep 1
touch file19.txt && git add file19.txt && git commit -m 'added file19.txt' && sleep 1

git checkout develop && git checkout -b feature/3-supercool-new-feature
touch file20.txt && git add file20.txt && git commit -m 'added file20.txt' && sleep 1
touch file21.txt && git add file21.txt && git commit -m 'added file21.txt' && sleep 1

git checkout feature/1-supercool-new-feature && git push --set-upstream origin feature/1-supercool-new-feature -f
git checkout feature/2-supercool-new-feature && git push --set-upstream origin feature/2-supercool-new-feature -f
git checkout feature/3-supercool-new-feature && git push --set-upstream origin feature/3-supercool-new-feature -f

git checkout develop
git push --set-upstream origin develop -f
git branch -D feature/1-supercool-new-feature feature/2-supercool-new-feature feature/3-supercool-new-feature
