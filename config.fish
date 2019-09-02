## Some environment variables {
# Path of Fish config
set -gx CONFIG_PATH (dirname (readlink -f (status --current-filename)))

# GPG interface to insert passphrase
set -gx GPG_TTY (tty)
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
## }
