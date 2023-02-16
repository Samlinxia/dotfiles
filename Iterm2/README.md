1. Auto start tmux when open iTerm2

Add following line to Iterm2 -> Preferences > Profiles > PROFILE >Command > Send text at start
```
tmux ls && read tmux_session && tmux attach -t ${tmux_session:-default} || tmux new -s ${tmux_session:-default}
```
https://medium.com/@sasom/auto-starting-tmux-in-iterm2-4276182d452a
