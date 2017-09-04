#!/bin/bash

set -ex

dirty=0
[ -n "$(git diff --name-only HEAD)" ] && dirty=1

[ $dirty != 0 ] && git stash

git pull --rebase

[ $dirty != 0 ] && git stash pop

git submodule init && git submodule update
