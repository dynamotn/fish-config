function __tmux_recover_name_window -d "Recover tmux window to old name"
  if test -n $TMUX
    tmux rename-window $OLD_TMUX_WINDOW
  end
end
