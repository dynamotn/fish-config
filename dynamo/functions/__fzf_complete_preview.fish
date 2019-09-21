function __fzf_complete_preview -d 'generate preview for completion widget.
  argv[1] is the currently selected candidate in fzf
  argv[2] is a string containing the rest of the output produced by `complete -Ccmd`
  argv[3] is the currently command that need to selected preview
  '

  set -l path (string replace "~" $HOME -- $argv[1])

  if __fish_is_git_repository; and test -n $argv[2]
    if string match -qr '^[[:alpha:]]+ file$' $argv[2]
    and test $argv[2] != 'Untracked file'
      set -l pathfile (string escape $path)
      eval $FZF_GIT_DIFF_FILE_CMD
      return
    else if string match -qr '^[[:alpha:]]+ Branch$' $argv[2]; or test $argv[2] = 'Head'
      set -l branch $argv[1]
      eval $FZF_GIT_LOG_CMD
      return
    else if test $argv[2] = 'Remote'
      set -l remote $argv[1]
      eval $FZF_GIT_REMOTE_URL_CMD
      return
    else if string match -qr '^Commit.*$' $argv[2]; or test $argv[2] = 'Tag'
      set -l commit $argv[1]
      eval $FZF_GIT_SHOW_CMD
      return
    else if test $argv[3] = '__fzf_git_commit_search'
      set -l commit (echo $argv[1] | awk '{ print $1 }')
      eval $FZF_GIT_SHOW_CMD
      return
    end
  end

  # show aditional data
  if test -n $argv[2]
    echo $argv[2]\n
  end

  # list directories on preview
  if test -d "$path"
    eval $FZF_PREVIEW_DIR_CMD (string escape $path)
  end

  # if fish knows about it, let it show info
  type -q "$path" 2>/dev/null; and type -a "$path"

  # show ten lines of non-binary files preview
  if test -f "$path"; and grep -qI . "$path"
    eval $FZF_PREVIEW_FILE_CMD (string escape $path)
  end
end
