function fish_greeting -d "What's up, fish?"
  cat $CONFIG_PATH/logo
  set_color $fish_color_autosuggestion
  uname -nmsr

  command -s uptime > /dev/null
  and uptime

  set_color normal
end
