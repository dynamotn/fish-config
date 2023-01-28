#!/usr/bin/env fish
set SETUP_DIR (dirname (readlink -m (status --current-filename)))
set UPDATE false

# Install fisher
for i in (echo $argv | sed "s|--*|\n|g" | grep -v '^$')
  echo $i | read -l option value
  switch $option
    case u update
      set UPDATE true
  end
end
if not functions -q fisher; or eval $UPDATE
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  patch ~/.config/fish/functions/fisher.fish $SETUP_DIR/setup_gitlab.patch
end

source ~/.config/fish/functions/fisher.fish

# Install fish package
fisher install < $SETUP_DIR/.pkg
fisher install $SETUP_DIR/dynamo

# Install fzf
fish -c "install_fzf"
fish -c "install_nix"
fish -c "yes | fish_config theme save dynamo"

# Install DIRCOLORS
curl https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -sLo ~/.config/fish/DIRCOLORS
