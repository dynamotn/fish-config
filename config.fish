# vim:foldmethod=marker:foldmarker={,}
## Some environment variables {
# Path of Fish config
set -gx CONFIG_PATH (dirname (readlink -f (status --current-filename)))

# GPG interface to insert passphrase
set -gx GPG_TTY (tty)

# PATH
if test -e $HOME/.local/bin
  set -gx PATH $HOME/.local/bin $PATH
end
if test -e $CONFIG_PATH/../bin
  set -gx PATH $CONFIG_PATH/../bin $PATH
end

# Set default editor
command -s nvim > /dev/null; and begin
  set -gx EDITOR nvim
  alias vim 'nvim'
  alias vimdiff 'nvim -d'
end;
or set -gx EDITOR vim

# Set pet projects location
if test -e $HOME/.project
  set -gx PROJECT_PATHS (string split ' ' -- (sed ':a;N;$!ba;s/\n/ /g' $HOME/.project | sed "s|~|$HOME|g"))
end

# Fzf config
set -U FZF_TMUX 1
set -U FZF_COMPLETE 2
## }

## Theme config {
set -g theme_date_format "+%a %H:%M"
set -g theme_show_exit_status yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal
## }

## Fish or shell miscelaneous config {
# Enable vi key bindings
fish_vi_key_bindings

# DIRCOLOR for ls
if type -q grc
  set -U grcplugin_ls --color -C
end
eval (dircolors -c $CONFIG_PATH/DIRCOLORS 2> /dev/null)
## }

## Other tools {
# ASDF
if test -e $HOME/.asdf/asdf.fish
  . ~/.asdf/asdf.fish
end
## }
