# Parallel Agent Workflow

This repo uses git worktrees to let multiple agents work simultaneously on different branches. Each agent owns a worktree and a branch, and merges back to `master` when done.

## Rules

1. Each agent gets one worktree + one branch
2. Worktrees live under `~/.dotfiles-wip/<task-name>`
3. Commit atomically, push to `master` when the task is complete
4. Delete the worktree after merge
5. Update this file when starting/ending a task

## Active Tasks

| Agent | Task | Branch | Worktree | Status |
|-------|------|--------|----------|--------|
| main | carapace integration | `carapace-integration` | `~/.dotfiles-wip/carapace` | in progress |

## Task Lifecycle

1. Create branch from `master`
2. Create worktree: `git worktree add ~/.dotfiles-wip/<task> <branch>`
3. Work in the worktree
4. Commit, merge back to `master`, delete worktree + branch
5. Update AGENTS.md

## Conventions

- Branch name: `<task>-<description>` (e.g. `carapace-integration`)
- Commit messages: descriptive, one logical change per commit
- Ask before committing if unsure
