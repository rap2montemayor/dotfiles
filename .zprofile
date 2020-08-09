export EDITOR='vis'
export TERMINAL='st'
export BROWSER='chromium'
export READER='zathura'
export PAGER='less'
export OPENER='mimeopen'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export LESSHISTFILE="-"
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	sx
fi

