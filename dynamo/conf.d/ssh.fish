# Run tmux when ssh
function ssht
  getopts $argv | while read -l key value
    switch "$key"
      case _
        if test -z "$server"
          set server $value
        else
          set server $server $value
        end
      case s
        set session $value
    end
  end
  if not test -n "$server"
    echo "Must have hostname"
    return
  end
  if test -z "$session"
    ssh -t $server tmux at; or ssh -t $server tmux new
  else
    ssh -t $server tmux at -t $session; or ssh -t $server tmux new -s $session
  end
end

# Forward port from server to local
function remote_tunnel
  getopts $argv | while read -l key value
    switch "$key"
      case _
        if test -z "$server"
          set server $value
        else
          set server $server $value
        end
      case r
        set remote_port $value
      case l
        set local_port $value
    end
  end
  if not test -n "$server"
    echo "Must have hostname"
    return
  end
  if not test -n "$remote_port"
    echo "Must have remote port"
    return
  end
  if not test -n "$local_port"
    echo "Must have local port"
    return
  end
  ssh -L $local_port:localhost:$remote_port -N -f $server
end

# Forward port from local to server
function local_tunnel
  getopts $argv | while read -l key value
    switch "$key"
      case _
        if test -z "$server"
          set server $value
        else
          set server $server $value
        end
      case r
        set remote_port $value
      case l
        set local_port $value
    end
  end
  if not test -n "$server"
    echo "Must have hostname"
    return
  end
  if not test -n "$remote_port"
    echo "Must have remote port"
    return
  end
  if not test -n "$local_port"
    echo "Must have local port"
    return
  end
  ssh -R $remote_port:localhost:$local_port -N -f $server
end

# Create SOCK5 proxy via server on local
function sock_proxy
  getopts $argv | while read -l key value
    switch "$key"
      case _
        if test -z "$server"
          set server $value
        else
          set server $server $value
        end
      case p
        set port $value
    end
  end
  if not test -n "$server"
    echo "Must have hostname"
    return
  end
  if not test -n "$port"
    echo "Must have port"
    return
  end
  ssh -f -C2qTnN -D $port $server
end

# Common port function to used for completions
function __dynamo_print_common_port
  echo 'Wake-on-LAN' 9
  echo 'FTP' 20
  echo 'FTP' 21
  echo 'SSH' 22
  echo 'Telnet' 23
  echo 'SMTP' 25
  echo 'DNS' 53
  echo 'DHCP' 67
  echo 'DHCP' 68
  echo 'HTTP' 80
  echo 'IMAP' 143
  echo 'LDAP' 389
  echo 'HTPPS' 443
  echo 'Samba' 445
  echo 'SMTPS' 465
  echo 'Syslog' 514
  echo 'LPD' 515
  echo 'CUPS' 631
  echo 'rsync' 873
  echo 'MySQL' 3306
end

# Prevent show when not have argument
function __dynamo_need_argument
  set cmd (commandline -opc)
  if test (count $cmd) = 1
    return 1
  else
    set accept_argument "-l" "-r" "-p"
    if contains -- $cmd[-1] $accept_argument
      return 0
    end
    return 1
  end
  return 1
end
