function grc.wrap -a executable
  set executable $argv[1]
  
  if test (count $argv) -gt 1
    set arguments $argv[2..(count $argv)]
  else
    set arguments
  end

  set is_allow_grc true
  if test $executable = 'env'; and test -n "$arguments"; or ! isatty 1
    set is_allow_grc false
  end

  set options_variable "grcplugin_"$executable
  set options $$options_variable

  if $is_allow_grc
    command grc -es --colour=auto $executable $options $arguments
  else
    command $executable $options $arguments
  end
end
