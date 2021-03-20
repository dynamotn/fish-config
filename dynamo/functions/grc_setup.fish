function grc_setup
  set -l execs cat cvs df diff dig gcc g++ ls ifconfig make mount mtr netstat \
       ping ps tail traceroute wdiff blkid du dnf docker docker-compose \
       docker-machine env id ip iostat journalctl kubectl last lsattr lsblk \
       lspci lsmod lsof getfacl getsebool ulimit uptime nmap fdisk findmnt \
       free sar semanage sockstat ss sysctl systemctl stat showmount tcpdump \
       tune2fs vmstat w who

  if set -q grc_plugin_execs
    set execs $grc_plugin_execs
  end

  for executable in $execs
    if type -q $executable
      function $executable --inherit-variable executable --wraps=$executable
        if isatty 1
          grc $executable $argv
        else
          eval command $executable $argv
        end
      end
    end
  end
end
