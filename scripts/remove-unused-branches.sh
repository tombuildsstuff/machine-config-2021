#!/bin/bash
git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d

# then prune anything
git remote prune origin
