function ipinfo
  if test -z "$argv"
    curl -s http://ipinfo.io
  else
    curl -s http://ipinfo.io/$argv
  end
end

function thoitiet
  if test -d $argv
    curl -s wttr.in
  else
    curl -s wttr.in/$argv
  end
end
