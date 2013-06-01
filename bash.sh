#Color configs

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export CLICOLOR="auto"

#Git config

function git_color ()
{
    # Get the status of the repo and chose a color accordingly
    local STATUS=`git status 2>&1`
    if [[ "$STATUS" == *'Not a git repository'* ]]
    then
        echo ""
    else
        if [[ "$STATUS" != *'working directory clean'* ]]
        then
            # red if need to commit
            echo -e '\033[0;31m'
        else
            if [[ "$STATUS" == *'Your branch is ahead'* ]]
            then
                # yellow if need to push
                echo -e '\033[0;33m'
            else
                # else green
                echo -e '\033[0;32m'
            fi
        fi
    fi
}

PS1='\n[\u] \[\033[1;33m\]\W\a\[\033[0m\] \[$(git_color)\]$(__git_ps1 "(%s)\[\033[00m\]")\n\$ '

source git-completion.sh

#Aliases
alias ls="ls --color=auto"
alias vh='vagrant halt'
alias vs='vagrant suspend'
alias projetos='cd /Volumes/Files/Projects/sandbox'

#Ruby local

#export PATH=/usr/local/bin:$PATH
