ulimit -S -n 4096

autoload -Uz compinit && compinit

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export EDITOR='nvim'
export DIFFPROG='nvim'

export PATH="$HOME/bin:$HOME/go/bin:/usr/local/sbin:$PATH"
export CDPATH="$HOME/go/src:$HOME/Code"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

PROMPT='%~ %# '

alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -GwF'
alias ll='ls -alh'
alias t='tree'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

function update_go_tools() {
  # gotip
  go install golang.org/dl/gotip@latest
  # vulnerability check
  go install golang.org/x/vuln/cmd/govulncheck@latest
  # contributing tools
  go install golang.org/x/tools/cmd/go-contrib-init@latest
  go install golang.org/x/review/git-codereview@latest
  # debug and linter tools
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install honnef.co/go/tools/cmd/staticcheck@latest
  go install golang.org/x/tools/gopls@latest
}
