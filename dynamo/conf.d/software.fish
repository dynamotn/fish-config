function install_gcloud
  if type -q gcloud; or test -q asdf
    return
  end

  asdf plugin-add gcloud
  asdf install gcloud latest
end

function install_awscli
  if type -q awscli; or test -q asdf
    return
  end

  asdf plugin-add awscli
  asdf install awscli latest
end

function install_asdf
  if type -q asdf; or test -e $HOME/.asdf
    return
  end

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
  mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

function install_kubectl
  if type -q kubectl; or test -q asdf
    return
  end

  asdf plugin-add kubectl
  asdf install kubectl latest
end

function install_helm
  if type -q helm; or test -q asdf
    return
  end

  asdf plugin-add helm
  asdf install helm latest
end

function install_terraform
  if type -q terraform; or test -q asdf
    return
  end

  asdf plugin-add terraform
  asdf install terraform latest
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

function install_pre_commit
  if type -q pre-commit
    return
  end

  type -q pip3; and pip3 install pre-commit
  type -q asdf; and asdf reshim python
end
