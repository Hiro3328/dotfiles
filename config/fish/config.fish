fish_config theme choose "Rosé Pine"
fish_add_path --path $HOME/.local/bin
fish_add_path --path $HOME/.cargo/bin/
zoxide init fish --cmd cd | source

set -x XDG_RUNTIME_DIR /run/user/1000/
set -x EDITOR nvim
set -x fish_greeting ""

set -x FZF_DEFAULT_OPTS " --walker-skip .git,drive_z,z:
                          --preview 'tree -C {}'"
source $HOME/.config/fish/aliases.fish
fish_vi_key_bindings
bind -M visual y fish_clipboard_copy
bind p fish_clipboard_paste

if status is-interactive   
  atuin init fish | source
  fzf --fish | source
  pyenv init - fish | source
  starship init fish | source
  #oh-my-posh init fish  --config $HOME/.config/fish/oh-my-posh.omp.json | source
end
if status --is-login    
    
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

