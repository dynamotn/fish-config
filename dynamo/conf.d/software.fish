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

function install_terraform
  mkdir -p ~/.local/bin
  if not type -q jq
    echo "Please install jq first"
    return 1
  end

  set -l temp (mktemp)
  set -l pwd (pwd)
  curl -sSL (curl -sSL https://releases.hashicorp.com/terraform/index.json | jq -r '.versions[].builds[].url' | sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n | egrep -v 'rc|beta' | egrep 'linux.*amd64' |tail -1) -o $temp
  cd ~/.local/bin; and unzip -qqo $temp
  rm -rf $temp; and cd $pwd
end

function install_fzf
  if test -e ~/.fzf
    return
  end

  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --no-zsh --all
end

function install_cht
  mkdir -p ~/.local/bin
  curl -sSL https://cht.sh/:cht.sh -o ~/.local/bin/cht
  chmod +x ~/.local/bin/cht
end

function install_nix
  curl -sSL https://nixos.org/nix/install | sh
end
