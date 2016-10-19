# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Paths
export PATH=$PATH:$HOME/bin
export GOPATH=$HOME
export CDPATH=.:$HOME:/data:/usr/local/go:$GOPATH/src/github.com/golanghr:$GOPATH/src/github.com/dvrkps:$GOPATH/src/bitbucket.org/dvrkps

export EDITOR=nvim

export DIFFPROG=nvim

export bookspath='/data/books'
export downloadspath='/data/downloads'
export moviespath='/data/movies'
export musicpath='/data/music/new'
export torrentspath='/data/torrents'
export tivapath='/data/torrents/tiva'
export tvshowspath='/data/tvshows'




# Make sure window sizes update correctly.
shopt -s checkwinsize


# Bash completion
. /usr/share/bash-completion/bash_completion


if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi


PS1='\n\w\n$(__git_ps1 "(%s) ")$ '


alias ls='ls --color=auto'
alias ll='ls -ahlF'
alias la='ls -A'
alias l='ls -CF'

alias poweroff='systemctl poweroff'
alias reboot='systemctl reboot'
alias suspend='systemctl suspend'

alias c='clear'

alias ..='cd ..'
alias ...='cd ../../'

alias t='tree'

alias vim='nvim'

alias mirrorlistgenerate='sudo reflector -l 20 --sort score -p http -p https --save /etc/pacman.d/mirrorlist'

alias cdtiva='c;cd $tivapath;ll'
alias cdmusic='c;cd $musicpath;ll'


# *** themes *******************************************************
alias solardark='xrdb -DSOLARIZED_DARK -load ~/.Xresources'
alias solarlight='xrdb -DSOLARIZED_LIGHT -load ~/.Xresources'

# *** git **********************************************************
export GIT_PS1_SHOWDIRTYSTATE=1
source ~/.git-completion.bash
source ~/.git-prompt.sh


# *** apps *********************************************************
alias bckp='becca -s /home/dvrkps/cloud -d /data/backup'
alias bmi='c;bima -h 1.87 -g -kg'
alias cigs='c;cigs -s 2012-02-03'
alias torrents='transmission-daemon;transmission-remote-cli'
alias mnt='sudo mona'

# *** tvst *********************************************************
# alias cdtvst='c;cd $GOPATH/src/tvst;ll'
# alias tvst='workon tvst;$HOME/src/tvst/bin/tvst;deactivate'
# alias airings='workon tvst;$HOME/src/tvst/bin/airings_job;deactivate'
# alias subtitles='workon tvst;$HOME/src/tvst/bin/subtitles_job;deactivate;ls /data/torrents/tiva'

# alias tvstdebug='cat $HOME/src/tvst/logs/debug.log'
# alias tvsterror='cat $HOME/src/tvst/logs/errors.log'
# alias rmtvstlogs='rm $HOME/src/tvst/logs/* -rf'

# *** python *******************************************************
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
