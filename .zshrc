# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

eval "$(starship init zsh)"
autoload -Uz compinit
compinit
# End of lines added by compinstall

. "$HOME/.atuin/bin/env"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export EDITOR=nvim

export FZF_ALT_C_OPTS="
  --walker-skip .git,drive_z,z:
  --preview 'tree -C {}'"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target,drive_z,z:
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# Aliases
alias network='systemctl start NetworkManager'
alias update='sudo pacman -Syu'
alias zerotier='systemctl start zerotier-one.service'
alias 7z='7zz'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vencord='sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"'
alias icat='kitten icat'
alias sol='ddcutil --display 1 setvcp 10'

# Functions
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# PIPX - Python Package Manager
eval "$(register-python-argcomplete pipx)"

# Created by `pipx` on 2024-07-16 22:36:25
export PATH="$PATH:$HOME/.local/bin"

# Atuin - Better Command History
eval "$(atuin init zsh)"

zstyle ':completion:*' menu select

# bun completions
[ -s "/home/hiro/.bun/_bun" ] && source "/home/hiro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
