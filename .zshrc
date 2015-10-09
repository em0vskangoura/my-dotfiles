# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-custom-ys"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
# User configuration
# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# My aliases
alias cc='clear'
alias hh='head'
alias tt='tail'
#alias ...='cd ../../'
#alias ....='cd ../../../'
alias lsd="ls -la"
alias -g G='| grep --color=auto'

alias nettcp='netstat -atp tcp'
alias netudp='netstat -atp udp'
# display open ports && the header line
alias openPorts='sudo lsof -i | awk "/LISTEN/ || NR==1" '
alias flushDNS='dscacheutil -flushcache'

alias magicping='echo "Pinging Googles DNS servers" && ping -c 3 8.8.8.8'

alias cp='cp -iv'
alias mv='mv -iv'

# run "sublime file" to open file with the sublime GUI editor
alias sublime="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"

# alias for thefuck app: https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#
# Dirstack ! Remember recent CDed directories
#
DIRSTACKFILE="$HOME/.zshdirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
    dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
    [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}
DIRSTACKSIZE=12
#
# Dirstack ! Remember recent CDed directories
#

# Enable search by BLOBs
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
#setopt pushdignoredups
#
### This reverts the +/- operators.
#setopt pushdminus



# opens a man page in Preview app
function manp() {
    local page
    if (( $# > 0 )); then
        for page in "$@"; do
            man -t "$page" | open -f -a preview
        done
    else
        print 'what manual page do you want?' >&2
    fi
}

# extracts some of the most known archives

function extract() {
    if [ -f "$1" ]; then
        
        case "$1" in
            *.rar)      unrar e "$1"    ;;
            *.tar.bz2)  tar vxjf "$1"   ;;
            *.tar.gz)   tar vxzf "$1"   ;;
            *.tar)      tar xvf "$1"    ;;
            *.tgz)      tar xvzf "$1"   ;;
            *.zip)      unzip "$1"      ;;           
            *.gz)       gunzip "$1"     ;;
            *)
                echo "$1" " cannot be extracted via extract()"
            ;;
        esac

    else
        echo "$1" " is not a valid file.."
    fi

}

# mkdir && cd to newly created directory
function mkcd
{
    command mkdir $1 && cd $1
}

# Use Spotlights metadata to search for items
function magicfind() { mdfind "kMDItemDisplayName == '$@'c"; }

# Google for the given keyword
function google() { open "http://www.google.com/search?q=$1"; }
