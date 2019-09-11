set -q FZF_TMUX_HEIGHT; or set -U FZF_TMUX_HEIGHT "40%"
set -q FZF_DEFAULT_OPTS; or set -U FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
set -q FZF_LEGACY_KEYBINDINGS; or set -U FZF_LEGACY_KEYBINDINGS 1
set -q FZF_PREVIEW_FILE_CMD; or set -U FZF_PREVIEW_FILE_CMD "head -n 10"
set -q FZF_PREVIEW_DIR_CMD; or set -U FZF_PREVIEW_DIR_CMD "ls"
set -q FZF_GIT_DIFF_FILE_CMD; or set -U FZF_GIT_DIFF_FILE_CMD "git diff --color=always -- \$path"
set -q FZF_GIT_LOG_CMD; or set -U FZF_GIT_LOG_CMD "git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative --color=always \$branch"
set -q FZF_GIT_SHOW_CMD; or set -U FZF_GIT_SHOW_CMD "git show --color=always --date=relative --abbrev-commit \$commit"
set -q FZF_GIT_COMMIT_SEARCH_COMMAND; or set -U FZF_GIT_COMMIT_SEARCH_COMMAND "git log --color --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

function fzf_uninstall -e fzf_uninstall
    # disabled until we figure out a sensible way to ensure user overrides
    # are not erased
    # set -l _vars (set | command grep -E "^FZF.*\$" | command awk '{print $1;}')
    # for var in $_vars
    #     eval (set -e $var)
    # end
end
