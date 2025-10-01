fish_config theme choose "Rosé Pine"
fish_add_path --path $HOME/.local/bin
fish_add_path --path $HOME/.cargo/bin/
fish_add_path --path $HOME/.atuin/bin/
zoxide init fish --cmd cd | source

set -x XDG_RUNTIME_DIR /run/user/1000/
set -x EDITOR nvim
set -x fish_greeting ""
set -x OZONE_PLATFORM_HINT "auto"
set -x FZF_DEFAULT_OPTS " --walker-skip .git,dosdevices
                          --preview 'tree -C {}'"
source $HOME/.config/fish/aliases.fish
fish_vi_key_bindings
bind -M visual y fish_clipboard_copy
bind p fish_clipboard_paste
bind -M insert up _atuin_bind_up

if status is-interactive   
  fzf --fish | source
  pyenv init - fish | source
  starship init fish | source
	atuin init fish | source
end

if status --is-login    
	pidof niri || exec dbus-run-session niri --session    
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


