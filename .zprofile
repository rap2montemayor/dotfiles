# Default Programs
export BROWSER='chromium'
export EDITOR='nvim'
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
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh

# Color output for less and man
export LESS='-R --use-color -Dd+r$Du+b$'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-P -c"

# Podman socket
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# IME setup
# export GTK_IM_MODULE=fcitx
# export XMODIFIERS=@fcitx
# export QT_IM_MODULE=fcitx

# Firefox hardware acceleration
# export MOZ_X11_EGL=1
# export MOZ_WEBRENDER=1

# Hyprland Variables
export XCURSOR_SIZE=24
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland;xcb
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1

# Start Hyprland 
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
then
  Hyprland
fi

# Start x server with startx 
# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]
# then
# 	startx -- -ardelay 250 -arinterval 25
# fi

