# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PATH=$PATH:$HOME/bin

export EDITOR=vim
export GIT_EDITOR=vim

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

# edit and automatic reload after
alias bashrc='vim ~/.bashrc && source ~/.bashrc'

alias ..='cd ..'
alias ...='cd ../../'

alias t='tree'

alias mirrorlistgenerate='sudo reflector -l 20 --sort score -p http -p https --save /etc/pacman.d/mirrorlist'

# directories
export bookspath='/data/books'
alias cdbooks='c;cd $bookspath;ll'

export moviespath='/data/movies'
alias cdmovies='c;cd $moviespath;ll'

export musicpath='/data/music/new'
alias cdmusic='c;cd $musicpath;ll'

export tvshowspath='/data/tvshows'
alias cdtvshows='c;cd $tvshowspath;ll'

export downloadspath='/data/downloads'
alias cddownloads='c;cd $downloadspath;ll'
alias rmdownloads='rm $downloadspath/* -i -rf;cddownloads'

export torrentspath='/data/torrents'
alias cdtorrents='c;cd $torrentspath;ll'

export tivapath='/data/torrents/tiva'
alias cdtiva='c;cd $tivapath;ll'


# *** git **********************************************************
source ~/.git-completion.bash
source ~/.git-prompt.sh

alias gs='git status -sb'
alias gl='git log --oneline'
alias gb='git branch'
alias ga='git add'
alias gco='git checkout'
alias gcm='git commit -m'

# *** golang workspace *********************************************
export GOPATH=$HOME
alias cdsrcdvrkps='c;cd $GOPATH/src/github.com/dvrkps;ll'

# *** apps *********************************************************
alias bmi='c;bima -h 1.87 -g -kg '
alias cigs='c;cigs -s 2012-02-03'

# *** tvst *********************************************************
alias cdtvst='c;cd $GOPATH/src/tvst;ll'
alias tvst='workon tvst;$HOME/src/tvst/bin/tvst;deactivate'
alias airings='workon tvst;$HOME/src/tvst/bin/airings_job;deactivate'
alias subtitles='workon tvst;$HOME/src/tvst/bin/subtitles_job;deactivate;ls /data/torrents/tiva'

alias tvstdebug='cat $HOME/src/tvst/logs/debug.log'
alias tvsterror='cat $HOME/src/tvst/logs/errors.log'
alias rmtvstlogs='rm $HOME/src/tvst/logs/* -rf'

# *** python *******************************************************
export WORKON_HOME=$HOME/.virtualenvs
source /usr/bin/virtualenvwrapper.sh
