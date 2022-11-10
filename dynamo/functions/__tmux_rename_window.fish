function __tmux_rename_window -d "Rename tmux window to new name" -a name
  if test -n $TMUX
    set -g OLD_TMUX_WINDOW (tmux list-windows -F '#{window_name}#{window_active}' | sed -n 's|^\(.*\)1$|\1|p')
    tmux rename-window $name
  end
end
