ulimit -S -n 4096

autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export EDITOR='nvim'
export DIFFPROG='nvim'

export PATH="$HOME/bin/:$HOME/go/bin:$PATH"
export CDPATH="$HOME/go/src/github.com/dvrkps"

PROMPT='%~ %# '

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'
alias t='tree'

function update_go_contributing_tools() {
  go get golang.org/x/tools/cmd/go-contrib-init
  go get golang.org/x/review/git-codereview
}

function update_go_tools() {
  go get github.com/golangci/golangci-lint/cmd/golangci-lint
  go get honnef.co/go/tools/cmd/staticcheck
  go get golang.org/x/tools/gopls
}