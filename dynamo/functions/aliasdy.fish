function aliasdy --argument alias command
  if begin test -n "$alias"; test -n "$command"; end
    eval "function $alias; $command \$argv; end"
    if expr $command : '^sudo ' > /dev/null ^&1
      set command (echo "$command" | cut -c6-)
    end
    complete -c $alias -xa "(
      set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
      complete -C\"$command \$cmd\";
    )"
  else
    echo "Must have 2 arguments"
  end
end
