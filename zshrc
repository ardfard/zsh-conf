# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias e="subl -n"
alias rs=bin/rails
alias rk=bin/rake
alias launch-mongo="mongod --config /usr/local/etc/mongod.conf &"

# push git repo current branch
alias push-current="git push origin HEAD"

# cabal aliases

alias ghc-sandbox="ghc -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias ghci-sandbox="ghci -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"
alias runhaskell-sandbox="runhaskell -no-user-package-db -package-db .cabal-sandbox/*-packages.conf.d"

# kubectl aliases
alias krb='kubectl run bash'
alias kgp='kubectl get po'
alias kgd='kubectl get deployment'
alias kgs='kubectl get service'
alias kdp='kubectl describe pod'
alias kds='kubectl describe service'
alias kdd='kubectl describe deployment'
alias ke='kubectl exec'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias keti='kubectl exec -ti $1 $2'
alias kati='kubectl attach -ti'

# rspec alias
alias test-app='bin/rspec --fail-fast spec/ -fh > output_rspec.html'

export PATH=$PATH:/usr/local/sbin

alias rake='noglob rake'

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/.local/bin/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "$HOME/.local/bin/google-cloud-sdk/completion.zsh.inc"

# golang related

export GOPATH="$HOME/golang"
export PATH=$PATH:$GOPATH/bin

export PATH="$PATH:$HOME/.local/bin"

# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
#
# # Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
#
# # Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
#
# # Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

# Docker shortcuts
alias dr='docker run'

# Emacs shortcuts
alias ec='emacsclient -n'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add nix support
# . ~/.nix-profile/etc/profile.d/nix.sh

# Tmuxinator completion
source ~/.local/bin/tmuxinator.zsh

export EDITOR=vim


# kubectl completion
#kubectl completion zsh
export PATH="/usr/local/opt/vim@7.4/bin:$PATH"

function kfres() kubectl get $1 | grep -ie $2
function kfp() kfres pod $1
function kfd() kfres deployment $1
function kfti() {
  pod=`kfp $1 | awk '{print $1}' | head -n 1`
  keti $pod $2
}
function kafti(){
  pod=`kfp $1 | awk '{print $1}' | head -n 1`
  kati $pod
}

source ~/.platform_spesific.zsh
