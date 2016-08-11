parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function py2env() {
    mkvirtualenv -p $(which python2) $1
}

function py3env() {
    mkvirtualenv -p $(which python3) $1
}
