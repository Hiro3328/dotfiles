function c --wraps=7zz --description="Compacts files into same name.7z"
  7z a (basename $argv /).7z $argv
end
