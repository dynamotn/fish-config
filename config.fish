# vim:foldmethod=marker:foldmarker={,}
## Some environment variables {
# Path of Fish config
set -gx CONFIG_PATH (dirname (readlink -f (status --current-filename)))

# GPG interface to insert passphrase
set -gx GPG_TTY (tty)

# GO workspace
set -gx GOPATH $HOME/.go

# PATH
function __add_folder_to_path --description "Add folder to PATH"
  if test (count $argv) -ne 1
    echo 'Must has only one argument'
    return 1
  end
  if test -e $argv[1]
    set -gx PATH $argv[1] $PATH
  end
end
function __add_folder_to_manpath --description "Add folder to MANPATH"
  if test (count $argv) -ne 1
    echo 'Must has only one argument'
    return 1
  end
  if test -e $argv[1]
    set -gx MANPATH $argv[1] $MANPATH
  end
end

__add_folder_to_path $HOME/.local/bin
__add_folder_to_path $CONFIG_PATH/../scripts/bin
__add_folder_to_path $HOME/.fzf/bin
__add_folder_to_path $HOME/.yarn/bin
__add_folder_to_path $HOME/.cargo/bin
__add_folder_to_path $HOME/.go/bin
__add_folder_to_path $HOME/.local/share/nvim/mason/bin

if type -q manpath
  set -gx MANPATH (manpath -g)
end
__add_folder_to_manpath $HOME/.local/man
__add_folder_to_manpath $CONFIG_PATH/../scripts/man

# Set default editor
abbr -a v vim
command -s nvim > /dev/null; and begin
  set -gx EDITOR nvim
  alias vim 'nvim'
  alias vimdiff 'nvim -d'
  set -gx MANPAGER 'nvim +Man!'
end
or begin
  set -gx EDITOR vim
  set -gx MANPAGER 'vim -M +MANPAGER -'
end
## }

## Theme & Plugin config {
set -g theme_date_format "+%a %H:%M"
set -g theme_show_exit_status yes
set -g fish_prompt_pwd_dir_length 0
set -g theme_nerd_fonts yes
set -g theme_color_scheme terminal
set -g theme_display_k8s_context yes

set -U pisces_only_insert_at_eol 1
## }

## Fish or shell miscelaneous config {
# Enable vi key bindings
if test -n "$TERM"
  fish_vi_key_bindings
end

# grc for color output
if type -q grc
  set -U grcplugin_ls --color -Chl --group-directories-first
  set -x grcplugin_df -H
end

# DIRCOLOR for ls
eval (dircolors -c $CONFIG_PATH/DIRCOLORS 2> /dev/null)

# Color for Virtual console
if test "$TERM" = "linux"; and test $CONFIG_PATH/console_color
  for i in (sed -n "s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p" $CONFIG_PATH/console_color | awk '$1 < 16 {printf "\\\e]P%X%s", $1, $2}')
    echo -en "$i"
  end
  set -g theme_nerd_fonts no
end
## }

## Other tools {
# Fzf config
type -q __fzf_setup; and __fzf_setup
set -U FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--cycle --layout=reverse --preview-window=wrap \
--marker=\"*\" --prompt=\" \" --pointer=\"=>\""
set -U FZF_TMUX 1
if type -q fdfind
  alias fd fdfind
end
if type -q fd
  set -U FZF_FIND_FILE_COMMAND "fd -Ht f -E .git . \$dir 2> /dev/null"
  set -U FZF_CD_COMMAND "fd -t d . \$dir 2> /dev/null"
  set -U FZF_CD_WITH_HIDDEN_COMMAND "fd -Ht d -E .git . \$dir 2> /dev/null"
end

# ASDF
if test -e $HOME/.asdf/asdf.fish
  . ~/.asdf/asdf.fish
end

# Direnv
type -q direnv; and direnv hook fish | source

# Zoxide
type -q zoxide; and zoxide init fish | source

# Navi
type -q navi; and navi widget fish | source

# Projekt
if type -q projekt
  projekt init fish | source
  projekt completion fish | source
  t completion fish | source
  b completion fish | source
end
## }

## Load per-machine config {
if test -e $HOME/.config/fish/secret.fish
  source $HOME/.config/fish/secret.fish
end
## }
