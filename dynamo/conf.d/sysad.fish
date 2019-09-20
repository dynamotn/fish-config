# Load average
function load_avg
  uptime | awk -F'[a-z]: ' '{ print $2 }'
end

# Rsync
alias syncdy 'rsync --delete -avhz'

# Ping
alias short_ping 'ping -c 5'
alias fast_ping 'ping -c 50 -i0.2'

# Netstat
alias open_ports 'netstat -tuplan'
alias listen_ports 'netstat -tuplen'

# IP
function ip_info
  curl -s "http://ipinfo.io/$argv"
end

function ip_wan
  dig +short myip.opendns.com @resolver1.opendns.com
end

function ip_lan
  hostname -i
end

# MAC
function mac_vendor
  if test -z "$argv"
    echo "Must have MAC address"
    return 1
  end
  curl -s https://api.macvendors.com/(string escape --style=url $argv)
end
