#!/bin/sh
# Add a git repo as a submodule to .vim/bundle, so it can be used via pathogen.
# See - you're infecting vim ... vimfect ... get it?

set -e

repo="$1"
[ -z $repo ] && echo "Need a repo path" && exit 1
dir_name="$(echo $repo | tr / \\n | tail -n 1)"
git submodule add $repo .vim/bundle/$dir_name
