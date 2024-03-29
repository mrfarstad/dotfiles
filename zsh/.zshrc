# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Path to ssh
export SSH_KEY_PATH=$HOME/.ssh/rsa_id

# Add ssh-agent
ssh-add 2> /dev/null

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="alanpeabody"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#

function c() {
  cd ~/Code/"$1"
}

function df() {
  cd ~/dotfiles/"$1"
}

function lg() {
  cd ~/Code/lego/"$1"
}

function lw() {
  cd ~/Code/lego-webapp/"$1"
}

#function s() {
#  cd ~/Code/specialization_project/"$1"
#}
#
#function m() {
#  cd ~/Code/master_thesis/"$1"
#}
#
#function t() {
#  cd ~/Code/thesis/"$1"
#}
#
#function tp() {
#  cd ~/Code/thesis_plotter/"$1"
#}

function cl() {
  cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"$1"
}

function clm() {
  cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/datateknologi/master/"$1"
}

#function p() {
#  pandoc -r markdown-auto_identifiers --top-level-division=chapter -o "$1".tex "$1".md
#}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export PATH="/usr/local/opt/llvm/bin:$PATH"
#
#For compilers to find openblas you may need to set:
export LDFLAGS="-L/usr/local/opt/openblas/lib"
export CPPFLAGS="-I/usr/local/opt/openblas/include"

#For pkg-config to find openblas you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

# For editors to recognise openblas
export C_INCLUDE_PATH="/usr/local/opt/openblas/include"

# Need this to compile openmp using gcc-9 instead of gcc which comes with Command Line Tools. gcc-9 lies in /usr/local/Cellar/gcc/9.2.0_2/bin/gcc-9
export PATH=/usr/local/bin:$PATH

# Make default CC argument in Makefiles the gcc-9 compiler
#export CC='gcc-9'
export CC='gcc'

# If CC is declared (e.g. CC=gcc) in Makefile, we want to override this"
#alias make='make CC=gcc-9'

# When compiling using the shell, use gcc-9 instead of built-in gcc
#alias gcc='gcc-9'
#alias cc='gcc-9'
#alias g++='gcc-9'
#alias c++='gcc-9'

#For compilers to find ruby you may need to set:
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

#For pkg-config to find ruby you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

export LC_ALL=en_US.UTF-8

export PATH=/usr/local/opt/llvm/bin:$PATH # Add clangd
export PATH="/usr/local/anaconda3/bin:$PATH" # Add conda
export PATH=~/nvvp/bin:$PATH # Add nvvp

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
#export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home/jre


alias cat='mdcat'
alias vim='nvim'
alias tm='tmux new-session -A -s main'
alias hpc='ssh -t hpclab13 "tmux new-session -A -s main"'
#alias r='./scripts/yme/yme_example_run.sh'
#alias d='~/Code/thesis/scripts/yme/yme_gdb.sh'
#alias grammarly="open -a Grammarly"

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
        if [[ $file =~ "pdf" ]]; then
            open "$file"
        else
            vim "$file"
        fi
}
bindkey -s '^p' 'vim -c ":call Custom_files()"^M'
bindkey -s '^f' 'rga-fzf^M'
#bindkey -s '^f' 'vim -c ":Rg"^M'
