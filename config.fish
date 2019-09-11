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
if test -e $HOME/.fzf/bin
  set -gx PATH $HOME/.fzf/bin $PATH
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
# Fzf config
set -U FZF_TMUX 1
set -U FZF_COMPLETE 2
set -U FZF_ENABLE_OPEN_PREVIEW 1
if type -q fdfind
  alias fd fdfind
end
if type -q fd
  set -U FZF_FIND_FILE_COMMAND "fd -Ht f -E .git . \$dir 2> /dev/null"
  set -U FZF_CD_COMMAND "fd -t d . \$dir 2> /dev/null"
  set -U FZF_CD_WITH_HIDDEN_COMMAND "fd -Ht d -E .git . \$dir 2> /dev/null"
end
if type -q bat
  set -U FZF_PREVIEW_FILE_CMD "bat --color=always"
end
if type -q diff-so-fancy
  set -U FZF_GIT_DIFF_FILE_CMD "git diff -- \$pathfile | diff-so-fancy"
  set -U FZF_GIT_SHOW_CMD "git show --color=always --date=relative --abbrev-commit \$commit | diff-so-fancy"
end
if type -q emojify
  set -U FZF_GIT_LOG_CMD "git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative --color=always \$branch | emojify"
  set -U FZF_GIT_COMMIT_SEARCH_COMMAND "git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit | emojify"
end

# ASDF
if test -e $HOME/.asdf/asdf.fish
  . ~/.asdf/asdf.fish
end
## }
