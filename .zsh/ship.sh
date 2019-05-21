function ship() {
    local branch=$(git branch | grep '^*' | cut -d ' ' -f2)
    if [ "$branch" = "master" ]; then
        echo "You're on master!"
        exit 1
    fi

    git checkout master &&
        git pull &&
        git merge --no-ff "$branch" &&
        git push origin master &&
        git push origin :"$branch" &&
        git branch -d "$branch"
}
