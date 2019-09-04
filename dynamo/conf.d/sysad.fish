# Load average
function load_avg
  uptime | awk -F'[a-z]: ' '{ print $2 }'
end

# Rsync
alias syncdy 'rsync --delete -avhz'

# Ping
alias shortping 'ping -c 5'
alias fastping 'ping -c 50 -i0.2'

# Netstat
alias openports 'netstat -tuplan'
alias listenports 'netstat -tuplen'

# IP
function ipwan
  if test -z "$argv"
    curl -s http://ipinfo.io
  else
    curl -s http://ipinfo.io/$argv
  end
end

function iplan
  hostname -i
end
