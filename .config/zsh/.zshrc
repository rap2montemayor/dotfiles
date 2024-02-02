# if [ "$TMUX" = "" ]; then
#   tmux attach 2> /dev/null || tmux && exit
# fi

# History
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias ls='ls --color=auto --group-directories-first -h'
alias grep='grep --color=auto'
alias yt-dlp='yt-dlp --downloader aria2c --downloader-args aria2c:"-x16 -s16 -j16"'
alias vim='nvim'
alias nvimrc='nvim ~/.config/nvim/init.lua'
alias vimrc='nvim ~/.config/nvim/init.lua'
alias zshrc='nvim ~/.config/zsh/.zshrc'
alias py_initvenv='python -m venv .venv && source .venv/bin/activate && pip install --upgrade pip && pip install pip-tools'
alias py_activate='source .venv/bin/activate'
alias py_install='pip-compile && pip install -r requirements.txt'
alias py_activate_install='py_activate && py_install'

# Programming language version managers
source /usr/share/nvm/init-nvm.sh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# lf wrapper to change directory on exit
lf () {
  tmp="$(mktemp)"
  command lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
    print -P "%F{33} %F{34}Installation successful.%f%b" || \
    print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit load zdharma-continuum/history-search-multi-word
zinit load zsh-users/zsh-syntax-highlighting

zinit ice atload"zpcdreplay" atclone"./zplug.zsh" atpull"%atclone"
zinit light g-plane/pnpm-shell-completion

eval "$(starship init zsh)"

# pnpm
export PNPM_HOME="/home/raprap/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
