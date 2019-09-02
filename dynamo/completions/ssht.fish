complete -xc ssht -d "Hostname" --arguments "
(__fish_print_hostnames)
(echo (commandline -ct)|sed -ne 's/\(.*@\).*/\1/p'
)(__fish_print_hostnames)
"
complete -fc ssht -s s -d "Session name"
