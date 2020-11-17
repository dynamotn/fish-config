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

function install_kubectl
  mkdir -p ~/.local/bin
  curl -sSL https://storage.googleapis.com/kubernetes-release/release/(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o ~/.local/bin/kubectl
  chmod +x ~/.local/bin/kubectl
end

function install_helm
  mkdir -p ~/.local/bin
  set -l helmver (curl -sSL https://api.github.com/repos/helm/helm/releases/latest | grep -Po "tag_name\": \"(\K.*)(?=\",)")
  set -l temp (mktemp)
  curl -sSL "https://get.helm.sh/helm-$helmver-linux-amd64.tar.gz" -o $temp
  tar xzf $temp linux-amd64/helm
  mv linux-amd64/helm ~/.local/bin/helm
  chmod +x ~/.local/bin/helm
  rm -rf $temp linux-amd64
end
