function install_gcloud
  if type -q gcloud; or test -e $HOME/.local/google-cloud-sdk
    return
  end

  curl -SL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-318.0.0-linux-x86_64.tar.gz -o /tmp/gcloud-sdk.tar.gz
  mkdir -p $HOME/.local
  tar xvzf /tmp/gcloud-sdk.tar.gz -C $HOME/.local; and rm -f /tmp/gcloud-sdk.tar.gz
end
