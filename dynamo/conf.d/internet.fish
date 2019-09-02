function thoitiet
  if test -d $argv
    curl -s wttr.in
  else
    curl -s wttr.in/$argv
  end
end
