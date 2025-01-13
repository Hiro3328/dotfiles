function list-packages  --description "List installed packages"
  switch $argv[1]
    case -a
      pacman -Qq | fzf --preview 'pacman -Qi {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | bat)'
    case -t
      pacman -Qqt | fzf --preview 'pacman -Qi {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | bat)'
    case -s 
      find /var/lib/pacman/local/ -mindepth 1 -maxdepth 1 -type d -printf "%TY-%Tm-%Td %TH:%TM %P\n" | sort -r | fzf --reverse --preview 'pacman -Qi $(string split " " $(string replace -r -a "\-[\w|\d|:|+\.]+-[\d|\w?.]+\$" "" {}))[-1]'
    case "*"
      echo "Usage: list-packages [-a | -t | -s]"
  end
end
