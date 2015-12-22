# r-flow

A Git extension to help developers that want to maintain a clean, human-readable history for their projects.

This workflow is heavily inspired by [Git-Flow](https://github.com/nvie/gitflow) and its [branching model](http://nvie.com/posts/a-successful-git-branching-model/) but it is focused on preserving a simple branch graph that allows inspecting the project history with easiness.
To achieve this goal, the workflow makes heavy use of rebasing, constantly rebuilding the graph structure to adapt it to the development progress.

Many concepts are inherited from Git-Glow, but the main idea is to maintain a single main branch, with many minor, temporary and single issue-dedicated branch.
