# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. "$HOME/.local/bin/env"

alias ll='ls -al'
alias pull='git pull origin'
alias push='git push origin'
alias merge='git merge'
alias wt='git worktree'
alias rebasefrom="git fetch origin $1:$1 && git rebase $1 --autostash"
alias rebasemain='git fetch origin main:main && git rebase main --autostash'
alias gitCleanup='~/bin/git-cleanup'
alias redisc='redis-commander'
alias ttop='top -ocpu -R -F -s 2 -n30'
alias reloadzsh='source ~/.zshrc'
alias updatebrew='brew update && brew upgrade && brew doctor'
alias delete_dsstore='find . -name ".DS_Store" -type f -print -delete'
alias gal='gcloud auth login --update-adc'
alias gaal='gcloud auth application-default login'
alias vim='nvim'
alias lz='lazygit'
alias lzd='lazydocker'
alias k='kubectl'
alias workon='source .venv/bin/activate'
alias jauth='acli jira auth login --web'
alias diskspace='du -chs *'
alias ov='cd ~/github/kare/overlord && source ./platform/python/.venv/bin/activate'
alias prov='cd ~/github/kare/provisioning && source .venv/bin/activate'
alias hdiff='hunk diff'
alias hshow='hunk show'

# Networking
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'
alias fast='networkQuality -v'

findbyport() {
  lsof -i :$1 | grep LISTEN
}

realpath() {
  OURPWD=$PWD
  cd "$(dirname "$1")"
  LINK=$(readlink "$(basename "$1")")
  while [ "$LINK" ]; do
    cd "$(dirname "$LINK")"
    LINK=$(readlink "$(basename "$1")")
  done
  REALPATH="$PWD/$(basename "$1")"
  cd "$OURPWD"
  echo "$REALPATH"
}

# IDEs
function land() {
    command goland "$@" > /dev/null 2>&1 &!
}

function charm() {
    command pycharm "$@" > /dev/null 2>&1 &!
}

# Go
alias gobuild='go build ./...'
alias gotest='go test ./...'
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPRIVATE='github.com/gluru'
export DEFAULT_LOCALE='en_US'

# Custom Stuff
function mkcd () {
  command mkdir $1 && cd $1
}

# Homebrew
# for Homebrew to upgrade only every 24 hours
export HOMEBREW_AUTO_UPDATE_SECS='86400'
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# User binaries
export PATH="$PATH:/Users/emmanuelfontan/bin"

# Docker
export COMPOSE_HTTP_TIMEOUT=200
export DOCKER_BUILDKIT=1
export DOCKER_DEFAULT_PLATFORM=linux/amd64 # Sets up Docker to pull Apple-silicon-compatible images when available
export DOCKER_HOST="unix://${HOME}/.colima/default/docker.sock"
export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
# Optional: Ryuk is a cleanup container that can cause issues with Colima.
export TESTCONTAINERS_RYUK_DISABLED=true

# Docker binaries
export PATH="$PATH:/Users/emmanuelfontan/.docker/bin"

# Google Cloud
export PATH="$PATH:/opt/homebrew/share/google-cloud-sdk/bin"

# Terraform
export TFENV_ARCH=amd64

# Ansible
export ANSIBLE_VAULT_PASSWORD_FILE='/Users/emmanuelfontan/.vault_password'

# Kubernetes
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# CODEX 
export GITHUB_PAT_TOKEN=''

# Claude Code
export ANTHROPIC_API_KEY=''
export ENABLE_TOOL_SEARCH=true
export CLAUDE_CODE_DISABLE_EXPLORE_PLAN_AGENTS=1

# Pagerduty MCP
export PAGERDUTY_TOKEN=''

# Local Bin Path
export PATH="$HOME/.local/bin:$PATH"

# GPG
export GPG_TTY=$(tty)

# Jira CLI & MCP
export JIRA_API_TOKEN=''
export ATLASSIAN_EMAIL=''
export ATLASSIAN_API_TOKEN=''

# MySQL
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Intellij terminal lauchers
export PATH=$PATH:/Applications/PyCharm.app/Contents/MacOS
export PATH=$PATH:/Applications/GoLand.app/Contents/MacOS

# OpenJDK
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

eval "$(/usr/local/bin/starship init zsh)"

# Added by git-ai installer on Sun Oct  4 21:31:12 2026
export PATH="/Users/emmanuelfontan/.git-ai/bin:$PATH"
