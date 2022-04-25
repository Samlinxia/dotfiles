# dotfiles
Steps to set up:
1.Install zsh instruciton
https://medium.com/ayuth/iterm2-zsh-oh-my-zsh-the-most-power-full-of-terminal-on-macos-bdb2823fb04c

2.Config Vim
- .vimrc
- ~/.vim/plugins.vim

3.Install Vim Vundle
https://github.com/VundleVim/Vundle.vim#quick-start

4.Install Tmux

5.Config Iterm2
- integrate with Tmux
- font, color, style, etc

## ctags
Use ctags in Vim: https://andrew.stwrt.ca/posts/vim-ctags/

### Auto-generate ctags

Easytags can help manage tags but it's slow for big repo.
https://github.com/xolox/vim-easytags

For big repro, could set up CI/CD to build ctags in repro continuously. Local dev can live pull and share the same prebuilt ctags.  In local could just build the ctags for the new and modified files.

## Tagbar
A class outline viewer for file. It create a sidebar that display ctags-generated tags of the current file, ordered by scope.
It is not a general-purpose tool for managing tags files. It only creates the tags it needs on-the-fly in-memory without creating any files.
https://github.com/preservim/tagbar/wiki
