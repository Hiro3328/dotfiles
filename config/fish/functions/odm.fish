function odm
  for file in $HOME/Downloads/*.*
    set fileExt (string split '.' $file)[-1] 
    mkdir -p $HOME/Downloads/$fileExt
    mv $file $HOME/Downloads/$fileExt
    echo $file moved to $HOME/Downloads/$fileExt
  end
end
