# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set javahome
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gozilla"
#ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-256color git osx zsh-syntax-highlighting brew repo sudo knife vagrant bundler web-search)
eval `dircolors ~/.dir_colors/dircolors`

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
  source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
  source $HOME/.profile  # Read Mac .profile, if present.
fi

alias brew="sudo apt-get"
# Vim Alias
alias vim="stty stop '' -ixoff ; vim"
# Shell Aliases
## Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '

## Tmux Aliases
alias tm='tmux a'
alias tms='tmux new-session -A -s'
alias tmk='tmux kill-session -t'

## Miscellaneous Aliases
alias htop='sudo htop'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

qGit () {
  git add -A
  git commit -m $1
  git push
  return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# Path Base 
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin:
# Path Additions
path+=('/usr/local/git/bin')
path+=('/home/duxbug/programs/gcloud/google-cloud-sdk/bin')
path+=('/home/duxbug/.nvm/versions/node/v6.3.0/bin')
path+=('/home/duxbug/programs/scala-2.11.8/bin')
path+=('/home/duxbug/programs/activator/bin')
path+=('/usr/local/spark/bin')
path+=('/usr/lib/postgresql/9.6/bin')
path+=('/home/dom/.cargo/bin')
path+=('/home/duxbug/anaconda2/bin')
export path
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NVM_DIR="/home/duckzbug/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
