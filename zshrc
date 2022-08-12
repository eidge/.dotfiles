# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM='xterm-256color'
export EDITOR='nvim'
export GOPATH=$HOME/src
export PATH="$GOPATH/bin:./node_modules/.bin/:./bin:$HOME/.rbenv/bin:$HOME/npm/bin:$HOME/.rbenv/shims:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/dasht/bin:$PATH"
export LC_ALL="en_GB.UTF-8"
export KERL_BUILD_DOCS=yes # Compile erlang with docs

source ~/.secrets
# export BROWSER="echo" # This is only needed when running inside a VM.

# Intercom
export INTERCOM_USER=hugo.ribeira
export PATH=$HOME/.pilot/bin:$PATH
# eval $(pilot env)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

alias vim='nvim'
alias tmux='env TERM=xterm-256color tmux'
alias mux="tmuxinator"
alias be='bundle exec'
alias dc='docker-compose'
alias rake="noglob rake"
alias did="vim +'normal Go' +'r!date' ~/did.txt"
alias iex='iex --erl "-kernel shell_history enabled"'
alias assume-role='function(){eval $(hammer assume-role $@);}'

tldr() {
  curl "cht.sh/$1"
}

eval "$(rbenv init -)"

export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# For mac, I need to split this for both machines
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="./node_modules/.bin:$PATH"

pids_of() {
  ps aux | grep $1 | grep -v grep | awk '{print $2}'
}

transfer() {
  URL="https://0x0.st"

  if [ $# -eq 0 ]; then
      echo "Usage: 0x0.st FILE\n"
      exit 1
  fi

  FILE=$1

  if [ ! -f "$FILE" ]; then
      echo "File ${FILE} not found"
      exit 1
  fi

  RESPONSE=$(curl -# -F "file=@${FILE}" "${URL}")
  echo $RESPONSE
};
alias transfer=transfer

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails capistrano coffee github rake-fast rake ssh-agent tmux asdf)

source /usr/local/opt/asdf/asdf.sh
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Tab completion for scp
# ssh, scp, ping, host
zstyle ':completion:*:scp:*' tag-order \
      'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:scp:*' group-order \
      users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
      users 'hosts:-host hosts:-domain:domain hosts:-ipaddr:IP\ address *'
zstyle ':completion:*:ssh:*' group-order \
      hosts-domain hosts-host users hosts-ipaddr

zstyle ':completion:*:(ssh|scp):*:hosts-host' ignored-patterns \
      '*.*' loopback localhost
zstyle ':completion:*:(ssh|scp):*:hosts-domain' ignored-patterns \
      '<->.<->.<->.<->' '^*.*' '*@*'
zstyle ':completion:*:(ssh|scp):*:hosts-ipaddr' ignored-patterns \
      '^<->.<->.<->.<->' '127.0.0.<->'
zstyle ':completion:*:(ssh|scp):*:users' ignored-patterns \

zstyle -e ':completion:*:(ssh|scp):*' hosts 'reply=(
      ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) \
                      /dev/null)"}%%[# ]*}//,/ }
      ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
      ${=${${${${(@M)${(f)"$(<~/.ssh/config)"}:#Host *}#Host }:#*\**}:#*\?*}}
      )'
eval "$(scmpuff init -s)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export AWS_DEFAULT_REGION="us-east-1"

# added by travis gem
[ -f /Users/hugoribeira/.travis/travis.sh ] && source /Users/hugoribeira/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
