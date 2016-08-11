export CLICOLOR=1

# make virtualenvwrapper work 
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# customize prompt
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# Go Stuff
export GH=github.com/feuilles
export GOPATH=/Users/sjohnsen/dev/personal/go

export PATH=$GOPATH/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:
