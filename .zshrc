# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"

export PATH="$HOME/bin/MATLAB/R2017a/bin:$PATH"
export PATH="$HOME/.npm/bin/:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))

# Para las chingaderas de oracle
# export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_3:$LD_LIBRARY_PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [ "$(whoami)" = "carlos-II" ]; then
    ZSH_THEME="robbyrussell"
else
    ZSH_THEME="rkj-repos"
fi


# ZSH_THEME="random"

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
# plugins=(git jump rust dotenv docker)
plugins=(git jump rust postgres docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


export TERM=xterm-256color

export PGDATA=~/.db

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh # users are encouraged to define aliases within the ZSH_CUSTOM folder.  # For a full list of active aliases, run `alias`.  #
# Example aliases
# alias zshconfig="mate ~/.zshrc"
#
AUTO_CD="false"


alias ll="ls -a1"
alias l="ls -1"
alias x="xdg-open"
alias c="clear"
alias vim="nvim"
alias ssp="systemctl suspend"
alias hiber="systemctl hibernate"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias serve="browser-sync start --server --files"
alias svim="/usr/bin/nvim --noplugin -u ~/.simplerc"
alias get_idf=". ~/Proyectos/stm32/micropython/ports/esp32/esp-idf/export.sh"

# fortune | cowsay

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s $HOME/.sdkman/bin/sdkman-init.sh ]] && source $HOME/.sdkman/bin/sdkman-init.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>>> Vagrant command completion (start)
fpath=(/usr/share/vagrant/gems/gems/vagrant-2.2.19/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)


# Vauxoo

VAUXOO="${HOME}/Vauxoo"
DOCKER_PATH="$VAUXOO/t2d"
alias t2d="travisfile2dockerfile --root-path=${DOCKER_PATH} --run-extra-args='-it -e LANG=en_US.UTF-8' --add-remote=vauxoo"
