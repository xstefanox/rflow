# r-flow

A Git extension to help developers that want to use a structured workflow, but preserving a clean, human-readable history for their projects.

This workflow is heavily inspired by [Git-Flow](https://github.com/nvie/gitflow) and its [branching model](http://nvie.com/posts/a-successful-git-branching-model/) but it is focused on preserving a simple branch graph that allows inspecting the project history with easiness.
To achieve this goal, the workflow makes heavy use of rebasing, constantly rebuilding the graph structure to adapt it to the development progress.

Many concepts are inherited from Git-Glow, but the main idea is to maintain a single main branch, with many minor, temporary and single issue-dedicated branch.

### Why using rflow

Git-Flow branching model is excellent because it defines not only a simple guideline to use a versioning system, but a complete development workflow the development team.
One of its drawbacks is that it tends to mess the Git commit graph, because it always uses the merge operation.
This could be non optimal for someone who is used to heavily and frequently inspect the commit graph to review the past work and monitor the work progress.
On the contrary, rflow aims to maintain a simple, linear commit graph, ensuring the project history is easily readable.

### Merging strategy: constantly rebasing

To achieve this goal, rflow makes heavy use of the rebase feature, always avoiding three-way commit merging and operating on local and remote branches at the same time.
Feature and hotfix branches and thus recursively rebased on their corresponding main branch.
