#!/usr/bin/env fish
set SETUP_DIR (dirname (readlink -m (status --current-filename)))
set UPDATE false
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
fisher add <$SETUP_DIR/.pkg
fisher add $SETUP_DIR/dynamo
