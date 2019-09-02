Feature
========
- My ASCII art of my nickname :D
- Powerline prompt with nerd font
- `ls` with separated color for each file type
- Colored command output with `grc` for `ifconfig`, `docker`, `cat`, `gcc`, `ping`, `netstat`...
- Fish package management with `fisher`
- Fuzzy finder in shell with `fzf`
- Alias with command completion. See [alias section](#alias)

Alias
======
| Alias | Description |
|-------|-------------|
| copy | Copy command output to clipboard |
| paste | Paste clipboard to command line input |
| thoitiet | Show current weather of current network's location |
| ssht | SSH to machine and run tmux on it, with `-s` argument is session name of tmux |
| load_avg | Current load average of machine |
| syncdy | Fast rsync command |
| shortping | Ping with a few requests |
| fastping | Ping with small interval |
| openports | List all open ports |
| listenports | List all listening ports |

#### Git short command
| Alias | Full command |
|-------|--------------|
|g|`git`|
|ga|`git add`|
|gap|`ga -p`|
|gai|`ga -i`|
|gb|`git branch`|
|gbl|`git blame`|
|gc|`git commit -v`|
|gca|`gc --amend`|
|gcl|`git clean -df`|
|gco|`git checkout`|
|gcp|`git cherry-pick`|
|gd|`git diff`|
|gdb|`git branch -D`|
|gdc|`gd --cached`|
|gf|`git fetch --all -p`|
|gg|`git log --graph --pretty=format:...`|
|ggs|`gg --stat`|
|gl|`git pull`|
|gm|`gf; git merge --ff`|
|gmc|`git merge --continue`|
|gmt|`git mergetool`|
|gn|`git clone --recursive`|
|gnb|`git checkout -b`|
|gp|`git push`|
|gpo|`gp -u origin`|
|grb|`git rebase`|
|grbi|`grb -i`|
|grbc|`grb --continue`|
|grh|`git reset --hard`|
|grH|`git reset HEAD`|
|grm|`git remote`|
|grs|`git reset --soft`|
|gs|`git status`|
|gsh|`git show`|
|gsm|`git submodule`|
|gsn|`git snapshot`|
|gst|`git stash`|
|gsu|`git submodule update --init --recursive --remote`|
|gt|`git tag`|
|gw|`git whatchanged`|

Installation
=============

Clone this repository to ~/.config/fish and run setup.fish
```
rm -rf ~/.config/fish
git clone https://gitlab.com/dynamo-config/fish ~/.config/fish
~/.config/fish/setup.fish
```

License
========

Copyright © 2019 Tran Duc Nam <dynamo.foss@gmail.com>

The project is licensed under Creative Common BY-NC-SA 4.0.

You can read it online at [here](http://creativecommons.org/licenses/by-nc-sa/4.0/).
