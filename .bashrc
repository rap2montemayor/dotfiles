#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=always'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias grep='grep --color=always'
alias diff='diff --color=always'
alias mount_user='sudo mount -o gid=users,fmask=113,dmask=002'
alias less='less -R'

man() {
    LESS_TERMCAP_md=$'\e[01;36m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[0;47;30m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

export EDITOR='nvim'
export TERMINAL='st'
export BROWSER='firefox'
export READER='zathura'

PS1="\[\e[36m\][\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[36m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\]\[\e[36m\] \[\e[m\]\W\[\e[36m\]]\[\e[m\]\\$ "
