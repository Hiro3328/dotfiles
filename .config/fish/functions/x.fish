function x --wraps=7zz --description="Unpacks files into same name folder"
  7zz x $argv -o(string split -f1 '.' $argv)
end
