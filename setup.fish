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
end

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --bin

# Install fish package
fish -c "fisher add < $SETUP_DIR/.pkg"
fish -c "fisher add $SETUP_DIR/dynamo"
