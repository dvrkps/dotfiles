ulimit -S -n 4096

autoload -Uz compinit && compinit

zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.bash
fpath=(~/.config/zsh $fpath)

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export EDITOR='nvim'
export DIFFPROG='nvim'

export PATH="$HOME/bin/:$HOME/go/bin:/usr/local/sbin:$PATH"
export CDPATH="$HOME/go/src"

PROMPT='%~ %# '

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'
alias t='tree'

function update_go_tools() {
  # gotip
  go install golang.org/dl/gotip@latest
  # contributing tools
  go install golang.org/x/tools/cmd/go-contrib-init@latest
  go install golang.org/x/review/git-codereview@latest
  # debug and linter tools
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install honnef.co/go/tools/cmd/staticcheck@latest
  go install golang.org/x/tools/gopls@latest
}
