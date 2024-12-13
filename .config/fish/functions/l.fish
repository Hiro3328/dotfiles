function l --wraps='eza -l --color=always --group-directories-first' --description 'alias l=eza -l --color=always --group-directories-first'
  eza -l --color=always --group-directories-first $argv; 
end
