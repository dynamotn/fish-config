function __fzf_gcloud_instance_ssh -d "SSH to Gcloud instance"
  eval "$FZF_GCLOUD_ACTIVE_INSTANCE_SEARCH_COMMAND | "(__fzfcmd) "-m $FZF_DEFAULT_OPTS --ansi" | read -l select

  if test -z "$select"
    return 1
  end

  set -l instance (echo $select | awk '{ print $1 }')
  set -l zone (echo $select | awk '{ print $2 }')
    __tmux_rename_window $instance
  gcloud compute ssh --zone "$zone" "$instance" -- tmux
  __tmux_recover_name_window
end
