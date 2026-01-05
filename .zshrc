# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"

# plugins=(git taskwarrior ssh )

# source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export TERM=xterm-256color

alias ll="ls -a1"
alias l="ls -1"
alias x="open"
alias c="clear"
alias vim="nvim"
alias scm-ssh-add='SSH_AUTH_SOCK=~/.ssh/scm-agent.sock ssh-add'
alias t="task"

[[ -e "/Users/ccarral/lib/oci_autocomplete.sh" ]] && source "/Users/ccarral/lib/oci_autocomplete.sh"

alias ctags=`brew --prefix`/bin/ctags

alias get_oci="source ~/venv/oci-cli/bin/activate"
alias get_seeks="source ~/venv/seeks/bin/activate"
alias bugwarrior_pull="source ~/venv/bugwarrior/.venv/bin/activate && bugwarrior pull && deactivate"
alias cat="/opt/homebrew/bin/bat"
alias python="python3"
alias pull_ssh_config="git -C ${HOME}/.ssh/yum-service-ssh-config pull scm master"

export "PATH=$HOME/.bin:$PATH"
export "PATH=$HOME/Code/oracle_scripts/bin:$PATH"


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ccarral/.lmstudio/bin"

# DevOps SCM
# 1. ssh-agent -a ~/.ssh/scm-agent.sock
# 2. scm-ssh-add -s /usr/lib64/opensc-pkcs11.so
# 3. renew step 2
alias scm-ssh-add='SSH_AUTH_SOCK=~/.ssh/scm-agent.sock ssh-add'
alias scm-renew='scm-ssh-add -e /usr/lib64/opensc-pkcs11.so ; scm-ssh-add -s /usr/lib64/opensc-pkcs11.so'

scm-fix () {
    rm -f ~/.ssh/scm-agent.sock
    ssh-agent -a ~/.ssh/scm-agent.sock
    scm-ssh-add -e  /usr/local/lib/opensc-pkcs11.so ; scm-ssh-add -s /usr/local/lib/opensc-pkcs11.so
}
eval "$(starship init zsh)"
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
bindkey '^[[A' history-substring-search-up  
bindkey '^[[B' history-substring-search-down
bindkey              '^I' menu-select
bindkey "$terminfo[kcbt]" menu-select
bindkey -M menuselect              '^I'         menu-complete
bindkey -M menuselect "$terminfo[kcbt]" reverse-menu-complete
