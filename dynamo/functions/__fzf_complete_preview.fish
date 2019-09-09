function __fzf_complete_preview -d 'generate preview for completion widget.
  argv[1] is the currently selected candidate in fzf
  argv[2] is a string containing the rest of the output produced by `complete -Ccmd`
  argv[3] is the currently command that need to selected preview
  '

  if test "$argv[2]" = "Redefine variable"
    # show environment variables current value
    set -l evar (echo $argv[1] | cut -d= -f1)
    echo $argv[1]$$evar
  else
    echo $argv[1]
  end

  set -l path (string replace "~" $HOME -- $argv[1])

  # if fish knows about it, let it show info
  type -q "$path" 2>/dev/null; and type -a "$path"

  # show aditional data
  if test -n $argv[2]
    echo $argv[2]
  end

  # list directories on preview
  if test -d "$path"
    eval $FZF_PREVIEW_DIR_CMD (string escape $path)
  end

  # show ten lines of non-binary files preview
  if test -f "$path"; and grep -qI . "$path"
    eval $FZF_PREVIEW_FILE_CMD (string escape $path)
  end
end
