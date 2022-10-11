# Default Programs
export BROWSER='chromium'
export EDITOR='nvim'
export OPENER='mimeopen'
export PAGER='less'
export READER='zathura'
export TERMINAL='alacritty'

# Add .local/bin (and its subdirectories) to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# XDG directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Cleanup
export LESSHISTFILE="-"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Color output for less
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# IME setup
# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@fcitx
# export QT_IM_MODULE=fcitx

# Firefox hardware acceleration
# export MOZ_X11_EGL=1
# export MOZ_WEBRENDER=1

# Start x server with startx 
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
	startx -- -ardelay 250 -arinterval 25
fi

