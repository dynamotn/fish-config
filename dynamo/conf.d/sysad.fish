# Load average
function load_avg
  uptime | awk -F'[a-z]: ' '{ print $2 }'
end

# Rsync
aliasdy syncdy 'rsync --delete -avhz'

# Ping
aliasdy shortping 'ping -c 5'
aliasdy fastping 'ping -c 50 -i0.2'

# Netstat
aliasdy openports 'netstat -tuplan'
aliasdy listenports 'netstat -tuplen'

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
