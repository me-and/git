#!/bin/sh

GIT_EDITOR="$(git var GIT_EDITOR)"
GIT_DIR="$(git rev-parse --git-dir)"
GIT_BISECT_LOG_TMP="${GIT_DIR}/BISECT_LOG_EDIT"

git bisect log >"$GIT_BISECT_LOG_TMP"
eval "$GIT_EDITOR" "$GIT_BISECT_LOG_TMP"
git bisect reset HEAD
git bisect start
git bisect replay "$GIT_BISECT_LOG_TMP"
rm -f "$GIT_BISECT_LOG_TMP"
