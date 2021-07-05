function __fzf_gcloud_instance_ssh -d "SSH to Gcloud instance"
  eval "$FZF_GCLOUD_INSTANCE_SEARCH_COMMAND | "(__fzfcmd) "-m $FZF_DEFAULT_OPTS --ansi" | read -l select

  if not test -z "$select"
    set -l instance (echo $select | awk '{ print $1 }')
    set -l zone (echo $select | awk '{ print $2 }')
    gcloud compute ssh --zone "$zone" "$instance"
  end
end
