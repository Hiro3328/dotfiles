fish_config theme choose "Rosé Pine"
fish_add_path --path $HOME/.local/bin
fish_add_path --path $HOME/bin
starship init fish | source
set -x BAT_THEME Catppuccin-mocha
set -x EDITOR nvim
set -x fish_greeting ""

set -x FZF_DEFAULT_OPTS " --walker-skip .git,drive_z,z:
                          --preview 'tree -C {}'"


if status is-interactive   
  atuin init fish | source
  fzf --fish | source
end
if status --is-login    
    
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
