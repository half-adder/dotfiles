alias cs='cd;ls'
alias ok='ping google.com'

alias opslog01='ssh sjohnsen@opslog01n.ndmad2.tripadvisor.com'
alias dev-machine='ssh sjohnsen@sjohnsen-dev.dhcp.tripadvisor.com'
alias dev-machine-r='ssh root@sjohnsen-dev.dhcp.tripadvisor.com'
alias sr-dev-machine='ssh root@sdewitt-dev.dhcp.tripadvisor.com'

alias secops-dev01='ssh sjohnsen@secops-dev01n.n.tripadvisor.com'
alias secops-dev02='ssh sjohnsen@secops-dev02n.n.tripadvisor.com'

alias start-jekyll='jekyll serve --detach'
alias stop-jekyll='pkill -f jekyll'

alias sec-path='export PYTHONPATH=/Users/sjohnsen/dev/trip/secops/lib/:$PYTHONPATH'
alias secdb='psql -U secops -h secops-dev01n.n.tripadvisor.com'

alias sbp='source ~/.bash_profile'

alias mkvirtualenv3='mkvirtualenv $(which python3)'
