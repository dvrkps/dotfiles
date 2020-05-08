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
  cd ~
  go get golang.org/x/tools/cmd/go-contrib-init@latest
  go get golang.org/x/review/git-codereview@latest
  cd -
}

function update_go_tools() {
  cd ~
  go get github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go get honnef.co/go/tools/cmd/staticcheck@latest
  go get golang.org/x/tools/gopls@latest
  cd -
}

function update_gotip() {
  cd ~
  go get golang.org/dl/gotip@latest
  gotip download
  cd -
}
