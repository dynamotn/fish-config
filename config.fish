# vim:foldmethod=marker:foldmarker={,}
## Some environment variables {
# Path of Fish config
set -gx CONFIG_PATH (dirname (readlink -f (status --current-filename)))

# GPG interface to insert passphrase
set -gx GPG_TTY (tty)

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
set -U FZF_TMUX 0
set -U FZF_COMPLETE 2
## }

## Theme config {
set -g theme_date_format "+%a %H:%M"
set -g theme_show_exit_status yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_nerd_fonts yes
set -g theme_color_scheme dark
## }

## Fish or shell miscelaneous config {
# Enable vi key bindings
fish_vi_key_bindings

# DIRCOLOR for ls
alias ls "grc.wrap ls --color=always -C"
eval (dircolors -c $CONFIG_PATH/DIRCOLORS 2> /dev/null)
## }
