complete -xc sock_proxy -d "Hostname" --arguments "(__fish_print_hostnames)"
__dynamo_print_common_port | while read -l description port
  complete -xc sock_proxy -s p -d $description --arguments $port --condition __dynamo_need_argument
end
complete -fc sock_proxy -s p -d "Port"
