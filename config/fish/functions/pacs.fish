function pacs --description "Search packages"
  paru -S $(paru -Slq | fzf --preview 'paru -Si {}' --multi)
end
