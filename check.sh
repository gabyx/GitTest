#!/bin/bash
set -e
trap 'echo "Your solution is not correct!"' ERR
git checkout feature &>/dev/null
files=$(git --no-pager log feature --oneline |
        cut -d ' ' -f 1 |
        xargs -n 1 git diff-tree --no-commit-id --name-only -r)
echo "$files" | grep -q 'W.2' && false
echo "Your solution is correct: no 'W.2' file found!"
