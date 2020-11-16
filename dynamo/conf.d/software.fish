function install_gcloud
  if type -q gcloud; or test -e $HOME/.local/google-cloud-sdk
    return
  end

  curl -SL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-318.0.0-linux-x86_64.tar.gz -o /tmp/gcloud-sdk.tar.gz
  mkdir -p $HOME/.local
  tar xvzf /tmp/gcloud-sdk.tar.gz -C $HOME/.local; and rm -f /tmp/gcloud-sdk.tar.gz
end

function install_asdf
  if type -q asdf; or test -e $HOME/.asdf
    return
  end

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end
