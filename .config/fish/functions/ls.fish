function ls --wraps='eza -a --color=always --group-directories-first' --description 'alias ls=eza -a --color=always --group-directories-first'
  eza -a --color=always --group-directories-first $argv; 
end
