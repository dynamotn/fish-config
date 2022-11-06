complete -xc local_tunnel -d "Hostname" --arguments "(__fish_print_hostnames)"
__dynamo_print_common_port | while read -l description port
  complete -xc local_tunnel -s l -d $description --arguments $port --condition __dynamo_need_argument
end
complete -fc local_tunnel -s l -d "Local port"
complete -fc local_tunnel -s r -d "Remote port"
